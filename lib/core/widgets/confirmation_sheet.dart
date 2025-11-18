import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:expense_tracker/core/localization/translate.dart';
import 'package:expense_tracker/core/theme/colors/colors_extension.dart';
import 'package:expense_tracker/core/theme/text/app_text_style.dart';
import 'package:expense_tracker/core/widgets/custom_button.dart';

import 'parent_sheet.dart';

class ConfirmationSheet extends StatelessWidget {
  final String? btnTitle;
  final String? title;
  final String? description;
  final Function? onConfirm;
  final bool isPay;

  const ConfirmationSheet({
    Key? key,
    @required this.btnTitle,
    this.onConfirm,
    this.description,
    this.title,
    this.isPay = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ParentSheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 15.h),
          if (isPay) SvgPicture.asset("assets/images/pay_confirm.svg"),
          if (!isPay)
            Container(
              width: 50.h,
              height: 50.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colors.primaryBlue.withValues(alpha: 0.8),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 30.sp,
                ),
              ),
            ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              title ?? Translate.s.lblAreYouSure,
              textAlign: TextAlign.center,
              style: AppTextStyle.s16_w700(
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              description ?? '',
              style: AppTextStyle.s14_w600(
                color: Color(0xffb9baba),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 25.h),
          Align(
            child: SizedBox(
              height: 45.h,
              width: 175.w,
              child: CustomButton(
                backgroundColor: context.colors.primaryBlue.withValues(alpha: 0.8),
                onTap: () {
                  AutoRouter.of(context).pop();
                  onConfirm?.call();
                },
                title: btnTitle ?? "",
                radius: 10.r,
              ),
            ),
          ),
          SizedBox(height: 15.h),
          // CustomTopRoundedButton(
          //   onTap: () {

          //   },
          //   title: btnTitle ?? "",
          //   loadingTitle: '',
          // ),
        ],
      ),
    );
  }
}
