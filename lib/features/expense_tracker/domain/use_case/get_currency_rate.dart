import 'package:expense_tracker/core/helpers/di.dart';
import 'package:expense_tracker/features/expense_tracker/domain/repositories/expense_tracker_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecases/use_case.dart';

@injectable
class GetCurrencyRate extends UseCase<double, CurrencyRateParams> {
  @override
  Future<double> call(CurrencyRateParams params) async {
    final result = await getIt<ExpenseRepository>().getCurrencyRate(
      params.from,
      params.to,
    );
    return result.fold((failure) => 1.0, (success) => success.rate);
  }
}

class CurrencyRateParams {
  final String from;
  final String to;

  CurrencyRateParams({required this.from, required this.to});
}

