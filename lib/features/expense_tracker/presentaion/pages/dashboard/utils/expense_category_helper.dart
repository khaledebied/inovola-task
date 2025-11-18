import 'package:flutter/material.dart';

class ExpenseCategoryHelper {
  static String getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'food & dining':
      case 'groceries':
        return '🛒';
      case 'transportation':
        return '🚗';
      case 'shopping':
        return '🛍';
      case 'entertainment':
        return '🍿';
      case 'bills & utilities':
        return '💡';
      case 'healthcare':
        return '🏥';
      case 'travel':
        return '✈';
      case 'education':
        return '📚';
      case 'personal care':
        return '💅';
      case 'rent':
        return '🏠';
      default:
        return '💰';
    }
  }

  static Color getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'food & dining':
      case 'groceries':
        return const Color(0xFF6B7FFF);
      case 'transportation':
        return const Color(0xFFA78BFA);
      case 'shopping':
        return const Color(0xFF60A5FA);
      case 'entertainment':
        return const Color(0xFFFFA173);
      case 'bills & utilities':
        return const Color(0xFFFCD34D);
      case 'healthcare':
        return const Color(0xFFF87171);
      case 'travel':
        return const Color(0xFF34D399);
      case 'education':
        return const Color(0xFF818CF8);
      case 'personal care':
        return const Color(0xFFFBBF24);
      case 'rent':
        return const Color(0xFFFFB084);
      default:
        return const Color(0xFF6B7FFF);
    }
  }
}

