import 'package:flutter/material.dart';

class CurrencyDropdown extends StatelessWidget {
  final List<String> currencies;
  final String selectedCurrency;
  final Function(String) onCurrencyChanged;

  const CurrencyDropdown({
    Key? key,
    required this.currencies,
    required this.selectedCurrency,
    required this.onCurrencyChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF6C5CE7).withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF6C5CE7)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          padding: EdgeInsets.zero,
          value: selectedCurrency,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFF6C5CE7),
            size: 20,
          ),
          style: const TextStyle(
            color: Color(0xFF6C5CE7),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          dropdownColor: Colors.white,
          items: currencies.map((currency) {
            return DropdownMenuItem<String>(
              value: currency,
              child: Text(currency),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              onCurrencyChanged(value);
            }
          },
        ),
      ),
    );
  }
}
