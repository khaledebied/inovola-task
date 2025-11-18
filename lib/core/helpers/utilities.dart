import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

@lazySingleton
class Utilities {
  String convertDigitsToLatin(String s) {
    var sb = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      switch (s[i]) {
        //Arabic digits
        case '\u0660':
          sb.write('0');
          break;
        case '\u0661':
          sb.write('1');
          break;
        case '\u0662':
          sb.write('2');
          break;
        case '\u0663':
          sb.write('3');
          break;
        case '\u0664':
          sb.write('4');
          break;
        case '\u0665':
          sb.write('5');
          break;
        case '\u0666':
          sb.write('6');
          break;
        case '\u0667':
          sb.write('7');
          break;
        case '\u0668':
          sb.write('8');
          break;
        case '\u0669':
          sb.write('9');
          break;
        default:
          sb.write(s[i]);
          break;
      }
    }
    return sb.toString();
  }

  Future<dynamic> bottomSheet({
    required BuildContext context,
    required Widget child,
    required Color backgroundColor,
    bool enableDrag = true,
    bool isDismissible = true,
    BoxConstraints? constraints,
    double radius = 15,
    bool isScrollControlled = true,
    bool useRootNavigator = false,
  }) async {
    return await showModalBottomSheet(
      showDragHandle: false,
      context: context,
      enableDrag: enableDrag,
      useRootNavigator: useRootNavigator,
      constraints: constraints,
      isDismissible: isDismissible,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(radius.r),
        ),
      ),
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      builder: (_) => child,
    );
  }

  String formatNumber(double number) {
    final formatter = NumberFormat("#,##0.00");
    return formatter.format(number);
  }

  Future<bool> isSimulator() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return !iosInfo.isPhysicalDevice;
    }

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return !androidInfo.isPhysicalDevice;
    }

    return false;
  }

  String getImageExtension(String filePath) {
    return path.extension(filePath).toLowerCase();
  }

  String capitalizeAllFirstChar(String? txt) {
    if (txt == null || txt.isEmpty) return "";
    return txt.split(' ').map((word) => capitalizeFirstChar(word)).join(' ');
  }

  String capitalizeFirstChar(String? txt) {
    if (txt == null || txt.isEmpty) return "";
    // var context = getIt<GlobalContext>().context();
    // var laneAr = context.read<DeviceCubit>().state.model.locale.languageCode == "ar";
    // print("laneAr $laneAr");
    // if (laneAr) return txt;
    var text = txt.toLowerCase();
    return text.replaceFirst(text[0], text[0].toUpperCase());
  }

  //get totalPrice
  num getTotalPrice({required num priceAfter}) {
    num result = (1 + 0) * priceAfter;
    return double.tryParse(result.toStringAsFixed(2)) ?? 0;
  }

  num getFinalPrice({required num priceAfter, required int quantity}) {
    log("quantity $quantity");
    log("priceAfter $priceAfter");
    num result = priceAfter * quantity;
    num finalPrice = num.tryParse(result.toStringAsFixed(2)) ?? 0;
    log("finalPrice converted $finalPrice");
    return finalPrice;
  }
}
