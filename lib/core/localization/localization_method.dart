import 'package:expense_tracker/core/helpers/di.dart';

import '../helpers/global_context.dart';
import 'set_localization.dart';

String tr(String key) {
  return SetLocalization.of(getIt<GlobalContext>().context())!.getTranslateValue(key);
}
