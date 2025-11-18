import 'package:expense_tracker/core/helpers/di.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_entity/expense_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_filter_entity/expense_filter_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/pagination_entity/pagination_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/repositories/expense_tracker_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecases/use_case.dart';

@injectable
class GetExpenses extends UseCase<PaginationEntity<ExpenseEntity>, ExpenseFilterEntity> {
  @override
  Future<PaginationEntity<ExpenseEntity>> call(ExpenseFilterEntity params) async {
    final result = await getIt<ExpenseRepository>().getExpenses(params);
    return result.fold(
          (failure) =>  PaginationEntity<ExpenseEntity>(
        data: [],
        currentPage: 1,
        totalPages: 1,
        totalItems: 0,
        hasNextPage: false,
        hasPreviousPage: false,
      ),
          (success) => success,
    );
  }
}

