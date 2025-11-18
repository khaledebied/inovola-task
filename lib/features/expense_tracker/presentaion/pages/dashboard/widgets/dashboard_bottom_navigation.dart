import 'package:flutter/material.dart';

class DashboardBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final VoidCallback? onHomeTap;
  final VoidCallback? onStatsTap;
  final VoidCallback? onCardsTap;
  final VoidCallback? onProfileTap;

  const DashboardBottomNavigation({
    Key? key,
    this.currentIndex = 0,
    this.onHomeTap,
    this.onStatsTap,
    this.onCardsTap,
    this.onProfileTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_rounded, currentIndex == 0, onHomeTap),
          _buildNavItem(Icons.bar_chart_rounded, currentIndex == 1, onStatsTap),
          const SizedBox(width: 64), // Space for FAB
          _buildNavItem(Icons.credit_card_rounded, currentIndex == 2, onCardsTap),
          _buildNavItem(Icons.person_rounded, currentIndex == 3, onProfileTap),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Icon(
          icon,
          color: isSelected ? const Color(0xFF4C6FFF) : const Color(0xFF9CA3AF),
          size: 28,
        ),
      ),
    );
  }
}

