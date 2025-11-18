import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  static List<BoxShadow>? boxShadow = [BoxShadow(offset: const Offset(2, 2), color: Colors.black.withValues(alpha: 0.006))];
  static List<BoxShadow>? boxShadowImg = [BoxShadow(offset: const Offset(0, 2), color: Colors.black.withValues(alpha: 0.2), spreadRadius: 0, blurRadius: 4)];
  static List<BoxShadow>? boxShadowBtn = [BoxShadow(offset: const Offset(0, 4), color: Colors.black.withValues(alpha: 0.25), spreadRadius: 3, blurRadius: 4)];
  static List<BoxShadow>? boxShadowAuction = [const BoxShadow(offset: Offset(0, 2), color: Color(0xFFE4E4E4), blurRadius: 4, spreadRadius: 0)];

  static BorderRadiusGeometry? cardSmallRadius = BorderRadius.circular(5.r);
  static EdgeInsetsGeometry? cardPadding = EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h);
  static ThemeData paymentTheme = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        decorationThickness: 0,
        color: Colors.black,
      ),
      border: OutlineInputBorder(),
      labelStyle: TextStyle(
        decorationThickness: 0,
        color: Colors.black,
      ),
      errorStyle: TextStyle(height: 0.8),
    ),
  );
  static Gradient? cardGradient = const LinearGradient(
    colors: [
      Color(0xff268F85),
      Color(0xff4D926D),
      Color(0xff769555),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static Gradient buttonGradient = const LinearGradient(
    colors: [
      Color(0xff268F85),
      Color(0xff769555),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static Gradient loyaltyCardGradient = LinearGradient(
    colors: [
      const Color(0xff268F85).withValues(alpha: 0.3),
      const Color(0xff769555).withValues(alpha: 0.3),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
