import 'dart:io';
import 'package:expense_tracker/core/bloc/generic_cubit/generic_cubit.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/manager/add_expense_cubit/add_expense_cubit.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/pages/expense_tracker_screen/widgets/category_selection_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

/// Screen for adding a new expense with category, amount, date, and receipt
class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  // Constants for UI styling
  static const Color _backgroundColor = Color(0xFFF8F9FA);
  static const Color _primaryColor = Color(0xff1d55f3);
  static const Color _textColor = Color(0xFF2D3436);
  static const Color _hintColor = Color(0xFFB2BEC3);
  static const Color _inputBackgroundColor = Color(0xFFF5F5F5);
  static const double _borderRadius = 12.0;
  static const double _sectionSpacing = 24.0;
  static const double _itemSpacing = 12.0;

  late AddExpenseCubit _cubit;
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cubit = AddExpenseCubit();
  }

  @override
  void dispose() {
    _cubit.close();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        backgroundColor: _backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back, color: _textColor),
          ),
          title: const Text(
            'Add Expense',
            style: TextStyle(
              color: _textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
        ),
        body: BlocConsumer<AddExpenseCubit, GenericState<AddExpenseData>>(
          listener: (context, state) {
            if (state is GenericFailedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Category Dropdown
                          _buildSectionTitle('Categories'),
                          const SizedBox(height: _itemSpacing),
                          _buildCategoryDropdown(state.data),
                          const SizedBox(height: _sectionSpacing),

                          // Amount Field
                          _buildSectionTitle('Amount & Currency'),
                          const SizedBox(height: _itemSpacing),
                          _buildAmountSection(state.data),
                          const SizedBox(height: _sectionSpacing),

                          // Date Picker
                          _buildSectionTitle('Date'),
                          const SizedBox(height: _itemSpacing),
                          _buildDatePicker(state.data),
                          const SizedBox(height: _sectionSpacing),

                          // Attach Receipt
                          _buildSectionTitle('Attach Receipt'),
                          const SizedBox(height: _itemSpacing),
                          _buildReceiptSection(state.data),
                          const SizedBox(height: 32),

                          // Categories Grid
                          _buildSectionTitle('Categories'),
                          const SizedBox(height: _itemSpacing),
                          CategorySelectionGrid(
                            categories: state.data.availableCategories,
                            selectedCategory: state.data.category,
                            onCategorySelected: _cubit.updateCategory,
                          ),
                          const SizedBox(height: _sectionSpacing),
                        ],
                      ),
                    ),
                  ),
                  
                  // Save Button at Bottom
                  _buildSaveButton(state.data),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// Builds a consistent section title widget
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: _textColor,
      ),
    );
  }

  /// Builds the category dropdown selector
  Widget _buildCategoryDropdown(AddExpenseData data) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: _inputBackgroundColor,
        borderRadius: BorderRadius.circular(_borderRadius),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: data.category.isEmpty ? null : data.category,
          hint: const Text(
            'Select Category',
            style: TextStyle(color: _hintColor, fontSize: 16),
          ),
          icon: const Icon(Icons.keyboard_arrow_down, color: _textColor),
          style: const TextStyle(
            color: _textColor,
            fontSize: 16,
          ),
          items: data.availableCategories.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              _cubit.updateCategory(newValue);
            }
          },
        ),
      ),
    );
  }

  /// Builds the amount input field with currency selector and conversion
  Widget _buildAmountSection(AddExpenseData data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: _inputBackgroundColor,
            borderRadius: BorderRadius.circular(_borderRadius),
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _amountController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(
                    fontSize: 16,
                    color: _textColor,
                  ),
                  decoration: const InputDecoration(
                    hintText: '0.00',
                    hintStyle: TextStyle(color: _hintColor),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an amount';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    final amount = double.tryParse(value) ?? 0.0;
                    _cubit.updateAmount(amount);
                  },
                ),
              ),
              const SizedBox(width: 12),
              _buildCurrencyDropdown(data),
            ],
          ),
        ),
        if (data.convertedAmount != null && data.currency != 'USD')
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16),
            child: Text(
              '≈ \$${data.convertedAmount!.toStringAsFixed(2)} USD',
              style: const TextStyle(
                fontSize: 14,
                color: _hintColor,
              ),
            ),
          ),
      ],
    );
  }

  /// Builds a styled currency dropdown that matches the app's design
  Widget _buildCurrencyDropdown(AddExpenseData data) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: data.currency,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: _textColor,
            size: 18,
          ),
          style: const TextStyle(
            color: _textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          dropdownColor: Colors.white,
          isDense: true,
          items: data.availableCurrencies.map((currency) {
            return DropdownMenuItem<String>(
              value: currency,
              child: Text(currency),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              _cubit.updateCurrency(value);
            }
          },
        ),
      ),
    );
  }

  /// Builds the date picker button with formatted date display
  Widget _buildDatePicker(AddExpenseData data) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: _inputBackgroundColor,
          borderRadius: BorderRadius.circular(_borderRadius),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Row(
          children: [
            Text(
              '${data.selectedDate.day.toString().padLeft(2, '0')}/${data.selectedDate.month.toString().padLeft(2, '0')}/${data.selectedDate.year.toString().substring(2)}',
              style: const TextStyle(
                fontSize: 16,
                color: _hintColor,
              ),
            ),
            const Spacer(),
            const Icon(Icons.calendar_today_outlined, color: _textColor, size: 20),
          ],
        ),
      ),
    );
  }

  /// Builds the receipt upload/preview section
  Widget _buildReceiptSection(AddExpenseData data) {
    if (data.receiptFile != null) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _inputBackgroundColor,
          borderRadius: BorderRadius.circular(_borderRadius),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                data.receiptFile!,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _pickReceipt,
                    icon: const Icon(Icons.edit, size: 18),
                    label: const Text('Change'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF2D3436),
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _cubit.updateReceiptFile(null),
                    icon: const Icon(Icons.delete, size: 18, color: Colors.red),
                    label: const Text('Remove', style: TextStyle(color: Colors.red)),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: _pickReceipt,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: _inputBackgroundColor,
          borderRadius: BorderRadius.circular(_borderRadius),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: const Row(
          children: [
            Text(
              'Upload Image',
              style: TextStyle(
                fontSize: 16,
                color: _hintColor,
              ),
            ),
            Spacer(),
            Icon(Icons.camera_alt_outlined, color: _textColor, size: 20),
          ],
        ),
      ),
    );
  }

  /// Builds the save button at the bottom of the screen
  Widget _buildSaveButton(AddExpenseData data) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: data.isSaving ? null : _saveExpense,
            style: ElevatedButton.styleFrom(
              backgroundColor: _primaryColor,
              foregroundColor: Colors.white,
              disabledBackgroundColor: _primaryColor.withOpacity(0.6),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(_borderRadius),
              ),
            ),
            child: data.isSaving
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  /// Shows date picker dialog for selecting expense date
  Future<void> _selectDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: _cubit.state.data.selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: _primaryColor,
              onPrimary: Colors.white,
              onSurface: _textColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (date != null) {
      _cubit.updateDate(date);
    }
  }

  /// Shows dialog to pick receipt image from camera or gallery
  Future<void> _pickReceipt() async {
    final picker = ImagePicker();
    final source = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Select Receipt',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _textColor,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt, color: _primaryColor),
              title: const Text('Camera'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.photo_library, color: _primaryColor),
              title: const Text('Gallery'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );

    if (source != null) {
      final image = await picker.pickImage(source: source);
      if (image != null) {
        _cubit.updateReceiptFile(File(image.path));
      }
    }
  }

  /// Validates and saves the expense
  Future<void> _saveExpense() async {
    if (!_formKey.currentState!.validate()) return;

    if (_cubit.state.data.category.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please select a category'),
          backgroundColor: Colors.red.shade400,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
      return;
    }

    final success = await _cubit.saveExpense(context);
    
    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Expense saved successfully!'),
          backgroundColor: Colors.green.shade400,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
    }
  }
}