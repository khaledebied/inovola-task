import 'dart:math';

import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_entity/expense_entity.dart';

class ExpenseDummyDataGenerator {
  static final List<String> _categories = [
    'Food & Dining',
    'Transportation',
    'Shopping',
    'Entertainment',
    'Bills & Utilities',
    'Healthcare',
    'Travel',
    'Education',
    'Personal Care',
    'Other',
  ];

  static final Map<String, String> _categoryIcons = {
    'Food & Dining': '🍽',
    'Transportation': '🚗',
    'Shopping': '🛍',
    'Entertainment': '🎬',
    'Bills & Utilities': '💡',
    'Healthcare': '🏥',
    'Travel': '✈',
    'Education': '📚',
    'Personal Care': '💅',
    'Other': '💰',
  };

  static final List<String> _currencies = ['USD', 'EUR', 'GBP', 'CAD'];

  static final List<String> _descriptions = [
    'Lunch at downtown restaurant',
    'Uber ride to office',
    'New headphones',
    'Monthly internet bill',
    'Netflix subscription',
    'Morning coffee',
    'Pharmacy - vitamins',
    'Gas for car',
    'Dinner with friends',
    'Online course subscription',
    'Haircut',
    'Grocery shopping',
    'Flight tickets',
    'Pub lunch',
    'Movie tickets',
    'Monthly metro pass',
    'Electricity bill',
    'Weekend brunch',
    'Winter jacket',
    'Doctor visit',
    'Fast food lunch',
    'Spa treatment',
    'Concert tickets',
    'Taxi to airport',
    'Fine dining experience',
    'Programming books',
    'Electronics shopping',
    'Phone bill',
    'New Year lunch',
    'Hotel booking',
    'Gaming subscription',
    'Dental checkup',
    'Weekend breakfast',
    'Car maintenance',
    'Post-Christmas sale',
    'Christmas dinner',
    'Beauty products',
    'Water bill',
    'Streaming services',
    'Business lunch',
    'Professional certification',
    'Bus fare',
    'Medical prescription',
    'Home decoration',
    'Pizza delivery',
    'Weekend getaway',
    'Salon visit',
    'Board game night',
    'Cable TV bill',
    'Family dinner',
  ];

  // Exchange rates for currency conversion (simplified)
  static final Map<String, double> _exchangeRates = {
    'USD': 1.0,
    'EUR': 1.09,
    'GBP': 1.25,
    'CAD': 0.75,
  };

  static List<ExpenseEntity> generateDummyExpenses({int count = 100}) {
    final expenses = <ExpenseEntity>[];
    final random = Random();

    for (int i = 1; i <= count; i++) {
      final category = _categories[random.nextInt(_categories.length)];
      final currency = _currencies[random.nextInt(_currencies.length)];
      final amount = double.parse((random.nextDouble() * 500 + 5).toStringAsFixed(2));
      final convertedAmount = double.parse((amount / _exchangeRates[currency]!).toStringAsFixed(2));

      // Generate random date within last 6 months
      final now = DateTime.now();
      final daysBack = random.nextInt(180);
      final randomDate = now.subtract(Duration(days: daysBack));

      expenses.add(ExpenseEntity(
        id: i,
        category: category,
        amount: amount,
        currency: currency,
        convertedAmount: convertedAmount,
        date: randomDate,
        description: _descriptions[random.nextInt(_descriptions.length)],
        receiptPath: random.nextBool() ? 'receipt_$i.pdf' : null,
        categoryIcon: _categoryIcons[category]!,
      ));
    }

    // Sort by date (newest first)
    expenses.sort((a, b) => b.date.compareTo(a.date));
    return expenses;
  }
}
