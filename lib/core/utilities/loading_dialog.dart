import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:expense_tracker/core/theme/colors/app_colors.dart';

class CustomToast {
  static showSimpleToast({required String msg, Color? color, Color? textColor}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: color ?? AppColors.noContextInstance.blackOpacity,
        textColor: textColor ?? Colors.white,
        fontSize: 16.0.sp);
  }
}
