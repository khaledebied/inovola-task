import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expense_tracker/core/localization/translate.dart';
import 'package:expense_tracker/core/theme/colors/colors_extension.dart';
import 'package:expense_tracker/core/theme/text/app_text_style.dart';
import 'package:expense_tracker/core/theme/themes/app_theme.dart';
import 'package:expense_tracker/core/widgets/default_button.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@lazySingleton
class AdaptivePicker {
  void datePicker(
      {required BuildContext context, required Function(DateTime? date) onConfirm, required String title, DateTime? initial, DateTime? minDate, DateTime? lastDate}) async {
    if (Platform.isIOS) {
      _iosDatePicker(context, onConfirm, title, initial: initial, minDate: minDate, lastDate: lastDate);
    } else {
      _androidDatePicker(context, onConfirm, initial: initial, minDate: minDate, lastDate: lastDate);
    }
  }

  void _androidDatePicker(BuildContext context, Function(DateTime? date) onConfirm, {DateTime? initial, DateTime? minDate, DateTime? lastDate}) {
    showRoundedDatePicker(
      context: context,
      initialDate: initial ?? DateTime.now().add(const Duration(days: -1)),
      // firstDate: minDate ?? DateTime.now().add(const Duration(days: -2)),
      lastDate: lastDate ?? DateTime.now().add(const Duration(days: -1)),
      borderRadius: 16,
      height: 300,
      theme: ThemeData(
        primaryColor: context.colors.white,
        textButtonTheme:
            TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: context.colors.lightGreen, textStyle: AppTextStyle.s13_w500(color: context.colors.lightGreen))),
        colorScheme: ColorScheme.fromSeed(seedColor: context.colors.lightGreen, primary: context.colors.lightGreen, brightness: Brightness.light, onPrimary: context.colors.white),
        dialogBackgroundColor: context.colors.white,
        focusColor: context.colors.lightGreen,
        useMaterial3: false,
        textTheme: TextTheme(labelMedium: AppTextStyle.s14_w500(color: context.colors.white), bodyLarge: AppTextStyle.s12_w600(color: context.colors.white)),
      ),
    ).then(onConfirm);
  }

  void _iosDatePicker(BuildContext context, Function(DateTime? date) onConfirm, String title, {DateTime? initial, DateTime? minDate, DateTime? lastDate}) {
    _bottomSheet(
      context: context,
      child: cupertinoDatePicker(context, onConfirm, title, initial: initial, minDate: minDate, lastDate: lastDate),
    );
  }

  Widget cupertinoDatePicker(BuildContext context, Function(DateTime? date) onConfirm, String title, {DateTime? initial, DateTime? minDate, DateTime? lastDate}) {
    DateTime _date = DateTime.now();
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: AppTextStyle.s14_w500(color: context.colors.black)),
                DefaultButton(
                  title: Translate.s.ok,
                  width: 80.w,
                  height: 25.h,
                  onTap: () {
                    onConfirm(_date);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          Flexible(
            child: CupertinoTheme(
              data: CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  textStyle: AppTextStyle.s14_w500(
                    color: context.colors.black,
                  ),
                ),
              ),
              child: CupertinoDatePicker(
                initialDateTime: initial ?? DateTime.now(),
                maximumDate: lastDate ?? DateTime(2060),
                onDateTimeChanged: (date) {
                  _date = date;
                },
                mode: CupertinoDatePickerMode.date,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _bottomSheet({required BuildContext context, required Widget child}) {
    return showModalBottomSheet(
      isScrollControlled: false,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.r),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => SizedBox(
        height: 340,
        child: child,
      ),
    );
  }

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat("MM/dd", "en").format(dateTime);
    return formattedDate;
  }

  String formatDateAndTime(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat("dd/MM/yyyy - h:mm a").format(dateTime);
    return formattedDate;
  }
}
