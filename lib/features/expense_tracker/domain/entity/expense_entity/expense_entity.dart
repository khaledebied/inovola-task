class ExpenseEntity {
  final int? id;
  final String category;
  final double amount;
  final String currency;
  final double convertedAmount;
  final DateTime date;
  final String? description;
  final String? receiptPath;
  final String categoryIcon;

  ExpenseEntity({
    this.id,
    required this.category,
    required this.amount,
    required this.currency,
    required this.convertedAmount,
    required this.date,
    this.description,
    this.receiptPath,
    required this.categoryIcon,
  });

  factory ExpenseEntity.fromJson(Map<String, dynamic> json) {
    return ExpenseEntity(
      id: json['id'] as int?,
      category: json['category'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      convertedAmount: (json['convertedAmount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String?,
      receiptPath: json['receiptPath'] as String?,
      categoryIcon: json['categoryIcon'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'amount': amount,
      'currency': currency,
      'convertedAmount': convertedAmount,
      'date': date.toIso8601String(),
      'description': description,
      'receiptPath': receiptPath,
      'categoryIcon': categoryIcon,
    };
  }

  /// Converts this data model to the corresponding entity
  ExpenseEntity toEntity() {
    return ExpenseEntity(
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
}
