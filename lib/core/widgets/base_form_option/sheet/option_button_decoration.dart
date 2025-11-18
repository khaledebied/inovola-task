import 'package:flutter/material.dart';
import 'package:expense_tracker/core/constants/dimens.dart';
import 'package:expense_tracker/core/theme/colors/colors_extension.dart';

class OptionButtonDecoration extends StatelessWidget {
  final Widget child;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? padding;
  final Border? border;

  const OptionButtonDecoration({super.key, required this.child, this.constraints, this.border, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints ?? const BoxConstraints(minHeight: 42, maxHeight: 42),
      padding: padding ?? Dimens.defaultPaddingOfOptionButton,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: context.colors.background,
        borderRadius: Dimens.borderRadius5PX,
        border: border ?? Border.all(color: context.colors.greyWhite, width: 1),
      ),
      child: child,
    );
  }
}
