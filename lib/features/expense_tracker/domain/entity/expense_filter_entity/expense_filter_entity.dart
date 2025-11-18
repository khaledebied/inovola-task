import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_filter_entity.freezed.dart';
part 'expense_filter_entity.g.dart';

@freezed
class ExpenseFilterEntity with _$ExpenseFilterEntity {
  const factory ExpenseFilterEntity({
    @Default('all') String period, // 'all', 'week', 'month'
    String? category,
    DateTime? startDate,
    DateTime? endDate,
    @Default(1) int page,
    @Default(10) int limit,
  }) = _ExpenseFilterEntity;

  factory ExpenseFilterEntity.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFilterEntityFromJson(json);
}
