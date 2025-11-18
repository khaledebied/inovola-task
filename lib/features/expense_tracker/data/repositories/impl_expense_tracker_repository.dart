import 'package:dartz/dartz.dart';
import 'package:expense_tracker/core/helpers/di.dart';
import 'package:expense_tracker/features/expense_tracker/data/data_sources/expense_local_data_source.dart';
import 'package:expense_tracker/features/expense_tracker/data/data_sources/impl_expense_tracker_data_source.dart';
import 'package:expense_tracker/features/expense_tracker/data/model/currency_rate_model/currency_rate_model.dart';
import 'package:expense_tracker/features/expense_tracker/data/model/expense_model/expense_model.dart';
import 'package:expense_tracker/features/expense_tracker/domain/repositories/expense_tracker_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/currency_rate_entity/currency_rate_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_entity/expense_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_filter_entity/expense_filter_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_summary_entity/expense_summary_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/pagination_entity/pagination_entity.dart';

@Injectable(as: ExpenseRepository)
class ImplExpenseRepository extends ExpenseRepository {
  @override
  Future<Either<Failure, PaginationEntity<ExpenseEntity>>> getExpenses(
      ExpenseFilterEntity filter,
      ) async {
    try {
      // Try to get from remote first
      final remoteResult = await getIt<ExpenseRemoteDataSource>().getExpenses(filter);

      return remoteResult.fold(
            (failure) async {
          // Fallback to local data if remote fails
          final localData = await getIt<ExpenseLocalDataSource>().getExpenses(filter);
          final entities = localData.data.map((model) => model.toEntity()).toList();

          return Right(PaginationEntity<ExpenseEntity>(
            data: [],
            currentPage: localData.currentPage,
            totalPages: localData.totalPages,
            totalItems: localData.totalItems,
            hasNextPage: localData.hasNextPage,
            hasPreviousPage: localData.hasPreviousPage,
          ));
        },
            (success) async {
          // Cache the successful response
          await getIt<ExpenseLocalDataSource>().cacheExpenses(success.data);
          final entities = success.data.map((model) => model.toEntity()).toList();

          return Right(PaginationEntity<ExpenseEntity>(
            data: [],
            currentPage: success.currentPage,
            totalPages: success.totalPages,
            totalItems: success.totalItems,
            hasNextPage: success.hasNextPage,
            hasPreviousPage: success.hasPreviousPage,
          ));
        },
      );
    } catch (e) {
      // Fallback to local data
      final localData = await getIt<ExpenseLocalDataSource>().getExpenses(filter);
      final entities = localData.data.map((model) => model.toEntity()).toList();

      return Right(PaginationEntity<ExpenseEntity>(
        data: [],
        currentPage: localData.currentPage,
        totalPages: localData.totalPages,
        totalItems: localData.totalItems,
        hasNextPage: localData.hasNextPage,
        hasPreviousPage: localData.hasPreviousPage,
      ));
    }
  }

  @override
  Future<Either<Failure, ExpenseEntity>> addExpense(ExpenseEntity expense) async {
    try {
      // Always save to local first for offline support
      final localModel = await getIt<ExpenseLocalDataSource>().addExpense(expense);

      // Try to sync with remote
      final remoteResult = await getIt<ExpenseRemoteDataSource>().addExpense(expense);

      return remoteResult.fold(
            (failure) {
          // Return local data even if remote fails
          return Right(localModel.toEntity());
        },
            (success) async {
          // Update local with server ID if successful
          // final updatedExpense = expense.copyWith(id: success.id);
          await getIt<ExpenseLocalDataSource>().markExpenseAsSynced(localModel.id!);
          return Right(success.toEntity());
        },
      );
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ExpenseEntity>> updateExpense(ExpenseEntity expense) async {
    try {
      final localModel = await getIt<ExpenseLocalDataSource>().updateExpense(expense);

      // Try to sync with remote if expense has a real ID (not temporary)
      if (expense.id != null && expense.id! < DateTime.now().millisecondsSinceEpoch - 86400000) {
        await getIt<ExpenseRemoteDataSource>().addExpense(expense); // Using add for simplicity
      }

      return Right(localModel.toEntity());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteExpense(int expenseId) async {
    try {
      await getIt<ExpenseLocalDataSource>().deleteExpense(expenseId);
      // Note: Remote deletion would be implemented similarly
      return const Right(true);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ExpenseSummaryEntity>> getExpenseSummary(
      ExpenseFilterEntity filter,
      ) async {
    try {
      final expensesResult = await getExpenses(filter.copyWith(limit: 1000)); // Get all for summary

      return expensesResult.fold(
            (failure) => Left(failure),
            (pagination) {
          final expenses = pagination.data;

          final totalExpenses = expenses
              .where((e) => e.amount > 0)
              .fold<double>(0, (sum, expense) => sum + expense.convertedAmount);

          final totalIncome = expenses
              .where((e) => e.amount < 0) // Negative amounts are income
              .fold<double>(0, (sum, expense) => sum + expense.convertedAmount.abs());

          final categoryBreakdown = <String, double>{};
          for (final expense in expenses) {
            categoryBreakdown[expense.category] =
                (categoryBreakdown[expense.category] ?? 0) + expense.convertedAmount;
          }

          return Right(ExpenseSummaryEntity(
            totalExpenses: totalExpenses,
            totalIncome: totalIncome,
            balance: totalIncome - totalExpenses,
            categoryBreakdown: categoryBreakdown,
            currency: 'USD', // Base currency
          ));
        },
      );
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CurrencyRateEntity>> getCurrencyRate(
      String from,
      String to,
      ) async {
    try {
      final result = await getIt<ExpenseRemoteDataSource>().getCurrencyRate(from, to);
      return result.fold(
            (failure) => Left(failure),
            (success) => Right(success.toEntity()),
      );
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    // Default categories - could be fetched from remote
    const categories = [
      'Food & Dining',
      'Transportation',
      'Shopping',
      'Entertainment',
      'Bills & Utilities',
      'Healthcare',
      'Travel',
      'Education',
      'Personal Care',
      'Other'
    ];

    return const Right(categories);
  }

  @override
  Future<Either<Failure, bool>> syncOfflineExpenses() async {
    try {
      final unsyncedExpenses = await getIt<ExpenseLocalDataSource>().getUnsyncedExpenses();

      if (unsyncedExpenses.isEmpty) {
        return const Right(true);
      }

      final entities = unsyncedExpenses.map((model) => model.toEntity()).toList();
      final result = await getIt<ExpenseRemoteDataSource>().syncExpenses(entities);

      return result.fold(
            (failure) => Left(failure),
            (success) async {
          // Mark all as synced
          for (final expense in unsyncedExpenses) {
            await getIt<ExpenseLocalDataSource>().markExpenseAsSynced(expense.id!);
          }
          return const Right(true);
        },
      );
    } catch (e) {
      return Left(ServerFailure());
        }
      }
}