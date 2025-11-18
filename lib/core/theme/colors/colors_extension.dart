import 'package:flutter/material.dart';
import 'package:expense_tracker/core/theme/colors/app_colors.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  AppColors get colors => AppColors.of(this);
}
