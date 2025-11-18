import 'package:expense_tracker/env/app_env_type.dart';
import 'package:expense_tracker/env/config_handler.dart';

Future<void> main() async {
  await handleConfig(AppEnvType.prod);
}
