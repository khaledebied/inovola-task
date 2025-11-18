import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_rate_entity.freezed.dart';
part 'currency_rate_entity.g.dart';

@freezed
class CurrencyRateEntity with _$CurrencyRateEntity {
  const factory CurrencyRateEntity({
    required String from,
    required String to,
    required double rate,
    required DateTime lastUpdated,
  }) = _CurrencyRateEntity;

  factory CurrencyRateEntity.fromJson(Map<String, dynamic> json) =>
      _$CurrencyRateEntityFromJson(json);
}
