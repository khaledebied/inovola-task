import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expense_tracker/core/localization/localization_method.dart';
import 'package:expense_tracker/core/theme/text/app_text_style.dart';
import 'package:expense_tracker/features/auth/presentation/widgets/auth_logo.dart';

class AuthHeaderTitleWidget extends StatelessWidget {
  final String phoneNumber;

  const AuthHeaderTitleWidget({
    super.key,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 82.h, bottom: 54.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AuthLogo(
            height: 46.h,
            width: 114.w,
          ),
          SizedBox(
            height: 72.h,
          ),
          Text(
            tr("lblEnterCode"),
            style: AppTextStyle.s16_w700(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
