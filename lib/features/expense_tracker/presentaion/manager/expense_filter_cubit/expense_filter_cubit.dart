import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_filter_entity/expense_filter_entity.dart';

import '../../../../../core/bloc/generic_cubit/generic_cubit.dart';

class ExpenseFilterCubit extends GenericBloc<ExpenseFilterEntity> {
  ExpenseFilterCubit() : super(const ExpenseFilterEntity());

  void updatePeriod(String period) {
    onUpdateData(state.data.copyWith(period: period));
  }

  void updateCategory(String? category) {
    onUpdateData(state.data.copyWith(category: category));
  }

  void updateDateRange(DateTime? startDate, DateTime? endDate) {
    onUpdateData(state.data.copyWith(
      startDate: startDate,
      endDate: endDate,
      period: 'custom', // Set to custom when date range is manually set
    ));
  }

  void resetFilter() {
    onUpdateToInitState(const ExpenseFilterEntity());
  }

  ExpenseFilterEntity getCurrentFilter() => state.data;
}
