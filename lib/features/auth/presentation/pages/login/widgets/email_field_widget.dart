import 'package:expense_tracker/core/theme/colors/colors_extension.dart';
import 'package:expense_tracker/core/widgets/GenericTextField.dart';
import 'package:flutter/material.dart';

class EmailFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const EmailFieldWidget({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        GenericTextField(
          'Email',
          'Enter your Name',
          fieldTypes: FieldTypes.normal,
          controller: controller,
          type: TextInputType.emailAddress,
          action: TextInputAction.next,
          fillColor: const Color(0xFFF5F5F5),
          enableBorderColor: Colors.grey[300],
          focusBorderColor: context.colors.primary,
          hintColor: Colors.grey[400],
          radius: BorderRadius.circular(12),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          onChange: onChanged,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
      ],
    );
  }
}

