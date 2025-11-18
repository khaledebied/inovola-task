import 'package:expense_tracker/core/helpers/di.dart';
import 'package:expense_tracker/features/expense_tracker/domain/repositories/expense_tracker_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecases/use_case.dart';

@injectable
class SyncOfflineExpenses extends UseCase<bool, NoParams> {
  @override
  Future<bool> call(NoParams params) async {
    final result = await getIt<ExpenseRepository>().syncOfflineExpenses();
    return result.fold((failure) => false, (success) => success);
  }
}
