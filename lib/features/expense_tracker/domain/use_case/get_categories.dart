import 'package:expense_tracker/core/helpers/di.dart';
import 'package:expense_tracker/features/expense_tracker/domain/repositories/expense_tracker_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecases/use_case.dart';

@injectable
class GetCategories extends UseCase<List<String>, NoParams> {
  @override
  Future<List<String>> call(NoParams params) async {
    final result = await getIt<ExpenseRepository>().getCategories();
    return result.fold((failure) => [], (success) => success);
  }
}

