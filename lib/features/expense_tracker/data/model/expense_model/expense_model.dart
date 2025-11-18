import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_entity/expense_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

@freezed
@HiveType(typeId: 0)
class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel({
    @HiveField(0) int? id,
    @HiveField(1) required String category,
    @HiveField(2) required double amount,
    @HiveField(3) required String currency,
    @HiveField(4) required double convertedAmount,
    @HiveField(5) required DateTime date,
    @HiveField(6) String? description,
    @HiveField(7) String? receiptPath,
    @HiveField(8) required String categoryIcon,
    @HiveField(9) DateTime? createdAt,
    @HiveField(10) DateTime? updatedAt,
  }) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);

  factory ExpenseModel.fromEntity(ExpenseEntity entity) => ExpenseModel(
    id: entity.id,
    category: entity.category,
    amount: entity.amount,
    currency: entity.currency,
    convertedAmount: entity.convertedAmount,
    date: entity.date,
    description: entity.description,
    receiptPath: entity.receiptPath,
    categoryIcon: entity.categoryIcon,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}

extension ExpenseModelX on ExpenseModel {
  ExpenseEntity toEntity() => ExpenseEntity(
    id: id,
    category: category,
    amount: amount,
    currency: currency,
    convertedAmount: convertedAmount,
    date: date,
    description: description,
    receiptPath: receiptPath,
    categoryIcon: categoryIcon,
  );
}
