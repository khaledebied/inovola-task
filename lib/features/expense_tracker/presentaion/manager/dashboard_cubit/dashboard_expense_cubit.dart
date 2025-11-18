import 'dart:async';
import 'dart:math';
import 'package:expense_tracker/core/bloc/generic_cubit/generic_cubit.dart';
import 'package:expense_tracker/core/helpers/di.dart';
import 'package:expense_tracker/core/usecases/use_case.dart';
import 'package:expense_tracker/features/expense_tracker/data/model/expense_model/expense_model.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_entity/expense_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_filter_entity/expense_filter_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_summary_entity/expense_summary_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/pagination_entity/pagination_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/use_case/get_expense_summary.dart';
import 'package:expense_tracker/features/expense_tracker/domain/use_case/get_expenses.dart';
import 'package:expense_tracker/features/expense_tracker/domain/use_case/sync_offline_expenses.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/pages/dashboard/dummy_data.dart';

class DashboardExpenseData {
  final PaginationEntity<ExpenseEntity> expenses;
  final ExpenseSummaryEntity? summary;
  final ExpenseFilterEntity currentFilter;
  final bool isLoading;
  final bool isSyncing;

  const DashboardExpenseData({
    required this.expenses,
    this.summary,
    required this.currentFilter,
    this.isLoading = false,
    this.isSyncing = false,
  });

  DashboardExpenseData copyWith({
    PaginationEntity<ExpenseEntity>? expenses,
    ExpenseSummaryEntity? summary,
    ExpenseFilterEntity? currentFilter,
    bool? isLoading,
    bool? isSyncing,
  }) {
    return DashboardExpenseData(
      expenses: expenses ?? this.expenses,
      summary: summary ?? this.summary,
      currentFilter: currentFilter ?? this.currentFilter,
      isLoading: isLoading ?? this.isLoading,
      isSyncing: isSyncing ?? this.isSyncing,
    );
  }
}

class DashboardExpenseCubit extends GenericBloc<DashboardExpenseData> {
  Timer? _syncTimer;

  DashboardExpenseCubit()
      : super( DashboardExpenseData(
    expenses: PaginationEntity<ExpenseEntity>(
      data: [],
      currentPage: 1,
      totalPages: 1,
      totalItems: 0,
      hasNextPage: false,
      hasPreviousPage: false,
    ),
    currentFilter:  ExpenseFilterEntity(),
  )) {
    _startPeriodicSync();
    loadInitialData();
  }

  void loadInitialData({ExpenseFilterEntity? filter}) async {
    onUpdateData(state.data.copyWith(isLoading: true));

    try {
      // Update the filter if a new one is provided
      if (filter != null) {
        onUpdateData(state.data.copyWith(currentFilter: filter));
      }

      // Generate dummy data (replace with actual API call when ready)
      List<ExpenseEntity> dummyExpenses = ExpenseDummyDataGenerator.generateDummyExpenses(count: 150);
      List<ExpenseModel> dummyExpenseModels = dummyExpenses.map((e) => ExpenseModel.fromEntity(e)).toList();

      PaginationEntity<ExpenseEntity> expenses = PaginationEntity<ExpenseEntity>(
        data: dummyExpenseModels,
        currentPage: 1,
        totalPages: 1,
        totalItems: dummyExpenses.length,
        hasNextPage: false,
        hasPreviousPage: false,
      );

      // Use the current filter (either existing or newly provided)
      final summary = await getIt<GetExpenseSummary>()(state.data.currentFilter);

      onUpdateData(state.data.copyWith(
        expenses: expenses,
        summary: summary,
        isLoading: false,
      ));
    } catch (e) {
      onFailedResponse(error: e.toString());
    }
  }

   addNewExpense(ExpenseEntity expense) {
    print("objectsl");
     onUpdateData(state.data.copyWith(isLoading: true));
     PaginationEntity<ExpenseEntity>? expenses = state.data.expenses;
    final expenseModel = ExpenseModel.fromEntity(expense);
    expenses.data.insert(0, expenseModel);
    onUpdateData(state.data.copyWith(
      expenses: expenses,
      isLoading: false,
    ));
  }

