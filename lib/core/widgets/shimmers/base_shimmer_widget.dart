import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BaseShimmerWidget extends StatelessWidget {
  final Widget child;
  final bool? enabled;
  const BaseShimmerWidget({
    super.key,
    required this.child,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: const Color(0xffF9F9FB),
      baseColor: const Color(0xffE6E8EB),
      period: const Duration(seconds: 1),
      loop: 0,
      enabled: enabled ?? false,
      child: child,
    );
  }
}

extension ShimmerExtension on Widget {
  Widget withShimmer({bool enabled = true}) {
    if (!enabled) return this;

    return BaseShimmerWidget(
      enabled: true,
      child: this,
    );
  }
}
