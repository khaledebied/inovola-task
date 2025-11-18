import 'package:flutter/material.dart';

class DashboardBottomNavigation extends StatelessWidget {
  const DashboardBottomNavigation({Key? key}) : super(key: key);

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
          _buildNavItem(Icons.home_rounded, true),
          _buildNavItem(Icons.bar_chart_rounded, false),
          const SizedBox(width: 64), // Space for FAB
          _buildNavItem(Icons.credit_card_rounded, false),
          _buildNavItem(Icons.person_rounded, false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Icon(
        icon,
        color: isSelected ? const Color(0xFF4C6FFF) : const Color(0xFF9CA3AF),
        size: 28,
      ),
    );
  }
}

