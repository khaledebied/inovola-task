import 'dart:io';
import 'package:expense_tracker/core/helpers/di.dart';
import 'package:expense_tracker/core/helpers/local_storage/local_storage.dart';
import 'package:expense_tracker/core/storage/hive_adapters.dart';
import 'package:expense_tracker/core/theme/themes/app_theme.dart';
import 'package:expense_tracker/features/auth/presentation/pages/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await _initializeHive();

  // Initialize dependency injection
  await configureDependencies();

  // Initialize local storage
  await getIt<LocalStorage>().init();

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

Future<void> _initializeHive() async {
  await Hive.initFlutter();

  // Register adapters
  registerHiveAdapters();

  // Open boxes
  await Hive.openBox('expenses');
  await Hive.openBox('unsynced_expenses');
  await Hive.openBox('app_settings');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
  }
}
