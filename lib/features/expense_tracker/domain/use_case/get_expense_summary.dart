import 'package:expense_tracker/core/helpers/di.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_filter_entity/expense_filter_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_summary_entity/expense_summary_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/repositories/expense_tracker_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecases/use_case.dart';

@injectable
class GetExpenseSummary extends UseCase<ExpenseSummaryEntity?, ExpenseFilterEntity> {
  @override
  Future<ExpenseSummaryEntity?> call(ExpenseFilterEntity params) async {
    final result = await getIt<ExpenseRepository>().getExpenseSummary(params);
    return result.fold((failure) => null, (success) => success);
  }
}

