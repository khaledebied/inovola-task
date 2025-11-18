import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expense_tracker/core/theme/text/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? textSize;
  final bool isLoading;
  final bool isEnabled;
  final Function? onTap;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? radius;
  final BoxBorder? border;
  final double? elevation;

  const CustomButton({
    super.key,
    required this.title,
    this.backgroundColor = const Color(0xff248C90),
    this.textColor,
    this.height,
    this.border,
    this.elevation,
    this.width,
    this.textSize,
    this.onTap,
    this.isLoading = false,
    this.isEnabled = true,
    this.margin,
    this.padding,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 30.w),
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.circular(radius ?? 30.r),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          padding: padding ?? EdgeInsets.symmetric(vertical: 14.w),
          backgroundColor: (isLoading || !isEnabled) ? Colors.grey[400] : backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 30.r),
          ),
        ),
        onPressed: () {
          if (!isLoading) {
            if (isEnabled) {
              onTap?.call();
            }
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppTextStyle.s14_w600(color: textColor ?? Colors.white),
              // fontSize: textSize ?? 15.sp,
              // color: textColor ?? Colors.white,
              // fontWeight: FontWeight.w700,
              // textHeight: 1,
            ),
            Visibility(
              visible: isLoading,
              child: AnimatedContainer(
                margin: EdgeInsetsDirectional.only(
                  start: !isLoading ? 0 : 8.w,
                ),
                duration: const Duration(milliseconds: 300),
                width: !isLoading ? 0 : 15.w,
                height: !isLoading ? 0 : height ?? 15.h,
                child: const CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
