import 'package:expense_tracker/features/expense_tracker/domain/entity/currency_rate_entity/currency_rate_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_rate_model.freezed.dart';
part 'currency_rate_model.g.dart';

@freezed
class CurrencyRateModel with _$CurrencyRateModel {
  const factory CurrencyRateModel({
    required String from,
    required String to,
    required double rate,
    required DateTime lastUpdated,
  }) = _CurrencyRateModel;

  factory CurrencyRateModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyRateModelFromJson(json);

  factory CurrencyRateModel.fromExchangeRateApi(
      Map<String, dynamic> json,
      String from,
      String to,
      ) {
    final rates = json['rates'] as Map<String, dynamic>;
    final rate = rates[to]?.toDouble() ?? 1.0;

    return CurrencyRateModel(
      from: from,
      to: to,
      rate: rate,
      lastUpdated: DateTime.now(),
    );
  }
}

extension CurrencyRateModelX on CurrencyRateModel {
  CurrencyRateEntity toEntity() => CurrencyRateEntity(
    from: from,
    to: to,
    rate: rate,
    lastUpdated: lastUpdated,
  );
}
