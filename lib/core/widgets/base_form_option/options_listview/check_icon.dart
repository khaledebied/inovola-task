import 'package:flutter/material.dart';
import 'package:expense_tracker/core/theme/colors/app_colors.dart';
import 'package:expense_tracker/core/widgets/svg_icon_wrapper.dart';
import 'package:expense_tracker/res.dart';

class CheckIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const CheckIcon({super.key, this.size = 24, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: SvgIconWrapper(
        iconPath: Res.check,
        size: size,
        color: color ?? AppColors.fixedColors.primary,
      ),
    );
  }
}
