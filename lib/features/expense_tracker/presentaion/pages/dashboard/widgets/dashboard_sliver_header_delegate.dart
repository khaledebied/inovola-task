import 'package:expense_tracker/core/theme/colors/colors_extension.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/pages/dashboard/widgets/dashboard_balance_card.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DashboardSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double minHeight;
  final VoidCallback onMonthFilterTap;

  DashboardSliverHeaderDelegate({
    required this.expandedHeight,
    required this.minHeight,
    required this.onMonthFilterTap,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;
    final animatedProgress = Curves.easeInOut.transform(progress);

    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        // Gradient background
        Container(
          decoration: BoxDecoration(
            color: context.colors.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15 * (1 - animatedProgress)),
              bottomRight: Radius.circular(15 * (1 - animatedProgress)),
            ),
          ),
        ),

        // Content
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Opacity(
                opacity: (1 - animatedProgress * 2).clamp(0.0, 1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top row: Profile pic and dropdown
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildProfileSection(animatedProgress),
                        _buildMonthFilter(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Balance card - positioned and animated
        if (shrinkOffset < maxExtent - 80)
          Positioned(
            bottom: -40,
            left: 0,
            right: 0,
            child: Center(
              child: Transform.scale(
                scale: (1 - animatedProgress).clamp(0.7, 1.0),
                child: Opacity(
                  opacity: (1 - animatedProgress * 1.5).clamp(0.0, 1.0),
                  child: const DashboardBalanceCard(),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildProfileSection(double progress) {
    return Row(
      children: [
        // Profile picture
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
            image: const DecorationImage(
              image: NetworkImage('https://i.pravatar.cc/150?img=1'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Greeting
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning',
              style: TextStyle(
                color: Colors.white,
                fontSize: math.max(14 * (1 - progress * 0.3), 10),
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Shihab Rahman',
              style: TextStyle(
                fontSize: math.max(20 * (1 - progress * 0.3), 16),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMonthFilter() {
    return InkWell(
      onTap: onMonthFilterTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Text(
              'This month',
              style: TextStyle(
                color: const Color(0xFF4C6FFF),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.keyboard_arrow_down,
              color: const Color(0xFF4C6FFF),
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant DashboardSliverHeaderDelegate oldDelegate) {
    return expandedHeight != oldDelegate.expandedHeight ||
        minHeight != oldDelegate.minHeight;
  }
}

