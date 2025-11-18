import 'dart:io';
import 'package:expense_tracker/core/bloc/generic_cubit/generic_cubit.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/manager/add_expense_cubit/add_expense_cubit.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/pages/expense_tracker_screen/widgets/category_selection_grid.dart';
import 'package:expense_tracker/features/expense_tracker/presentaion/pages/expense_tracker_screen/widgets/currency_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  late AddExpenseCubit _cubit;
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cubit = AddExpenseCubit();
  }

  @override
  void dispose() {
    _cubit.close();
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close, color: Color(0xFF2D3436)),
          ),
          title: const Text(
            'Add Expense',
            style: TextStyle(
              color: Color(0xFF2D3436),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            BlocConsumer<AddExpenseCubit, GenericState<AddExpenseData>>(
              listener: (context, state) {
                if (state is GenericFailedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              builder: (context, state) {
                return TextButton(
                  onPressed: state.data.isSaving ? null : _saveExpense,
                  child: state.data.isSaving
                      ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                      : const Text(
                    'Save',
                    style: TextStyle(
                      color: Color(0xFF6C5CE7),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: BlocBuilder<AddExpenseCubit, GenericState<AddExpenseData>>(
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('Category'),
                    const SizedBox(height: 12),
                    CategorySelectionGrid(
                      categories: state.data.availableCategories,
                      selectedCategory: state.data.category,
                      onCategorySelected: _cubit.updateCategory,
                    ),
                    const SizedBox(height: 32),

                    _buildSectionTitle('Amount & Currency'),
                    const SizedBox(height: 12),
                    _buildAmountSection(state.data),
                    const SizedBox(height: 32),

                    _buildSectionTitle('Date'),
                    const SizedBox(height: 12),
                    _buildDatePicker(state.data),
                    const SizedBox(height: 32),

                    _buildSectionTitle('Description (Optional)'),
                    const SizedBox(height: 12),
                    _buildDescriptionField(),
                    const SizedBox(height: 32),

                    _buildSectionTitle('Receipt (Optional)'),
                    const SizedBox(height: 12),
                    _buildReceiptSection(state.data),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2D3436),
      ),
    );
  }

  Widget _buildAmountSection(AddExpenseData data) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: _amountController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3436),
                  ),
                  decoration: const InputDecoration(
                    hintText: '0.00',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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
              const SizedBox(width: 16),
              CurrencyDropdown(
                currencies: data.availableCurrencies,
                selectedCurrency: data.currency,
                onCurrencyChanged: _cubit.updateCurrency,
              ),
            ],
          ),
          if (data.convertedAmount != null && data.currency != 'USD')
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                '≈ \$${data.convertedAmount!.toStringAsFixed(2)} USD',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDatePicker(AddExpenseData data) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_today, color: Color(0xFF6C5CE7)),
            const SizedBox(width: 16),
            Text(
              '${data.selectedDate.day}/${data.selectedDate.month}/${data.selectedDate.year}',
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF2D3436),
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionField() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: _descriptionController,
        maxLines: 3,
        decoration: const InputDecoration(
          hintText: 'Add a note about this expense...',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
        ),
        onChanged: _cubit.updateDescription,
      ),
    );
  }

  Widget _buildReceiptSection(AddExpenseData data) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: data.receiptFile == null
          ? GestureDetector(
        onTap: _pickReceipt,
        child: Column(
          children: [
            Icon(
              Icons.camera_alt_outlined,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 12),
            Text(
              'Upload Receipt',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      )
          : Column(
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
              TextButton.icon(
                onPressed: _pickReceipt,
                icon: const Icon(Icons.edit),
                label: const Text('Change'),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () => _cubit.updateReceiptFile(null),
                icon: const Icon(Icons.delete, color: Colors.red),
                label: const Text('Remove', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: _cubit.state.data.selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      _cubit.updateDate(date);
    }
  }

  void _pickReceipt() async {
    final picker = ImagePicker();
    final source = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Receipt'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
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

  void _saveExpense() async {
    if (!_formKey.currentState!.validate()) return;

    if (_cubit.state.data.category.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a category')),
      );
      return;
    }

    final success = await _cubit.saveExpense(context);

  }
}