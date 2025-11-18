import 'package:expense_tracker/core/theme/colors/colors_extension.dart';
import 'package:expense_tracker/core/widgets/GenericTextField.dart';
import 'package:flutter/material.dart';

class PasswordFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool showPassword;
  final VoidCallback onToggleVisibility;
  final Function(String) onChanged;

  const PasswordFieldWidget({
    Key? key,
    required this.controller,
    required this.showPassword,
    required this.onToggleVisibility,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        GenericTextField(
          'Password',
          '••••••••••••••••••',
          fieldTypes: showPassword ? FieldTypes.normal : FieldTypes.password,
          controller: controller,
          type: TextInputType.visiblePassword,
          action: TextInputAction.done,
          fillColor: const Color(0xFFF5F5F5),
          enableBorderColor: Colors.grey[300],
          focusBorderColor: context.colors.primary,
          hintColor: Colors.grey[400],
          radius: BorderRadius.circular(12),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          suffixIcon: IconButton(
            onPressed: onToggleVisibility,
            icon: Icon(
              showPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: Colors.grey[600],
            ),
          ),
          onChange: onChanged,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
      ],
    );
  }
}

