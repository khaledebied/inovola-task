import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expense_tracker/core/theme/colors/colors_extension.dart';

class CustomLinearIndicator extends StatelessWidget {
  const CustomLinearIndicator({super.key, this.value, this.minHeight, this.radius, this.backgroundColor, this.indicatorColor, this.total, this.onlyValue});
  final num? value;
  final num? total;
  final bool? onlyValue;
  final double? minHeight;
  final double? radius;
  final Color? backgroundColor;
  final Color? indicatorColor;
  @override
  Widget build(BuildContext context) {
    double percentage = (((value ?? 0).toDouble()) / ((total ?? 1).toDouble()));
    return LinearProgressIndicator(
      value: onlyValue == true ? value?.toDouble() : 1 - percentage,
      minHeight: minHeight ?? 8.h,
      backgroundColor: backgroundColor ?? context.colors.lightOrange,
      color: indicatorColor ?? context.colors.orange,
      borderRadius: BorderRadius.circular(radius ?? 10.r),
    );
  }
}
