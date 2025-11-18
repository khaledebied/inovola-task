import 'package:expense_tracker/core/helpers/di.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_entity/expense_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/repositories/expense_tracker_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecases/use_case.dart';

@injectable
class AddExpense extends UseCase<ExpenseEntity?, ExpenseEntity> {
  @override
  Future<ExpenseEntity?> call(ExpenseEntity params) async {
    final result = await getIt<ExpenseRepository>().addExpense(params);
    return result.fold((failure) => null, (success) => success);
  }
}
