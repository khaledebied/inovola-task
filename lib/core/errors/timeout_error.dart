import 'package:expense_tracker/core/localization/translate.dart';

import 'base_error.dart';

class TimeoutError extends BaseError {
  TimeoutError() : super(Translate.s.error_Timeout_Error);
}
