import 'dart:io';
import 'package:expense_tracker/features/expense_tracker/data/model/expense_model/expense_model.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_entity/expense_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_filter_entity/expense_filter_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/pagination_entity/pagination_entity.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

abstract class ExpenseLocalDataSource {
  Future<PaginationEntity<ExpenseModel>> getExpenses(ExpenseFilterEntity filter);
  Future<ExpenseModel> addExpense(ExpenseEntity expense);
  Future<ExpenseModel> updateExpense(ExpenseEntity expense);
  Future<bool> deleteExpense(int expenseId);
  Future<List<ExpenseModel>> getUnsyncedExpenses();
  Future<void> markExpenseAsSynced(int expenseId);
  Future<void> cacheExpenses(List<ExpenseModel> expenses);
}

@Injectable(as: ExpenseLocalDataSource)
class ImplExpenseLocalDataSource extends ExpenseLocalDataSource {
  static const String _expenseBoxName = 'expenses';
  static const String _unsyncedExpenseBoxName = 'unsynced_expenses';

  @override
  Future<PaginationEntity<ExpenseModel>> getExpenses(
      ExpenseFilterEntity filter,
      ) async {
    final box = await Hive.openBox<ExpenseModel>(_expenseBoxName);

    var expenses = box.values.toList();

    // Apply filters
    expenses = _applyFilters(expenses, filter);

    // Sort by date descending
    expenses.sort((a, b) => b.date.compareTo(a.date));

    // Apply pagination
    final startIndex = (filter.page - 1) * filter.limit;
    final endIndex = startIndex + filter.limit;

    final paginatedExpenses = expenses.length > startIndex
        ? expenses.sublist(
      startIndex,
      endIndex > expenses.length ? expenses.length : endIndex,
    )
        : <ExpenseModel>[];

    return PaginationEntity<ExpenseModel>(
      data: paginatedExpenses,
      currentPage: filter.page,
      totalPages: (expenses.length / filter.limit).ceil(),
      totalItems: expenses.length,
      hasNextPage: endIndex < expenses.length,
      hasPreviousPage: filter.page > 1,
    );
  }

  @override
  Future<ExpenseModel> addExpense(ExpenseEntity expense) async {
    final box = await Hive.openBox<ExpenseModel>(_expenseBoxName);
    final unsyncedBox = await Hive.openBox<ExpenseModel>(_unsyncedExpenseBoxName);

    final model = ExpenseModel.fromEntity(expense).copyWith(
      id: DateTime.now().millisecondsSinceEpoch, // Temporary ID for offline
    );

    await box.put(model.id, model);
    await unsyncedBox.put(model.id, model); // Mark as unsynced

    return model;
  }

  @override
  Future<ExpenseModel> updateExpense(ExpenseEntity expense) async {
    final box = await Hive.openBox<ExpenseModel>(_expenseBoxName);
    final unsyncedBox = await Hive.openBox<ExpenseModel>(_unsyncedExpenseBoxName);

    final existingModel = box.get(expense.id);
    if (existingModel == null) {
      throw Exception('Expense not found');
    }

    final updatedModel = existingModel.copyWith(
      category: expense.category,
      amount: expense.amount,
      currency: expense.currency,
      convertedAmount: expense.convertedAmount,
      date: expense.date,
      description: expense.description,
      receiptPath: expense.receiptPath,
      categoryIcon: expense.categoryIcon,
      updatedAt: DateTime.now(),
    );

    await box.put(expense.id, updatedModel);
    await unsyncedBox.put(expense.id!, updatedModel); // Mark as unsynced

    return updatedModel;
  }

  @override
  Future<bool> deleteExpense(int expenseId) async {
    final box = await Hive.openBox<ExpenseModel>(_expenseBoxName);
    final unsyncedBox = await Hive.openBox<ExpenseModel>(_unsyncedExpenseBoxName);

    await box.delete(expenseId);
    await unsyncedBox.delete(expenseId);

    return true;
  }

  @override
  Future<List<ExpenseModel>> getUnsyncedExpenses() async {
    final box = await Hive.openBox<ExpenseModel>(_unsyncedExpenseBoxName);
    return box.values.toList();
  }

  @override
  Future<void> markExpenseAsSynced(int expenseId) async {
    final unsyncedBox = await Hive.openBox<ExpenseModel>(_unsyncedExpenseBoxName);
    await unsyncedBox.delete(expenseId);
  }

  @override
  Future<void> cacheExpenses(List<ExpenseModel> expenses) async {
    final box = await Hive.openBox<ExpenseModel>(_expenseBoxName);
    for (final expense in expenses) {
      await box.put(expense.id, expense);
    }
  }

  List<ExpenseModel> _applyFilters(
      List<ExpenseModel> expenses,
      ExpenseFilterEntity filter,
      ) {
    var filtered = expenses;

    // Filter by category
    if (filter.category != null && filter.category!.isNotEmpty) {
      filtered = filtered
          .where((expense) => expense.category == filter.category)
          .toList();
    }

    // Filter by date range
    DateTime? startDate;
    DateTime? endDate = filter.endDate;

    switch (filter.period) {
      case 'week':
        startDate = DateTime.now().subtract(const Duration(days: 7));
        break;
      case 'month':
        final now = DateTime.now();
        startDate = DateTime(now.year, now.month, 1);
        break;
      default:
        startDate = filter.startDate;
    }

    if (startDate != null) {
      filtered = filtered
          .where((expense) => expense.date.isAfter(startDate!))
          .toList();
    }

    if (endDate != null) {
      filtered = filtered
          .where((expense) => expense.date.isBefore(endDate!))
          .toList();
    }

    return filtered;
      }
}