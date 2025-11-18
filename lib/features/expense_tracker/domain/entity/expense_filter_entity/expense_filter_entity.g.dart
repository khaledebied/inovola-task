// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_filter_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseFilterEntityImpl _$$ExpenseFilterEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpenseFilterEntityImpl(
      period: json['period'] as String? ?? 'all',
      category: json['category'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$$ExpenseFilterEntityImplToJson(
        _$ExpenseFilterEntityImpl instance) =>
    <String, dynamic>{
      'period': instance.period,
      'category': instance.category,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'page': instance.page,
      'limit': instance.limit,
    };
