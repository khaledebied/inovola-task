import 'package:flutter/material.dart';
import 'package:expense_tracker/core/theme/colors/app_colors.dart';

class BottomSheetHeaderLine extends StatelessWidget {
  const BottomSheetHeaderLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 32,
        height: 4,
        decoration: BoxDecoration(color: AppColors.of(context).blackOpacity, borderRadius: const BorderRadius.all(Radius.circular(55))),
      ),
    );
  }
}
