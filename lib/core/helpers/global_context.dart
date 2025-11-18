import 'package:flutter/material.dart';
import 'package:expense_tracker/core/helpers/di.dart';
import 'package:expense_tracker/core/routes/router_imports.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GlobalContext {
  BuildContext context() => getIt.get<AppRouter>().navigatorKey.currentContext!;
}
