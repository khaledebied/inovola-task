import 'package:expense_tracker/core/bloc/generic_cubit/generic_cubit.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_filter_entity/expense_filter_entity.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/manager/dashboard_cubit/dashboard_expense_cubit.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/manager/expense_filter_cubit/expense_filter_cubit.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/pages/add_expense/add_expense.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/pages/dashboard/widgets/add_expense_fab.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/pages/dashboard/widgets/dashboard_bottom_nav.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/pages/dashboard/widgets/dashboard_header.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/pages/dashboard/widgets/empty_expenses_state.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/pages/dashboard/widgets/expense_item_card.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/pages/dashboard/widgets/expenses_section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DashboardExpenseCubit _dashboardCubit;
  late ExpenseFilterCubit _filterCubit;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _dashboardCubit = DashboardExpenseCubit();
    _filterCubit = ExpenseFilterCubit();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _dashboardCubit.close();
    _filterCubit.close();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _dashboardCubit.getExpensesResponse(const ExpenseFilterEntity());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _dashboardCubit),
        BlocProvider.value(value: _filterCubit),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: const Color(0xFFF5F5F5),
          body: RefreshIndicator(
            onRefresh: () async => _dashboardCubit.refreshData(),
            child: BlocBuilder<DashboardExpenseCubit,
                GenericState<DashboardExpenseData>>(
              builder: (context, state) {
                return CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    // Header with gradient background
                    const SliverToBoxAdapter(
                      child: DashboardHeader(),
                    ),

                    // Recent expenses section header
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                      sliver: SliverToBoxAdapter(
                        child: ExpensesSectionHeader(
                          onFilterApply: () => _dashboardCubit.loadInitialData(
                            filter: _filterCubit.state.data,
                          ),
                        ),
                      ),
                    ),

                    // Expenses list
                    if (state.data.isLoading && state.data.expenses.data.isEmpty)
                      const SliverFillRemaining(
                        child: Center(child: CircularProgressIndicator()),
                      )
                    else if (state.data.expenses.data.isEmpty)
                      const SliverFillRemaining(child: EmptyExpensesState())
                    else
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final expense = state.data.expenses.data[index];
                              return ExpenseItemCard(expense: expense);
                            },
                            childCount: state.data.expenses.data.length,
                          ),
                        ),
                      ),

                    // Bottom padding for navigation bar
                    const SliverPadding(
                      padding: EdgeInsets.only(bottom: 100),
                    ),
                  ],
                );
              },
            ),
          ),
          bottomNavigationBar: const DashboardBottomNav(),
          floatingActionButton: AddExpenseFab(
            onPressed: () => _navigateToAddExpense(context),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }

  void _navigateToAddExpense(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AddExpenseScreen()),
    );

    if (result != null) {
      _dashboardCubit.addNewExpense(result);
    }
  }
}
