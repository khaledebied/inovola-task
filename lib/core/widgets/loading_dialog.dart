import 'package:flutter/material.dart';
import 'package:expense_tracker/core/theme/text/app_text_style.dart';

class LoadingDialog extends StatelessWidget {
  final String? title;

  const LoadingDialog({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    title ?? "Translate.s.lblLoading",
                    style: AppTextStyle.s14_w600(color: Colors.black),
                    // color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