  void loadExpenses({ExpenseFilterEntity? filter}) async {
    final filterToUse = filter ?? state.data.currentFilter;

    onUpdateData(state.data.copyWith(
      isLoading: true,
      currentFilter: filterToUse,
    ));

    try {
      final expenses = await getIt<GetExpenses>()(filterToUse);
      final summary = await getIt<GetExpenseSummary>()(filterToUse);

      onUpdateData(state.data.copyWith(
        expenses: expenses,
        summary: summary,
        isLoading: false,
      ));
    } catch (e) {
      onFailedResponse(error: e.toString());
    }
  }

  static List<ExpenseEntity> _dummyExpenses = ExpenseDummyDataGenerator.generateDummyExpenses(count: 150);

  Future<Map<String, dynamic>> getExpensesResponse(ExpenseFilterEntity filter) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    List<ExpenseEntity> filteredExpenses = List.from(_dummyExpenses);

    // Apply filters
    if (filter.category != null && filter.category!.isNotEmpty) {
      filteredExpenses = filteredExpenses
          .where((expense) => expense.category.toLowerCase().contains(filter.category!.toLowerCase()))
          .toList();
    }

    // if (filter.search != null && filter.search!.isNotEmpty) {
    //   final searchLower = filter.search!.toLowerCase();
    //   filteredExpenses = filteredExpenses
    //       .where((expense) =>
    //   expense.description?.toLowerCase().contains(searchLower) == true ||
    //       expense.category.toLowerCase().contains(searchLower))
    //       .toList();
    // }

    // Apply date filtering
    if (filter.period != 'all') {
      final now = DateTime.now();
      DateTime startDate;

      switch (filter.period) {
        case 'week':
          startDate = now.subtract(const Duration(days: 7));
          break;
        case 'month':
          startDate = DateTime(now.year, now.month, 1);
          break;
        default:
          startDate = filter.startDate ?? now.subtract(const Duration(days: 30));
      }

      filteredExpenses = filteredExpenses
          .where((expense) => expense.date.isAfter(startDate))
          .toList();
    }

    if (filter.startDate != null) {
      filteredExpenses = filteredExpenses
          .where((expense) => expense.date.isAfter(filter.startDate!))
          .toList();
    }

    if (filter.endDate != null) {
      filteredExpenses = filteredExpenses
          .where((expense) => expense.date.isBefore(filter.endDate!))
          .toList();
    }

    // Apply sorting
    // if (filter.sortBy == 'date') {
    //   filteredExpenses.sort((a, b) {
    //     return filter.order == 'desc'
    //         ? b.date.compareTo(a.date)
    //         : a.date.compareTo(b.date);
    //   });
    // } else if (filter.sortBy == 'amount') {
    //   filteredExpenses.sort((a, b) {
    //     return filter.order == 'desc'
    //         ? b.convertedAmount.compareTo(a.convertedAmount)
    //         : a.convertedAmount.compareTo(b.convertedAmount);
    //   });
    // }

    // Apply pagination
    final totalItems = filteredExpenses.length;
    final totalPages = (totalItems / filter.limit).ceil();
    final startIndex = (filter.page - 1) * filter.limit;
    final endIndex = (startIndex + filter.limit).clamp(0, totalItems);

    final paginatedExpenses = filteredExpenses.sublist(
      startIndex.clamp(0, totalItems),
      endIndex,
    );

    // Convert to API response format
    final expenseJsonList = paginatedExpenses.map((expense) => expense.toJson()).toList();

    return {
      'data': expenseJsonList,
      'currentPage': filter.page,
      'totalPages': totalPages,
      'totalItems': totalItems,
      'hasNextPage': filter.page < totalPages,
      'hasPreviousPage': filter.page > 1,
    };
  }
  void applyFilter(ExpenseFilterEntity filter) {
    loadExpenses(filter: filter.copyWith(page: 1)); // Reset to first page
  }

  void refreshData() {
    loadExpenses(filter: state.data.currentFilter.copyWith(page: 1));
  }

  void syncOfflineData() async {
    onUpdateData(state.data.copyWith(isSyncing: true));

    try {
      await getIt<SyncOfflineExpenses>()(NoParams());
      // Reload data after sync
      loadInitialData();
    } catch (e) {
      onUpdateData(state.data.copyWith(isSyncing: false));
      onFailedResponse(error: "Sync failed: ${e.toString()}");
    }
  }

  void _startPeriodicSync() {
    _syncTimer = Timer.periodic(const Duration(minutes: 5), (timer) {
      if (!state.data.isSyncing) {
        syncOfflineData();
      }
    });
  }

  @override
  Future<void> close() {
    _syncTimer?.cancel();
    return super.close();
  }
}
