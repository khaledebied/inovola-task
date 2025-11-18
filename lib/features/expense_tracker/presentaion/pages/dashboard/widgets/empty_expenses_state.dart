import 'package:flutter/material.dart';

class EmptyExpensesState extends StatelessWidget {
  const EmptyExpensesState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

