import 'package:expense_tracker/core/bloc/generic_cubit/generic_cubit.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_filter_entity/expense_filter_entity.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/manager/expense_filter_cubit/expense_filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterBottomSheet extends StatefulWidget {
  final Function(ExpenseFilterEntity) onApply;

  const FilterBottomSheet({Key? key, required this.onApply}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final categories = [
    'All Categories',
    'Food & Dining',
    'Transportation',
    'Shopping',
    'Entertainment',
    'Bills & Utilities',
    'Healthcare',
    'Travel',
    'Education',
    'Personal Care',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Filter Expenses',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3436),
                  ),
                ),
                const SizedBox(height: 24),

                _buildPeriodSection(),
                const SizedBox(height: 24),

                _buildCategorySection(),
                const SizedBox(height: 32),

                _buildActionButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodSection() {
    return BlocBuilder<ExpenseFilterCubit, GenericState<ExpenseFilterEntity>>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Time Period',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D3436),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: ['all', 'week', 'month'].map((period) {
                final isSelected = state.data.period == period;
                return FilterChip(
                  label: Text(_getPeriodLabel(period)),
                  selected: isSelected,
                  onSelected: (_) => context.read<ExpenseFilterCubit>().updatePeriod(period),
                  selectedColor: const Color(0xFF6C5CE7).withOpacity(0.2),
                  checkmarkColor: const Color(0xFF6C5CE7),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCategorySection() {
    final List<String> staticCategories = [
      'All Categories',
      'Food & Dining',
      'Transportation',
      'Shopping',
      'Entertainment',
      'Utilities',
      'Rent/Mortgage',
      'Healthcare',
      'Travel',
      'Education',
      'Groceries',
      'Gifts & Donations',
      'Personal Care',
      'Insurance',
      'Investments',
      'Other',
    ];
    return BlocBuilder<ExpenseFilterCubit, GenericState<ExpenseFilterEntity>>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Category',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D3436),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String?>(
                  value: state.data.category, // If 'All Categories' is selected, this should be `null`
                  isExpanded: true,
                  items: categories.map((category) {
                    return DropdownMenuItem<String?>(
                      value: category == 'All Categories' ? null : category, // Only 'All Categories' maps to `null`
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    context.read<ExpenseFilterCubit>().updateCategory(value);
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildActionButtons() {
    return BlocBuilder<ExpenseFilterCubit, GenericState<ExpenseFilterEntity>>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  context.read<ExpenseFilterCubit>().resetFilter();
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: Color(0xFF6C5CE7)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Reset',
                  style: TextStyle(
                    color: Color(0xFF6C5CE7),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () => widget.onApply(state.data),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C5CE7),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Apply',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String _getPeriodLabel(String period) {
    switch (period) {
    case 'all':
    return 'All Time';
    case 'week':
    return 'Last 7 Days';
    case 'month':
    return 'This Month';
    default:
    return period;
        }
      }
}