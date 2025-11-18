import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expense_tracker/res.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key, this.height, this.width});
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Res.logo,
      height: height ?? 82.h,
      width: width ?? 200.w,
    );
  }
}
