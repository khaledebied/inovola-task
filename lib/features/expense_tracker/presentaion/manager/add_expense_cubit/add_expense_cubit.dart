import 'dart:io';

import 'package:expense_tracker/core/bloc/generic_cubit/generic_cubit.dart';
import 'package:expense_tracker/core/helpers/di.dart';
import 'package:expense_tracker/core/usecases/use_case.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_entity/expense_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/use_case/add_expense.dart';
import 'package:expense_tracker/features/expense_tracker/domain/use_case/get_categories.dart';
import 'package:expense_tracker/features/expense_tracker/domain/use_case/get_currency_rate.dart';
import 'package:flutter/cupertino.dart';

class AddExpenseData {
  final String category;
  final double amount;
  final String currency;
  final DateTime selectedDate;
  final String description;
  final File? receiptFile;
  final String categoryIcon;
  final List<String> availableCategories;
  final List<String> availableCurrencies;
  final bool isLoading;
  final bool isSaving;
  final double? convertedAmount;

  AddExpenseData({
    this.category = '',
    this.amount = 0.0,
    this.currency = 'USD',
    DateTime? selectedDate,
    this.description = '',
    this.receiptFile,
    this.categoryIcon = '💰',
    this.availableCategories = const [],
    this.availableCurrencies = const ['USD', 'EUR', 'GBP', 'JPY', 'CAD', 'AUD'],
    this.isLoading = false,
    this.isSaving = false,
    this.convertedAmount,
  }) : selectedDate = selectedDate ?? DateTime.now();

  AddExpenseData copyWith({
    String? category,
    double? amount,
    String? currency,
    DateTime? selectedDate,
    String? description,
    File? receiptFile,
    String? categoryIcon,
    List<String>? availableCategories,
    List<String>? availableCurrencies,
    bool? isLoading,
    bool? isSaving,
    double? convertedAmount,
    bool clearReceiptFile = false,
  }) {
    return AddExpenseData(
      category: category ?? this.category,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      selectedDate: selectedDate ?? this.selectedDate,
      description: description ?? this.description,
      receiptFile: clearReceiptFile ? null : (receiptFile ?? this.receiptFile),
      categoryIcon: categoryIcon ?? this.categoryIcon,
      availableCategories: availableCategories ?? this.availableCategories,
      availableCurrencies: availableCurrencies ?? this.availableCurrencies,
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
      convertedAmount: convertedAmount ?? this.convertedAmount,
    );
  }
}

class AddExpenseCubit extends GenericBloc<AddExpenseData> {
  AddExpenseCubit() : super(AddExpenseData()) {
    loadCategories();
  }

  void loadCategories() async {
    onUpdateData(state.data.copyWith(isLoading: true));

    try {
      final categories = await getIt<GetCategories>()(NoParams());
      onUpdateData(state.data.copyWith(
        availableCategories: categories,
        isLoading: false,
      ));
    } catch (e) {
      onFailedResponse(error: e.toString());
    }
  }

  void updateCategory(String category) {
    final icon = _getCategoryIcon(category);
    onUpdateData(state.data.copyWith(
      category: category,
      categoryIcon: icon,
    ));
  }

  void updateAmount(double amount) {
    onUpdateData(state.data.copyWith(amount: amount));

    // Convert currency if not USD
    if (state.data.currency != 'USD') {
      _convertCurrency();
    } else {
      onUpdateData(state.data.copyWith(convertedAmount: amount));
    }
  }

  void updateCurrency(String currency) {
    onUpdateData(state.data.copyWith(currency: currency));

    // Convert to USD
    if (currency != 'USD' && state.data.amount > 0) {
      _convertCurrency();
    } else {
      onUpdateData(state.data.copyWith(convertedAmount: state.data.amount));
    }
  }

  void updateDate(DateTime date) {
    onUpdateData(state.data.copyWith(selectedDate: date));
  }

  void updateDescription(String description) {
    onUpdateData(state.data.copyWith(description: description));
  }

  void updateReceiptFile(File? file) {
    onUpdateData(state.data.copyWith(
      receiptFile: file,
      clearReceiptFile: file == null,
    ));
  }

  void _convertCurrency() async {
    if (state.data.currency == 'USD') {
      onUpdateData(state.data.copyWith(convertedAmount: state.data.amount));
      return;
    }

    try {
      final rate = await getIt<GetCurrencyRate>()(
        CurrencyRateParams(from: state.data.currency, to: 'USD'),
      );

      final convertedAmount = state.data.amount * rate;
      onUpdateData(state.data.copyWith(convertedAmount: convertedAmount));
    } catch (e) {
      // Use 1:1 rate as fallback
      onUpdateData(state.data.copyWith(convertedAmount: state.data.amount));
    }
  }

  Future<bool> saveExpense(BuildContext context) async {
    if (!_validateInput()) return false;

    onUpdateData(state.data.copyWith(isSaving: true));

    try {
      final expense = ExpenseEntity(
        category: state.data.category,
        amount: state.data.amount,
        currency: state.data.currency,
        convertedAmount: state.data.convertedAmount ?? state.data.amount,
        date: state.data.selectedDate,
        description: state.data.description.isEmpty ? null : state.data.description,
        receiptPath: state.data.receiptFile?.path,
        categoryIcon: state.data.categoryIcon,
      );

      Navigator.of(context).pop(expense);
      return true;
      // final savedExpense = await getIt<AddExpense>()(expense);
      //
      // if (savedExpense != null) {
      //   // Reset form
      //   onUpdateToInitState(AddExpenseData());
      //   return true;
      // } else {
      //   onFailedResponse(error: "Failed to save expense");
      //   return false;
      // }
    } catch (e) {
      onFailedResponse(error: e.toString());
      return false;
    }
  }

  bool _validateInput() {
    if (state.data.category.isEmpty) {
      onFailedResponse(error: "Please select a category");
      return false;
    }

    if (state.data.amount <= 0) {
      onFailedResponse(error: "Please enter a valid amount");
      return false;
    }

    return true;
  }

  String _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'food & dining':
        return '🍽';
      case 'transportation':
        return '🚗';
      case 'shopping':
        return '🛍';
      case 'entertainment':
        return '🎬';
      case 'bills & utilities':
        return '💡';
      case 'healthcare':
        return '🏥';
      case 'travel':
        return '✈';
      case 'education':
        return '📚';
      case 'personal care':
        return '💅';
      default:
        return '💰';
    }
  }

  void resetForm() {
    onUpdateToInitState(AddExpenseData(
      availableCategories: state.data.availableCategories,
      availableCurrencies: state.data.availableCurrencies,
    ));
  }
}
