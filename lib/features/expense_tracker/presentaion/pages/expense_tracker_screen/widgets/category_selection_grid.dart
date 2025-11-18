import 'package:flutter/material.dart';

class CategorySelectionGrid extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CategorySelectionGrid({
    Key? key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.85,
        crossAxisSpacing: 16,
        mainAxisSpacing: 20,
      ),
      itemCount: categories.length + 1, // +1 for "Add Category" button
      itemBuilder: (context, index) {
        // Add Category button at the end
        if (index == categories.length) {
          return GestureDetector(
            onTap: () {
              // TODO: Implement add category functionality
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF6C5CE7),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Color(0xFF6C5CE7),
                    size: 28,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Add Category',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2D3436),
                  ),
                ),
              ],
            ),
          );
        }

        final category = categories[index];
        final isSelected = category == selectedCategory;

        return GestureDetector(
          onTap: () => onCategorySelected(category),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF6C5CE7)
                      : _getCategoryColor(category),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getCategoryIcon(category),
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                category,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: const Color(0xFF2D3436),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'groceries':
        return Icons.shopping_cart;
      case 'entertainment':
        return Icons.local_bar;
      case 'gas':
        return Icons.local_gas_station;
      case 'shopping':
        return Icons.shopping_bag;
      case 'news paper':
      case 'newspaper':
        return Icons.newspaper;
      case 'transport':
      case 'transportation':
        return Icons.directions_car;
      case 'rent':
        return Icons.apartment;
      case 'food & dining':
      case 'food':
        return Icons.restaurant;
      case 'bills & utilities':
      case 'bills':
        return Icons.receipt_long;
      case 'healthcare':
        return Icons.local_hospital;
      case 'travel':
        return Icons.flight;
      case 'education':
        return Icons.school;
      case 'personal care':
        return Icons.face;
      default:
        return Icons.category;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'groceries':
        return const Color(0xFFB8B8D1);
      case 'entertainment':
        return const Color(0xFF6C5CE7);
      case 'gas':
        return const Color(0xFFFFB6C1);
      case 'shopping':
        return const Color(0xFFFFA726);
      case 'news paper':
      case 'newspaper':
        return const Color(0xFFFFE5B4);
      case 'transport':
      case 'transportation':
        return const Color(0xFFB8B8F0);
      case 'rent':
        return const Color(0xFFFFE5B4);
      case 'food & dining':
      case 'food':
        return const Color(0xFFFF6B6B);
      case 'bills & utilities':
      case 'bills':
        return const Color(0xFFFFC107);
      case 'healthcare':
        return const Color(0xFF26C6DA);
      case 'travel':
        return const Color(0xFF66BB6A);
      case 'education':
        return const Color(0xFF42A5F5);
      case 'personal care':
        return const Color(0xFFAB47BC);
      default:
        return const Color(0xFF9E9E9E);
    }
  }
}

