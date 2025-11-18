import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expense_tracker/core/bloc/device_cubit/device_cubit.dart';
import 'package:expense_tracker/core/constants/input_field_style/custom_input_decoration.dart';
import 'package:expense_tracker/core/theme/colors/colors_extension.dart';
import 'package:expense_tracker/core/theme/text/app_text_style.dart';

import 'CustomDropDown.dart';

class DropdownTextField<DataType> extends StatefulWidget {
  final dynamic data;
  final GlobalKey? dropKey;
  final String? label;
  final String? hint;
  final String? searchHint;
  final DataType? selectedItem;
  final bool showSelectedItem;
  final EdgeInsets? margin;
  final double? fontSize;
  final double? labelSize;
  final double? textSize;
  final String? Function(dynamic) validate;
  final dynamic onChange;
  final dynamic finData;
  final EdgeInsets? arrowBtnPadding;
  final EdgeInsets? clearBtnPadding;
  final EdgeInsets? contentPadding;
  final bool useName;
  final Color? enableColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? buttonsColor;
  final BorderRadius? radius;
  final Widget? suffix;
  final Widget? prefix;

  DropdownTextField(
      {this.label,
      this.hint,
      this.margin,
      required this.validate,
      this.contentPadding,
      this.clearBtnPadding,
      this.arrowBtnPadding,
      this.useName = true,
      this.searchHint,
      this.onChange,
      this.fontSize,
      this.textSize,
      this.labelSize,
      this.hintColor,
      this.fillColor,
      this.buttonsColor,
      this.finData,
      this.dropKey,
      this.data,
      this.enableColor,
      this.selectedItem,
      this.radius,
      this.showSelectedItem = false,
      this.suffix,
      this.prefix});

  @override
  _DropdownTextFieldState<DataType> createState() => _DropdownTextFieldState<DataType>();
}

class _DropdownTextFieldState<DataType> extends State<DropdownTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? EdgeInsets.zero,
      child: DropdownSearch<DataType>(
        key: widget.dropKey,
        mode: Mode.BOTTOM_SHEET,
        isFilteredOnline: false,
        maxHeight: 350.h,
        label: widget.label,
        items: widget.data,
        onFind: widget.finData,
        validator: widget.validate,
        onChanged: widget.onChange,
        showSearchBox: true,
        showClearButton: true,
        popupBackgroundColor: context.colors.white,
        clearButton: Padding(
          padding: widget.clearBtnPadding ?? const EdgeInsets.symmetric(horizontal: 5),
          child: Icon(Icons.clear, size: 20.sp, color: widget.buttonsColor ?? Colors.black),
        ),
        dropDownButton: Container(
          height: 26.h,
          width: 26.w,
          alignment: AlignmentDirectional.center,
          // padding: widget.arrowBtnPadding ??
          //     const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(color: context.colors.lightGrey, shape: BoxShape.circle),
          child: Icon(Icons.keyboard_arrow_down_outlined, size: 18.sp, color: widget.buttonsColor ?? Colors.black),
        ),
        selectedItem: widget.selectedItem,
        itemAsString: (dynamic u) => widget.useName ? u.name : u,
        showSelectedItem: widget.showSelectedItem,
        style: AppTextStyle.s14_w400(color: context.colors.black).copyWith(
          fontSize: widget.textSize,
        ),
        searchBoxStyle: AppTextStyle.s16_w500(color: context.colors.black),
        searchBoxDecoration: CustomInputDecoration(
          labelTxt: widget.searchHint ?? "بحث",
          hint: widget.searchHint ?? "بحث",
          customFillColor: context.colors.lightGrey,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          prefIcon: widget.prefix,
          sufIcon: widget.suffix,
          lang: context.watch<DeviceCubit>().state.model.locale.languageCode,
        ),
        popupTitle: Container(
          height: 50.h,
          width: double.infinity,
          alignment: AlignmentDirectional.topStart,
          decoration: BoxDecoration(
            color: context.colors.white,
          ),
          child: Container(
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Text(
              widget.label != null ? widget.label ?? "" : widget.hint ?? "",
              style: AppTextStyle.s16_w700(color: context.colors.black),
            ),
          ),
        ),
        dropdownSearchDecoration: CustomInputDecoration(
          labelTxt: widget.label,
          hint: widget.hint,
          enableColor: widget.enableColor,
          customFillColor: widget.fillColor,
          padding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          hintColor: widget.hintColor,
          borderRadius: widget.radius,
          lang: context.watch<DeviceCubit>().state.model.locale.languageCode,
        ),
      ),
    );
  }
}
