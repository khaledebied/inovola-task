import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expense_tracker/core/theme/colors/colors_extension.dart';
import 'package:expense_tracker/core/theme/text/app_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Function? onBackPress;
  final Color? backgroundColor;
  final double? height;
  final double? leadingWidth;
  final Color titleColor;
  final Color iconColor;
  final bool? hasBackButton;
  final bool? centerTitle;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.onBackPress,
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.black,
    this.iconColor = Colors.black,
    this.actions,
    this.height,
    this.leadingWidth,
    this.hasBackButton = false,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      foregroundColor: backgroundColor,
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      title: Text(
        title ?? '',
        style: AppTextStyle.s16_w700(color: context.colors.black),
      ),
      leadingWidth: leadingWidth,
      leading: leading ??
          (hasBackButton == true
              ? Container(
                  decoration: const BoxDecoration(
                      // shape: BoxShape.circle,
                      // border: Border.all(color: const Color(0xffD5D5D5)),
                      ),
                  margin: EdgeInsetsDirectional.only(start: 10.w),
                  child: InkWell(
                    onTap: () {
                      if (onBackPress != null) {
                        onBackPress?.call();
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: const Color(0xff2E2E2E),
                      size: 24.sp,
                    ),
                  ),
                )
              : null),
      actions: getActions(actions),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 56);

  List<Widget>? getActions(List<Widget>? actions) {
    List<Widget> mActions = [];
    actions?.forEach((element) {
      mActions.add(Padding(
        padding: const EdgeInsetsDirectional.only(end: 12),
        child: element,
      ));
    });
    return mActions;
  }
}
