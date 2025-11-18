import 'package:flutter/material.dart';
import 'package:expense_tracker/core/theme/colors/app_colors.dart';

class CustomInputTextStyle extends TextStyle {
  final String lang;
  final Color? textColor;

  const CustomInputTextStyle({required this.lang, this.textColor});

  @override
  String get fontFamily => 'AppTheme.fontFamily';

  @override
  double get fontSize => 16;

  @override
  Color get color => textColor ?? AppColors.noContextInstance.black;
}
