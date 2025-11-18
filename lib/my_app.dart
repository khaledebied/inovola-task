import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:expense_tracker/core/bloc/device_cubit/device_cubit.dart';
import 'package:expense_tracker/core/helpers/di.dart';
import 'package:expense_tracker/core/helpers/dynamic_link_helper.dart';
import 'package:expense_tracker/core/localization/set_localization.dart';
import 'package:expense_tracker/core/routes/router_imports.dart';
import 'package:expense_tracker/core/theme/themes/app_dark_theme.dart';
import 'package:expense_tracker/core/theme/themes/app_light_theme.dart';
import 'package:expense_tracker/core/widgets/network_layer/network_layer_widget.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'core/firebase/firebase_analytics_helper.dart';
import 'core/helpers/general_providers.dart';
import 'generated/l10n.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    getIt<FirebaseAnalyticsHelper>().analytics.setConsent(adStorageConsentGranted: false, analyticsStorageConsentGranted: true);
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed && Platform.isIOS) {
      DynamicLinkHelper.instance.retrieveDynamicLink(context);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: GeneralProviders.instance.providers(context),
      child: BlocBuilder<DeviceCubit, DeviceState>(
        builder: (context, state) {
          return AdaptiveTheme(
              light: AppLightTheme().theme,
              dark: AppDarkTheme().theme,
              initial: state.model.themeMode,
              builder: (theme, darkTheme) {
                return DevicePreview(
                    enabled: false,
                    builder: (context) {
                      return MaterialApp.router(
                        debugShowCheckedModeBanner: false,
                        useInheritedMediaQuery: true,
                        title: "Foz",
                        darkTheme: darkTheme,
                        theme: theme,
                        supportedLocales: S.delegate.supportedLocales,
                        locale: state.model.locale,
                        // These delegates make sure that the localization data for the proper language is loaded
                        localizationsDelegates: const [
                          // 1
                          S.delegate,
                          // 2
                          SetLocalization.localizationsDelegate,
                          DefaultCupertinoLocalizations.delegate,
                          // Built-in localization of basic text for Material widgets
                          GlobalMaterialLocalizations.delegate,
                          // Built-in localization for text direction LTR/RTL
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                        ],
                        routerDelegate: getIt.get<AppRouter>().delegate(navigatorObservers: () {
                          return [FirebaseAnalyticsObserver(analytics: getIt<FirebaseAnalyticsHelper>().analytics), SentryNavigatorObserver(),];
                        }),
                        routeInformationParser: getIt.get<AppRouter>().defaultRouteParser(),
                        builder: EasyLoading.init(builder: (ctx, child) {
                          ScreenUtil.init(ctx);
                          return NetworkLayerWidget(
                            isNetworkConnected: state.model.isNetworkConnected,
                            child: child!,
                          );
                        }),
                      );
                    });
              });
        },
      ),
    );
  }
}
