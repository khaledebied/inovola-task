import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_summary_entity.freezed.dart';
part 'expense_summary_entity.g.dart';

@freezed
class ExpenseSummaryEntity with _$ExpenseSummaryEntity {
  const factory ExpenseSummaryEntity({
    required double totalExpenses,
    required double totalIncome,
    required double balance,
    required Map<String, double> categoryBreakdown,
    required String currency,
  }) = _ExpenseSummaryEntity;

  factory ExpenseSummaryEntity.fromJson(Map<String, dynamic> json) =>
      _$ExpenseSummaryEntityFromJson(json);
}
