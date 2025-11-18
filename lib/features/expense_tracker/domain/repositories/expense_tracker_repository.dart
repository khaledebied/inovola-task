import 'package:dartz/dartz.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/currency_rate_entity/currency_rate_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_entity/expense_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_filter_entity/expense_filter_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_summary_entity/expense_summary_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/pagination_entity/pagination_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class ExpenseRepository {
  Future<Either<Failure, PaginationEntity<ExpenseEntity>>> getExpenses(
      ExpenseFilterEntity filter,
      );
  Future<Either<Failure, ExpenseEntity>> addExpense(ExpenseEntity expense);
  Future<Either<Failure, ExpenseEntity>> updateExpense(ExpenseEntity expense);
  Future<Either<Failure, bool>> deleteExpense(int expenseId);
  Future<Either<Failure, ExpenseSummaryEntity>> getExpenseSummary(
      ExpenseFilterEntity filter,
      );
  Future<Either<Failure, CurrencyRateEntity>> getCurrencyRate(
      String from,
      String to,
      );
  Future<Either<Failure, List<String>>> getCategories();
  Future<Either<Failure, bool>> syncOfflineExpenses();
}
