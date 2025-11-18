import 'package:flutter/material.dart';
import 'package:expense_tracker/core/theme/colors/app_colors.dart';
import 'package:expense_tracker/core/theme/text/app_text_style.dart';

enum _AppTextButton {
  minPrimaryColor,
  minWhiteColor,
  minCustomColor,
  maxPrimaryColor,
  maxWhiteColor,
  maxCustomColor,
}

class AppTextButton extends StatelessWidget {
  const AppTextButton._(
      {super.key,
      required _AppTextButton appTextButton,
      required this.text,
      required this.enabled,
      this.onPressed,
      Color? bgColor,
      double? textSize,
      double? maxHeight,
      Color? txtColor})
      : _appTextButton = appTextButton,
        _textColor = txtColor,
        _bgColor = bgColor,
        maxHeight = maxHeight ?? 52,
        _textSize = textSize;

  final _AppTextButton _appTextButton;
  final String text;
  final bool enabled;
  final VoidCallback? onPressed;

  final Color? _bgColor;
  final Color? _textColor;
  final double? _textSize;

  final double minWidth = 100;
  final double maxWidth = double.maxFinite;

  final double minHeight = 40;
  final double maxHeight;

  factory AppTextButton.minPrimary({Key? key, required String text, bool enabled = true, VoidCallback? onPressed}) {
    return AppTextButton._(
      key: key,
      appTextButton: _AppTextButton.minPrimaryColor,
      text: text,
      enabled: enabled,
      onPressed: onPressed,
    );
  }

  factory AppTextButton.minWhite({Key? key, required String text, VoidCallback? onPressed}) {
    return AppTextButton._(
      key: key,
      appTextButton: _AppTextButton.minWhiteColor,
      text: text,
      enabled: true,
      onPressed: onPressed,
    );
  }

  factory AppTextButton.maxPrimary({Key? key, required String text, bool enabled = true, VoidCallback? onPressed}) {
    return AppTextButton._(
      key: key,
      appTextButton: _AppTextButton.maxPrimaryColor,
      text: text,
      enabled: enabled,
      onPressed: onPressed,
    );
  }

  factory AppTextButton.maxWhite({Key? key, required String text, VoidCallback? onPressed}) {
    return AppTextButton._(
      key: key,
      appTextButton: _AppTextButton.maxWhiteColor,
      text: text,
      enabled: true,
      onPressed: onPressed,
    );
  }

  factory AppTextButton.minCustom({
    Key? key,
    required String text,
    required Color bgColor,
    required Color txtColor,
    VoidCallback? onPressed,
    double? textSize,
    double? maxHeight,
  }) {
    return AppTextButton._(
      key: key,
      appTextButton: _AppTextButton.minCustomColor,
      text: text,
      enabled: true,
      bgColor: bgColor,
      txtColor: txtColor,
      onPressed: onPressed,
      textSize: textSize,
      maxHeight: maxHeight,
    );
  }

  factory AppTextButton.maxCustom({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    Color? bgColor,
    Color? txtColor,
    double? textSize,
    double? maxHeight,
  }) {
    return AppTextButton._(
      key: key,
      appTextButton: _AppTextButton.maxCustomColor,
      text: text,
      enabled: true,
      bgColor: bgColor,
      txtColor: txtColor,
      onPressed: onPressed,
      textSize: textSize,
      maxHeight: maxHeight,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (_appTextButton) {
      case _AppTextButton.minPrimaryColor:
        return SizedBox(
          width: minWidth,
          height: minHeight,
          child: BouncingWidget(
            enable: enabled && onPressed != null,
            child: TextButton(
              style: Theme.of(context).textButtonTheme.style?.copyWith(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    foregroundColor: MaterialStateProperty.resolveWith(
                      (_) {
                        return AppColors.of(context).primary;
                      },
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (enabled) {
                          return AppColors.of(context).primary;
                        } else {
                          return AppColors.of(context).blackOpacity;
                        }
                      },
                    ),
                  ),
              onPressed: onPressed,
              child: Text(
                text,
                style: AppTextStyle.s14_w500(
                  color: (enabled ? AppColors.fixedColors.white : AppColors.fixedColors.blackOpacity),
                ),
              ),
            ),
          ),
        );

      case _AppTextButton.minWhiteColor:
        return SizedBox(
          width: minWidth,
          height: minHeight,
          child: BouncingWidget(
            enable: enabled && onPressed != null,
            child: TextButton(
              style: Theme.of(context).textButtonTheme.style?.copyWith(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    foregroundColor: MaterialStateProperty.resolveWith(
                      (_) {
                        return Colors.transparent;
                      },
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        return Colors.transparent;
                      },
                    ),
                  ),
              onPressed: onPressed,
              child: Text(
                text,
                style: AppTextStyle.s14_w500(
                  color: AppColors.of(context).blackOpacity,
                ),
              ),
            ),
          ),
        );

      case _AppTextButton.maxPrimaryColor:
        return SizedBox(
          width: maxWidth,
          height: maxHeight,
          child: BouncingWidget(
            enable: enabled && onPressed != null,
            child: TextButton(
              style: Theme.of(context).textButtonTheme.style?.copyWith(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    foregroundColor: MaterialStateProperty.resolveWith(
                      (_) {
                        return AppColors.of(context).primary;
                      },
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (enabled) {
                          return AppColors.of(context).primary;
                        } else {
                          return AppColors.of(context).blackOpacity;
                        }
                      },
                    ),
                  ),
              onPressed: onPressed,
              child: Text(
                text,
                style: AppTextStyle.s16_w500(
                  color: (enabled ? AppColors.fixedColors.white : AppColors.fixedColors.blackOpacity),
                ),
              ),
            ),
          ),
        );

