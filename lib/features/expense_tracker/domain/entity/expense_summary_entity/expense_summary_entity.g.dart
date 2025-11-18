// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_summary_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseSummaryEntityImpl _$$ExpenseSummaryEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpenseSummaryEntityImpl(
      totalExpenses: (json['totalExpenses'] as num).toDouble(),
      totalIncome: (json['totalIncome'] as num).toDouble(),
      balance: (json['balance'] as num).toDouble(),
      categoryBreakdown:
          (json['categoryBreakdown'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$$ExpenseSummaryEntityImplToJson(
        _$ExpenseSummaryEntityImpl instance) =>
    <String, dynamic>{
      'totalExpenses': instance.totalExpenses,
      'totalIncome': instance.totalIncome,
      'balance': instance.balance,
      'categoryBreakdown': instance.categoryBreakdown,
      'currency': instance.currency,
    };
