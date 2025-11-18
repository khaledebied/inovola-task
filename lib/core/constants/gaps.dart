import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expense_tracker/core/theme/colors/app_colors.dart';

import 'dimens.dart';

class Gaps {
  Gaps._();

  static Widget hGap4 = SizedBox(width: Dimens.dp4.w);
  static Widget hGap5 = SizedBox(width: Dimens.dp5.w);
  static Widget hGap8 = SizedBox(width: Dimens.dp8.w);
  static Widget hGap10 = SizedBox(width: Dimens.dp10.w);
  static Widget hGap12 = SizedBox(width: Dimens.dp12.w);
  static Widget hGap13 = SizedBox(width: Dimens.dp13.w);
  static Widget hGap14 = SizedBox(width: Dimens.dp14.w);
  static Widget hGap15 = SizedBox(width: Dimens.dp15.w);
  static Widget hGap16 = SizedBox(width: Dimens.dp16.w);
  static Widget hGap20 = SizedBox(width: Dimens.dp20.w);
  static Widget hGap22 = SizedBox(width: Dimens.dp22.w);
  static Widget hGap32 = SizedBox(width: Dimens.dp32.w);

  static Widget hGap(double value) => SizedBox(width: value.w);

  static Widget vGap4 = SizedBox(height: Dimens.dp4.h);
  static Widget vGap5 = SizedBox(height: Dimens.dp5.h);
  static Widget vGap8 = SizedBox(height: Dimens.dp8.h);
  static Widget vGap10 = SizedBox(height: Dimens.dp10.h);
  static Widget vGap12 = SizedBox(height: Dimens.dp12.h);
  static Widget vGap13 = SizedBox(height: Dimens.dp13.h);
  static Widget vGap14 = SizedBox(height: Dimens.dp14.h);
  static Widget vGap15 = SizedBox(height: Dimens.dp15.h);
  static Widget vGap16 = SizedBox(height: Dimens.dp16.h);
  static Widget vGap20 = SizedBox(height: Dimens.dp20.h);
  static Widget vGap24 = SizedBox(height: Dimens.dp24.h);
  static Widget vGap32 = SizedBox(height: Dimens.dp32.h);
  static Widget vGap50 = SizedBox(height: Dimens.dp50.h);
  static Widget vGap64 = SizedBox(height: Dimens.dp64.h);
  static Widget vGap128 = SizedBox(height: Dimens.dp128.h);
  static Widget vGap256 = SizedBox(height: Dimens.dp256.h);

  static Widget vGap(double value) => SizedBox(height: value.h);

  static Widget line = Divider(color: AppColors.noContextInstance.greyWhite);

  static Widget vLine = SizedBox(
    width: 0.5.w,
    height: Dimens.dp15.h,
    child: VerticalDivider(color: AppColors.noContextInstance.blackOpacity),
  );

  static Widget empty = const Offstage(offstage: true, child: SizedBox.shrink());
}
