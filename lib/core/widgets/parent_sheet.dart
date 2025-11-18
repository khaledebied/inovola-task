import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParentSheet extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final EdgeInsets? childPadding;

  const ParentSheet({
    Key? key,
    @required this.child,
    this.childPadding,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.r),
        ),
        color: color ?? Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 30.h),
          SizedBox(height: 15.h),
          Padding(
            padding: childPadding ?? EdgeInsets.zero,
            child: child,
          ),
        ],
      ),
    );
  }
}
