import 'package:flutter/material.dart';
import 'package:expense_tracker/core/constants/dimens.dart';
import 'package:expense_tracker/core/theme/colors/colors_extension.dart';
import 'package:expense_tracker/core/widgets/bottom_sheet_views/draggable_scrollable/app_draggable_scrollable_sheet.dart';

class ScrollableBodyFixedHeaderDraggableSheet extends StatelessWidget {
  final Widget header;
  final ScrollableWidgetBuilder bodyBuilder;

  const ScrollableBodyFixedHeaderDraggableSheet({super.key, required this.header, required this.bodyBuilder});

  @override
  Widget build(BuildContext context) {
    return AppDraggableScrollableSheet(
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: Dimens.sheetBorderRadius,
            color: context.colors.white,
          ),
          padding: const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 10),
          child: NestedScrollView(
            physics: const NeverScrollableScrollPhysics(),
            controller: scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                /// Header
                SliverToBoxAdapter(child: header)
              ];
            },
            body: bodyBuilder(context, scrollController),
          ),
        );
      },
    );
  }
}
