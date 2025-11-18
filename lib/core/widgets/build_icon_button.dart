import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:expense_tracker/core/constants/dimens.dart';
import 'package:expense_tracker/core/theme/colors/colors_extension.dart';

class BuildIconButton extends StatelessWidget {
  const BuildIconButton(
      {super.key,
      this.onTap,
      required this.icon,
      this.bgColor,
      this.iconColor,
      this.iconHeight,
      this.iconWidth,
      this.width,
      this.height,
      this.padding,
      this.borderRadius,
      this.border,
      this.gradient});
  final GestureTapCallback? onTap;
  final String icon;
  final Color? bgColor;
  final Color? iconColor;
  final double? iconHeight;
  final double? iconWidth;
  final double? width;
  final double? height;
  final BoxBorder? border;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: padding ?? Dimens.defaultPaddingOfOptionButton,
        decoration: BoxDecoration(
            shape: borderRadius == null ? BoxShape.circle : BoxShape.rectangle,
            color: gradient != null ? null : bgColor ?? context.colors.white,
            borderRadius: borderRadius,
            border: border,
            gradient: gradient),
        alignment: AlignmentDirectional.center,
        child: SvgPicture.asset(
          icon,
          height: iconHeight ?? 25.h,
          width: iconWidth ?? 25.w,
          color: iconColor,
        ),
      ),
    );
  }
}
