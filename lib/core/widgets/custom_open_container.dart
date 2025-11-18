import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/core/theme/colors/colors_extension.dart';

class CustomOpenContainer extends StatelessWidget {
  const CustomOpenContainer({super.key, required this.closeWidget, required this.openWidget});
  final Widget closeWidget;
  final Widget openWidget;
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        closedColor: context.colors.transparent,
        openColor: context.colors.white,
        middleColor: context.colors.transparent,
        transitionDuration: const Duration(milliseconds: 100),
        transitionType: ContainerTransitionType.fadeThrough,
        closedBuilder: (context, action) => closeWidget,
        openBuilder: (context, action) => openWidget);
  }
}
