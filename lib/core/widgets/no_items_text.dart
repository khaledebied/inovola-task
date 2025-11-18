import 'package:flutter/material.dart';
import 'package:expense_tracker/core/theme/colors/colors_extension.dart';
import 'package:expense_tracker/core/theme/text/app_text_style.dart';

class NoItemsText extends StatelessWidget {
  const NoItemsText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.s15_w500(color: context.colors.black),
    );
  }
}
