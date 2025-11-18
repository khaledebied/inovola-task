import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppUtils {
  static String formatCurrency(double amount, {String currency = 'USD'}) {
    final formatter = NumberFormat.currency(
      symbol: _getCurrencySymbol(currency),
      decimalDigits: 2,
    );
    return formatter.format(amount);
  }

  static String formatDate(DateTime date, {String format = 'dd/MM/yyyy'}) {
    final formatter = DateFormat(format);
    return formatter.format(date);
  }

  static String formatDateTime(DateTime dateTime) {
    final formatter = DateFormat('dd/MM/yyyy HH:mm');
    return formatter.format(dateTime);
  }

  static String getRelativeTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 7) {
      return formatDate(date);
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'Just now';
    }
  }

  static String _getCurrencySymbol(String currency) {
    switch (currency.toUpperCase()) {
      case 'USD':
        return '\$';
      case 'EUR':
        return '€';
      case 'GBP':
        return '£';
      case 'JPY':
        return '¥';
      case 'CAD':
        return 'C\$';
      case 'AUD':
        return 'A\$';
      default:
        return currency;
    }
  }

  static Color getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'food & dining':
        return Colors.orange;
      case 'transportation':
        return Colors.blue;
      case 'shopping':
        return Colors.purple;
      case 'entertainment':
        return Colors.pink;
      case 'bills & utilities':
        return Colors.yellow[700]!;
      case 'healthcare':
        return Colors.red;
      case 'travel':
        return Colors.teal;
      case 'education':
        return Colors.green;
      case 'personal care':
        return Colors.indigo;
      default:
        return Colors.grey;
    }
  }

  static String getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'food & dining':
        return '🍽';
      case 'transportation':
        return '🚗';
      case 'shopping':
        return '🛍';
      case 'entertainment':
        return '🎬';
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
      default:
        return '💰';
    }
  }

  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  static bool isValidAmount(String amount) {
    final parsed = double.tryParse(amount);
    return parsed != null && parsed > 0;
  }

  static String getFileExtension(String filePath) {
    return filePath.split('.').last.toLowerCase();
  }

  static bool isValidImageFile(File file) {
    final extension = getFileExtension(file.path);
    return ['jpg', 'jpeg', 'png', 'gif'].contains(extension);
  }

  static Future<bool> isFileUnderSizeLimit(File file, int maxSizeInBytes) async {
    final fileSize = await file.length();
    return fileSize <= maxSizeInBytes;
  }

  static void showSnackBar(BuildContext context, String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : null,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  static Future<void> showConfirmDialog(
      BuildContext context, {
        required String title,
        required String content,
        required VoidCallback onConfirm,
        String confirmText = 'Confirm',
        String cancelText = 'Cancel',
      }) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              TextButton(
                child: Text(cancelText),
                onPressed: () => Navigator.of(context).pop(),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onConfirm();
                },
                child: Text(confirmText),
              ),
            ],
          );
           },
            );
      }
}