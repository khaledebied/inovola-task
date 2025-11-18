import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:expense_tracker/core/bloc/device_cubit/device_cubit.dart';
import 'package:expense_tracker/core/constants/app_strings.dart';
import 'package:expense_tracker/core/firebase/remote_config.dart';
import 'package:expense_tracker/my_app.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

@lazySingleton
class SentryHelper {
  Future<void> init() async {
    const remoteConfigKey = AppStrings.sentryToken;
    final remoteConfig = FirebaseRemoteConfigService();
    final sentryKey = remoteConfig.getString(remoteConfigKey);
    await SentryFlutter.init(
      (options) {
        options.dsn = sentryKey;
        options.tracesSampleRate = 0.01;
        options.debug = false;
        options.enableAppHangTracking = false;
      },
      appRunner: () => runApp(
        SentryWidget(
          child: BlocProvider(
            create: (BuildContext context) => DeviceCubit(),
            child: Phoenix(child: const MyApp()),
          ),
        ),
      ),
    );
  }
}
