import 'package:expense_tracker/features/expense_tracker/presentaion/pages/dashboard/widgets/coming_soon_screen.dart';
import 'package:flutter/material.dart';

class DashboardBottomNav extends StatelessWidget {
  const DashboardBottomNav({Key? key}) : super(key: key);

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
          _buildNavItem(Icons.home_rounded, true, null),
          _buildNavItem(
            Icons.bar_chart_rounded,
            false,
            () => _navigateToComingSoon(context),
          ),
          const SizedBox(width: 64), // Space for FAB
          _buildNavItem(
            Icons.credit_card_rounded,
            false,
            () => _navigateToComingSoon(context),
          ),
          _buildNavItem(
            Icons.person_rounded,
            false,
            () => _navigateToComingSoon(context),
          ),
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

  void _navigateToComingSoon(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const ComingSoonScreen(),
      ),
    );
  }
}

