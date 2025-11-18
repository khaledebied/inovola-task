// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyRateModelImpl _$$CurrencyRateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrencyRateModelImpl(
      from: json['from'] as String,
      to: json['to'] as String,
      rate: (json['rate'] as num).toDouble(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$CurrencyRateModelImplToJson(
        _$CurrencyRateModelImpl instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'rate': instance.rate,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
