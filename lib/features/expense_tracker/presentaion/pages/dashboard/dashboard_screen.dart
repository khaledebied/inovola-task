import 'package:expense_tracker/core/bloc/generic_cubit/generic_cubit.dart';
import 'package:expense_tracker/core/theme/colors/colors_extension.dart';
import 'package:expense_tracker/features/expense_tracker/data/model/expense_model/expense_model.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_entity/expense_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_filter_entity/expense_filter_entity.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/manager/dashboard_cubit/dashboard_expense_cubit.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/manager/expense_filter_cubit/expense_filter_cubit.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/pages/add_expense/add_expense.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/pages/expense_tracker_screen/widgets/filter_bottom_sheet.dart';
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
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: const Color(0xFFF5F5F5),
          body: RefreshIndicator(
            onRefresh: () async => _dashboardCubit.refreshData(),
            child: BlocBuilder<DashboardExpenseCubit, GenericState<DashboardExpenseData>>(
              builder: (context, state) {
                return CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    // Header with gradient background
                    SliverToBoxAdapter(
                      child: Container(
                        height: 360,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF4C6FFF), Color(0xFF6E8AFF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32),
                            bottomRight: Radius.circular(32),
                          ),
                        ),
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Top row: Profile pic and dropdown
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        // Profile picture
                                        Container(
                                          width: 52,
                                          height: 52,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
                                            image: const DecorationImage(
                                              image: NetworkImage('https://i.pravatar.cc/150?img=1'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        // Greeting
                                        const Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Good Morning',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(height: 2),
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
                                      ],
                                    ),
                                    // This month dropdown
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'This month',
                                            style: TextStyle(
                                              color: const Color(0xFF4C6FFF),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Icon(
                                            Icons.keyboard_arrow_down,
                                            color: const Color(0xFF4C6FFF),
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                // Balance card
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF5B7DFF), Color(0xFF3B5CFF)],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(24),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF4C6FFF).withOpacity(0.4),
                                        blurRadius: 20,
                                        offset: const Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                'Total Balance',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const SizedBox(width: 6),
                                              Icon(
                                                Icons.arrow_upward_rounded,
                                                color: Colors.white.withOpacity(0.8),
                                                size: 16,
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            Icons.more_horiz,
                                            color: Colors.white.withOpacity(0.8),
                                            size: 24,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        '\$ 2,548.00',
                                        style: TextStyle(
                                          fontSize: 36,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.2),
                                                borderRadius: BorderRadius.circular(16),
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white.withOpacity(0.3),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    child: const Icon(
                                                      Icons.arrow_downward_rounded,
                                                      color: Colors.white,
                                                      size: 16,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 12),
                                                  const Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Income',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      SizedBox(height: 4),
                                                      Text(
                                                        '\$ 10,840.00',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.2),
                                                borderRadius: BorderRadius.circular(16),
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white.withOpacity(0.3),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    child: const Icon(
                                                      Icons.arrow_upward_rounded,
                                                      color: Colors.white,
                                                      size: 16,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 12),
                                                  const Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Expenses',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      SizedBox(height: 4),
                                                      Text(
                                                        '\$ 1,884.00',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Recent expenses section header
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Recent Expenses',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2D3142),
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
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(50, 30),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                'see all',
                                style: TextStyle(
                                  color: Color(0xFF9CA3AF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
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
                    
                    // Bottom padding for navigation bar
                    const SliverPadding(
                      padding: EdgeInsets.only(bottom: 100),
                    ),
                  ],
                );
              },
            ),
          ),
          bottomNavigationBar: _buildBottomNavigationBar(context),
          floatingActionButton: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF5B7DFF), Color(0xFF4C6FFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF4C6FFF).withOpacity(0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _navigateToAddExpense(context),
                customBorder: const CircleBorder(),
                child: const Icon(Icons.add, color: Colors.white, size: 32),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }

  Widget _buildExpenseItem(ExpenseModel expense) {
    final categoryColor = _getCategoryColor(expense.category);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: categoryColor.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              _getCategoryIcon(expense.category),
              style: const TextStyle(fontSize: 24),
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
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3142),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Manually',
                  style: TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '- \$${expense.amount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3142),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Today 12:00 PM',
                style: TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
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
      case 'groceries':
        return '🛒';
      case 'transportation':
        return '🚗';
      case 'shopping':
        return '🛍';
      case 'entertainment':
        return '🍿';
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
      case 'rent':
        return '🏠';
      default:
        return '💰';
    }
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'food & dining':
      case 'groceries':
        return const Color(0xFF6B7FFF);
      case 'transportation':
        return const Color(0xFFA78BFA);
      case 'shopping':
        return const Color(0xFF60A5FA);
      case 'entertainment':
        return const Color(0xFFFFA173);
      case 'bills & utilities':
        return const Color(0xFFFCD34D);
      case 'healthcare':
        return const Color(0xFFF87171);
      case 'travel':
        return const Color(0xFF34D399);
      case 'education':
        return const Color(0xFF818CF8);
      case 'personal care':
        return const Color(0xFFFBBF24);
      case 'rent':
        return const Color(0xFFFFB084);
      default:
        return const Color(0xFF6B7FFF);
    }
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_rounded, true),
          _buildNavItem(Icons.bar_chart_rounded, false),
          const SizedBox(width: 64), // Space for FAB
          _buildNavItem(Icons.credit_card_rounded, false),
          _buildNavItem(Icons.person_rounded, false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Icon(
        icon,
        color: isSelected ? const Color(0xFF4C6FFF) : const Color(0xFF9CA3AF),
        size: 28,
      ),
    );
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
