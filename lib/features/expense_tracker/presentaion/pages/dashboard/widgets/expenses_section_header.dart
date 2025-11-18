import 'package:expense_tracker/features/expense_tracker/presentaion/manager/expense_filter_cubit/expense_filter_cubit.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/pages/expense_tracker_screen/widgets/filter_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpensesSectionHeader extends StatelessWidget {
  final VoidCallback onFilterApply;

  const ExpensesSectionHeader({
    Key? key,
    required this.onFilterApply,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
          onPressed: () => _showFilterBottomSheet(context),
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
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    final filterCubit = context.read<ExpenseFilterCubit>();
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: filterCubit,
        child: FilterBottomSheet(
          onApply: (filter) {
            onFilterApply();
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