      case _AppTextButton.maxWhiteColor:
        return SizedBox(
          width: maxWidth,
          height: maxHeight,
          child: BouncingWidget(
            enable: enabled && onPressed != null,
            child: TextButton(
              style: Theme.of(context).textButtonTheme.style?.copyWith(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    foregroundColor: MaterialStateProperty.resolveWith(
                      (_) {
                        return Colors.transparent;
                      },
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        return Colors.transparent;
                      },
                    ),
                  ),
              onPressed: onPressed,
              child: Text(
                text,
                style: AppTextStyle.s16_w500(
                  color: AppColors.of(context).blackOpacity,
                ),
              ),
            ),
          ),
        );
      case _AppTextButton.minCustomColor:
        return SizedBox(
          width: minWidth,
          height: maxHeight,
          child: BouncingWidget(
            enable: enabled && onPressed != null,
            child: TextButton(
              style: Theme.of(context).textButtonTheme.style?.copyWith(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    foregroundColor: MaterialStateProperty.resolveWith(
                      (_) {
                        return _bgColor;
                      },
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (enabled) {
                          return _bgColor;
                        } else {
                          return AppColors.of(context).black;
                        }
                      },
                    ),
                  ),
              onPressed: onPressed,
              child: Text(
                text,
                style: AppTextStyle.s14_w500(
                  color: _textColor!,
                ).copyWith(fontSize: _textSize ?? 14),
              ),
            ),
          ),
        );
      case _AppTextButton.maxCustomColor:
        return SizedBox(
          width: maxWidth,
          height: maxHeight,
          child: BouncingWidget(
            enable: enabled && onPressed != null,
            child: TextButton(
              style: Theme.of(context).textButtonTheme.style?.copyWith(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    foregroundColor: MaterialStateProperty.resolveWith(
                      (_) {
                        return _bgColor;
                      },
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        return _bgColor;
                      },
                    ),
                  ),
              onPressed: onPressed,
              child: Text(
                text,
                style: AppTextStyle.s16_w500(
                  color: _textColor ?? AppColors.fixedColors.white,
                ).copyWith(fontSize: _textSize ?? 16),
              ),
            ),
          ),
        );
    }
  }
}

class BouncingWidget extends StatefulWidget {
  final Widget child;
  final bool enable;

  const BouncingWidget({
    super.key,
    required this.child,
    this.enable = true,
  });

  @override
  State<BouncingWidget> createState() => _BouncingWidgetState();
}

class _BouncingWidgetState extends State<BouncingWidget> with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void didUpdateWidget(BouncingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enable != widget.enable) {
      if (widget.enable) {
        // _controller.forward();
      } else {
        // _controller.reverse();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
      lowerBound: 0.0,
      upperBound: 0.03,
    )..drive(CurveTween(curve: Curves.elasticIn));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      onTapCancel: () {
        widget.enable ? _controller.reverse() : null;
      },
      child: AnimatedBuilder(
          animation: _controller,
          child: widget.child,
          builder: (_, child) {
            _scale = 1 - _controller.value;
            return Transform.scale(
              scale: _scale,
              child: child,
            );
          }),
    );
  }

  void _tapDown(TapDownDetails details) {
    widget.enable ? _controller.forward() : null;
  }

  void _tapUp(TapUpDetails details) {
    widget.enable ? _controller.reverse() : null;
  }
}
