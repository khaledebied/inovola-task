import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expense_tracker/core/theme/colors/colors_extension.dart';
import 'package:expense_tracker/core/theme/text/app_text_style.dart';
import 'package:expense_tracker/core/theme/themes/app_theme.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final Widget? child;
  final Function()? onTap;
  final Color? textColor;
  final Color? color;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? fontSize;
  final double? height;
  final double? elevation;
  final bool? disabled;
  final String? fontFamily;
  final Gradient? gradient;
  final FontWeight? fontWeight;

  const DefaultButton({
    super.key,
    required this.title,
    this.onTap,
    this.color,
    this.disabled,
    this.textColor,
    this.borderRadius,
    this.margin,
    this.padding,
    this.borderColor,
    this.fontFamily,
    this.fontSize,
    this.width,
    this.height,
    this.fontWeight,
    this.gradient,
    this.elevation,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    Color border = borderColor ?? Colors.transparent;
    return IgnorePointer(
      ignoring: disabled ?? false,
      child: Container(
        width: width,
        height: height ?? 35.h,
        decoration: BoxDecoration(gradient: gradient, borderRadius: borderRadius ?? BorderRadius.circular(10.r)),
        margin: margin ?? EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              backgroundColor: gradient != null ? Colors.transparent : color ?? context.colors.primary,
              padding: padding,
              disabledBackgroundColor: context.colors.greyWhite.withValues(alpha: 0.5),
              shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(10.r), side: BorderSide(color: border, width: 1)),
              elevation: elevation ?? 0),
          child: child ??
              Text(
                title,
                style: AppTextStyle.s16_w500(color: textColor ?? Colors.white)
                    .copyWith(fontSize: fontSize ?? (13.sp), fontWeight: fontWeight ?? FontWeight.w700),
              ),
        ),
      ),
    );
  }
}
