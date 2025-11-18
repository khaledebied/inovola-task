import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle extends TextStyle {
  const AppTextStyle() : super();

  static const FontWeight weight500 = FontWeight.w600;
  static const FontWeight weight400 = FontWeight.w400;
  static double fontHeight = 1.2.h;

  // ignore: non_constant_identifier_names
  AppTextStyle.s8_w400({required Color color})
      : super(
          color: color,
          fontSize: 8.sp,
          fontWeight: FontWeight.w400,
          height: fontHeight,
        );

  // ignore: non_constant_identifier_names
  AppTextStyle.s9_w400({required Color color})
      : super(
          color: color,
          fontSize: 9.sp,
          fontWeight: FontWeight.w400,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s10_w400({required Color color})
      : super(
          color: color,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s10_w500({required Color color})
      : super(
          color: color,
          fontSize: 10.sp,
          fontWeight: weight500,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s10_w600({required Color color})
      : super(
          color: color,
          fontSize: 10.sp,
          fontWeight: weight500,
          height: fontHeight,
        );
  // ignore: nonant_identifier_names
  AppTextStyle.s10_w700({required Color color})
      : super(
          color: color,
          fontSize: 10.sp,
          fontWeight: FontWeight.w700,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s11_w400({required Color color})
      : super(
          color: color,
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s11_w500({required Color color})
      : super(
          color: color,
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s11_w700({required Color color})
      : super(
          color: color,
          fontSize: 11.sp,
          fontWeight: FontWeight.w700,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s12_w400({required Color color, String? fontFamily, TextDecoration? decoration})
      : super(color: color, fontSize: 12.sp, fontWeight: FontWeight.w400, decoration: decoration, decorationColor: color, height: fontHeight, fontFamily: fontFamily);

  // ignore: nonant_identifier_names
  AppTextStyle.s12_w300({required Color color})
      : super(
          color: color,
          fontSize: 12.sp,
          fontWeight: FontWeight.w300,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s12_w500({required Color color, bool? hasUnderline, double? height})
      : super(
            color: color,
            fontSize: 12.sp,
            fontWeight: weight500,
            height: height ?? fontHeight,
            decoration: hasUnderline == true ? TextDecoration.underline : TextDecoration.none,
            decorationColor: hasUnderline == true ? color : null);

  // ignore: nonant_identifier_names
  AppTextStyle.s12_w600({required Color color})
      : super(
          color: color,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s12_w700({required Color color, String? fontFamily}) : super(color: color, fontSize: 12.sp, fontWeight: FontWeight.w700, height: fontHeight, fontFamily: fontFamily);

  // ignore: nonant_identifier_names
  AppTextStyle.s12_bold({required Color color, String? fontFamily}) : super(color: color, fontSize: 12.sp, fontWeight: FontWeight.bold, height: fontHeight, fontFamily: fontFamily);

  // ignore: nonant_identifier_names
  AppTextStyle.s13_w500({required Color color})
      : super(
          color: color,
          fontSize: 13.sp,
          fontWeight: weight500,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s13_w700({required Color color})
      : super(
          color: color,
          fontSize: 13.sp,
          fontWeight: FontWeight.w700,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s13_bold({required Color color})
      : super(
          color: color,
          fontSize: 13.sp,
          fontWeight: FontWeight.bold,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s13_w400({required Color color})
      : super(
          color: color,
          fontSize: 13.sp,
          fontWeight: weight400,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s14_w400({required Color color, String? fontFamily, TextDecoration? decoration})
      : super(color: color, fontSize: 14.sp, fontWeight: FontWeight.w400, height: fontHeight, fontFamily: fontFamily, decoration: decoration, decorationColor: color);

  // ignore: nonant_identifier_names
  AppTextStyle.s14_w300({required Color color, String? fontFamily}) : super(color: color, fontSize: 14.sp, fontWeight: FontWeight.w300, height: fontHeight, fontFamily: fontFamily);

  // ignore: nonant_identifier_names
  AppTextStyle.s14_w500({required Color color, String? fontFamily, double? height})
      : super(color: color, fontSize: 14.sp, fontWeight: weight500, height: height ?? fontHeight, fontFamily: fontFamily);

  // ignore: nonant_identifier_names
  AppTextStyle.s14_w600({required Color color})
      : super(
          color: color,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s14_w700({required Color color, String? fontFamily}) : super(color: color, fontSize: 14.sp, fontWeight: FontWeight.w700, height: fontHeight, fontFamily: fontFamily);

  // ignore: nonant_identifier_names
  AppTextStyle.s14_bold({required Color color, String? fontFamily}) : super(color: color, fontSize: 14.sp, fontWeight: FontWeight.bold, height: fontHeight, fontFamily: fontFamily);

  // ignore: nonant_identifier_names
  AppTextStyle.s15_w600({required Color color})
      : super(
          color: color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
          height: fontHeight,
        );
  // ignore: nonant_identifier_names
  AppTextStyle.s15_bold({required Color color})
      : super(
          color: color,
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s15_w500({required Color color})
      : super(
          color: color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s14_w800({required Color color})
      : super(
          color: color,
          fontSize: 14.sp,
          fontWeight: FontWeight.w800,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s16_w400({required Color color})
      : super(
          color: color,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s16_w300({required Color color})
      : super(
          color: color,
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s16_w500({required Color color})
      : super(
          color: color,
          fontSize: 16.sp,
          fontWeight: weight500,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s16_w700({required Color color, String? fontFamily}) : super(color: color, fontSize: 16.sp, fontWeight: FontWeight.w700, height: fontHeight, fontFamily: fontFamily);

  // ignore: nonant_identifier_names
  AppTextStyle.s16_bold({required Color color, String? fontFamily}) : super(color: color, fontSize: 16.sp, fontWeight: FontWeight.bold, height: fontHeight, fontFamily: fontFamily);

  // ignore: nonant_identifier_names
  AppTextStyle.s16_w600({required Color color, String? fontFamily}) : super(color: color, fontSize: 16.sp, fontWeight: FontWeight.w600, height: fontHeight, fontFamily: fontFamily);

  // ignore: nonant_identifier_names
  AppTextStyle.s16_w800({required Color color})
      : super(
          color: color,
          fontSize: 16.sp,
          fontWeight: FontWeight.w800,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s18_w400({required Color color})
      : super(
          color: color,
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s18_w500({required Color color}) : super(color: color, fontSize: 18.sp, fontWeight: weight500, height: fontHeight);

  // ignore: nonant_identifier_names
  AppTextStyle.s18_w300({required Color color, String? fontFamily}) : super(color: color, fontSize: 18.sp, fontWeight: FontWeight.w300, height: fontHeight, fontFamily: fontFamily);

  // ignore: nonant_identifier_names
  AppTextStyle.s18_w600({required Color color})
      : super(
          color: color,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s18_w700({required Color color})
      : super(
          color: color,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s18_bold({required Color color})
      : super(
          color: color,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s20_w500({required Color color})
      : super(
          color: color,
          fontSize: 20.sp,
          fontWeight: weight500,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s20_bold({required Color color})
      : super(
          color: color,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s20_w300({required Color color, String? fontFamily}) : super(color: color, fontSize: 20.sp, fontWeight: FontWeight.w300, height: fontHeight, fontFamily: fontFamily);

  // ignore: nonant_identifier_names
  AppTextStyle.s20_w600({required Color color})
      : super(
          color: color,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s20_w700({required Color color})
      : super(
          color: color,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          height: fontHeight,
        );

  // ignore: nonant_identifier_names
  AppTextStyle.s24_w700({required Color color, String? fontFamily}) : super(color: color, fontSize: 24.sp, fontWeight: FontWeight.w700, height: fontHeight, fontFamily: fontFamily);

  // ignore: nonant_identifier_names
  AppTextStyle.s24_bold({required Color color, String? fontFamily}) : super(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold, height: fontHeight, fontFamily: fontFamily);

  // ignore: nonant_identifier_names
  AppTextStyle.s28_w700({required Color color, String? fontFamily}) : super(color: color, fontSize: 28.sp, fontWeight: FontWeight.w700, height: fontHeight, fontFamily: fontFamily);

  // ignore: nonant_identifier_names
  AppTextStyle.s28_bold({required Color color, String? fontFamily}) : super(color: color, fontSize: 28.sp, fontWeight: FontWeight.bold, height: fontHeight, fontFamily: fontFamily);

  // ignore: nonant_identifier_names
  AppTextStyle.s32_w700({required Color color})
      : super(
          color: color,
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
          height: fontHeight,
        );

  AppTextStyle.h1({required Color color})
      : super(
          color: color,
          fontSize: 40.sp,
          fontWeight: FontWeight.w600,
          height: fontHeight,
        );

  AppTextStyle.h2({required Color color})
      : super(
          color: color,
          fontSize: 32.sp,
          fontWeight: FontWeight.w600,
          height: fontHeight,
        );

  AppTextStyle.h3({required Color color})
      : super(
          color: color,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          height: fontHeight,
        );

  AppTextStyle.h4({required Color color})
      : super(
          color: color,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          height: fontHeight,
        );

  AppTextStyle.h5({required Color color})
      : super(
          color: color,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          height: fontHeight,
        );

  AppTextStyle.h6({required Color color})
      : super(
          color: color,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          height: fontHeight,
        );
}

// class AppTextTheme extends TextTheme {
//
//   @override
//   final TextStyle overline = AppTextStyle.s14_w400(color: AppColors.noContextInstance.black);
//
//   @override
//   final TextStyle headline1 = AppTextStyle.s16_w500(color: AppColors.noContextInstance.black);
//   @override
//   final TextStyle headline2 = AppTextStyle.s16_w400(color: AppColors.noContextInstance.black);
//   @override
//   final TextStyle headline3 = AppTextStyle.s14_w400(color: AppColors.noContextInstance.black);
//   @override
//   final TextStyle headline4 = AppTextStyle.s12_w400(color: AppColors.noContextInstance.black);
//
//   @override
//   final TextStyle headline5 = AppTextStyle.s10_w400(color: AppColors.noContextInstance.black);
//
//   @override
//   final TextStyle headline6 = AppTextStyle.s8_w400(color: AppColors.noContextInstance.black);
//
//   @override
//   final TextStyle subtitle1 = AppTextStyle.s12_w400(color: AppColors.noContextInstance.blackOpacity);
//
//   @override
//   final TextStyle subtitle2 = AppTextStyle.s10_w400(color: AppColors.noContextInstance.blackOpacity);
//
//   @override
//   final TextStyle bodyText1 = AppTextStyle.s10_w400(color: AppColors.noContextInstance.black);
//   @override
//   final TextStyle bodyText2 = AppTextStyle.s10_w400(color: AppColors.noContextInstance.blackOpacity);
// }
