import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:expense_tracker/core/theme/colors/colors_extension.dart';
import 'package:expense_tracker/res.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final double? height, width, borderWidth, errorIconHeight, errorIconWidth;
  final BorderRadius? borderRadius;
  final ColorFilter? colorFilter;
  final AlignmentGeometry? alignment;
  final Widget? child;
  final Widget? placeHolder;
  final Color? borderColor;
  final Color? bgColor;
  final Color? errorIconColor;
  final BoxShape? boxShape;
  final bool haveRadius;
  final bool? hasDefaultProfileImage;
  const CachedImage(
      {super.key,
      required this.url,
      this.fit,
      this.width,
      this.height,
      this.placeHolder,
      this.borderRadius,
      this.colorFilter,
      this.alignment,
      this.child,
      this.boxShape,
      this.borderColor,
      this.borderWidth,
      this.bgColor,
      this.errorIconColor,
      this.errorIconHeight,
      this.errorIconWidth,
      this.haveRadius = true,
      this.hasDefaultProfileImage});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: fit ?? BoxFit.fill, colorFilter: colorFilter),
          borderRadius: haveRadius ? borderRadius ?? BorderRadius.circular(0) : null,
          shape: boxShape ?? BoxShape.rectangle,
          border: Border.all(color: borderColor ?? Colors.transparent, width: borderWidth ?? 1),
        ),
        alignment: alignment ?? Alignment.center,
        child: child,
      ),
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: haveRadius ? borderRadius ?? BorderRadius.circular(0) : null,
          border: Border.all(color: borderColor ?? Colors.transparent, width: 1),
          shape: boxShape ?? BoxShape.rectangle,
          color: bgColor ?? context.colors.primary.withValues(alpha: .5),
        ),
        child: SpinKitFadingCircle(
          color: context.colors.primary,
          size: 30.0,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor ?? context.colors.primary.withValues(alpha: .5),
          borderRadius: haveRadius ? borderRadius ?? BorderRadius.circular(0) : null,
          border: Border.all(color: borderColor ?? Colors.transparent, width: 1),
          shape: boxShape ?? BoxShape.rectangle,
        ),
        child: placeHolder ??
            child ??
            (hasDefaultProfileImage == true
                ? SvgPicture.asset(
                    Res.defaultImage,
                    color: errorIconColor,
                    width: errorIconWidth,
                    height: errorIconHeight,
                  )
                : Container()),
      ),
    );
  }
}
