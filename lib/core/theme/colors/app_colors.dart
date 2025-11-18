import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/core/bloc/device_cubit/device_cubit.dart';
import 'package:expense_tracker/core/helpers/di.dart';
import 'package:expense_tracker/core/helpers/global_context.dart';
import 'package:expense_tracker/core/theme/colors/app_dark_colors.dart';
import 'package:expense_tracker/core/theme/colors/app_light_colors.dart';

abstract class AppColors {
  static final AppDarkColors _dark = AppDarkColors();
  static final AppLightColors _light = AppLightColors();

  static AppColors get fixedColors => _light;

  static const Color snackBarGreenSuccess = Color(0xff03A89E);
  static const Color snackBarRedError = Color(0xffBF1C00);
  static const Color snackBarOrangeError = Color(0xffFCEBD1);
  static const Color snackBarYellowAlert = Color(0xfffea632);

  static AppColors get noContextInstance => getIt.get<GlobalContext>().context().read<DeviceCubit>().state.model.themeMode == AdaptiveThemeMode.dark ? _dark : _light;

  static AppColors of(BuildContext context) => context.read<DeviceCubit>().state.model.themeMode == AdaptiveThemeMode.dark ? _dark : _light;

  Color get primary;

  Color get secondary;

  Color get greyWhite;

  Color get grayE8;

  Color get grayText;

  Color get blackOpacity;

  Color get appBarColor;

  Color get white;

  Color get black;
  Color get tabUnselectedTextColor;

  Color get green;

  Color get background;

  Color get disableGray;

  Color get primaryBlue;
  Color get btnBg;
  Color get mintGreen;
  Color get lightGrey;
  Color get btnLightGrey;
  Color get lightGreen;
  Color get orange;
  Color get lightOrange;
  Color get divider;
  Color get verticalDivider;
  Color get greyBorder;
  Color get red;
  Color get darkRed;
  Color get greyBtn;
  Color get appBarBg;
  Color get authBg;
  Color get darkGrey;
  Color get dashColor;
  Color get transparent;
  Color get grey;
  Color get dividerGrey;
  Color get greyQuantity;
  Color get greyBody;
  Color get dividerLightGrey;
  Color get borderLightGrey;
}
