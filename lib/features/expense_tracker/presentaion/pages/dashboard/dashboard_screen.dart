import 'package:expense_tracker/core/bloc/generic_cubit/generic_cubit.dart';
import 'package:expense_tracker/core/theme/colors/app_colors.dart';
import 'package:expense_tracker/features/expense_tracker/data/model/expense_model/expense_model.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_entity/expense_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_filter_entity/expense_filter_entity.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/manager/dashboard_cubit/dashboard_expense_cubit.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/manager/expense_filter_cubit/expense_filter_cubit.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/pages/add_expense/add_expense.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/pages/expense_tracker_screen/widgets/filter_bottom_sheet.dart';
import 'package:flutter/material.dart';
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
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
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
      child: Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          onRefresh: () async => _dashboardCubit.refreshData(),
          child: BlocBuilder<DashboardExpenseCubit, GenericState<DashboardExpenseData>>(
            builder: (context, state) {
              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    expandedHeight: 292,
                    floating: false,
                    pinned: false,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Blue background
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              gradient: LinearGradient(
                                colors: [Color(0xFF0077FF), Color(0xFFFFFFFF)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),

                          // Content
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // User info
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Good Morning',
                                        style: TextStyle(color: Colors.white70, fontSize: 14),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Shihab Rahman',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),

                                  // White card with balance info
                                  Transform.translate(
                                    offset: const Offset(0, 10),
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            blurRadius: 10,
                                            offset: const Offset(0, 5),
                                          )
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Total Balance',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          const Text(
                                            '\$ 2,548.00',
                                            style: TextStyle(
                                              fontSize: 28,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              _buildBalanceInfoCard(
                                                title: 'Income',
                                                amount: '\$ 10,840.00',
                                                color: Colors.green,
                                              ),
                                              _buildBalanceInfoCard(
                                                title: 'Expenses',
                                                amount: '\$ 1,884.00',
                                                color: Colors.red,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Recent expenses section
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    sliver: SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Recent Expenses',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (_) => BlocProvider.value(
                                  value: _filterCubit,
                                  child: FilterBottomSheet(
                                    onApply: (filter) {
                                      _dashboardCubit.loadInitialData(filter: filter);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              'Filter',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Expenses list
                  if (state.data.isLoading && state.data.expenses.data.isEmpty)
                    const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else if (state.data.expenses.data.isEmpty)
                    SliverFillRemaining(child: _buildEmptyState())
                  else
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final expense = state.data.expenses.data[index];
                            return _buildExpenseItem(expense);
                          },
                          childCount: state.data.expenses.data.length,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _navigateToAddExpense(context),
          backgroundColor: AppColors.of(context).primary,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildBalanceInfoCard({
    required String title,
    required String amount,
    required Color color,
  }) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            amount,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpenseItem(ExpenseModel expense) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              shape: BoxShape.circle,
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              _getCategoryIcon(expense.category),
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.category,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Manually',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '-\$${expense.amount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Today 12:00 PM',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
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


  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long, size: 60, color: Colors.grey[300]),
          const SizedBox(height: 16),
          const Text(
            'No expenses yet',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
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
