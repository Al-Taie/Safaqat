import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:safaqat/app_binding.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/preferences_keys.dart';
import 'package:safaqat/safaqat/app/utils/logger.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/forgot/forgot_page.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/login_page.dart';
import 'package:safaqat/safaqat/presentation/ui/main_tabs/main_tabs_page.dart';
import 'package:safaqat/safaqat/presentation/ui/splash/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localization/app_translation.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColors.background,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  final isLoggedIn = preferences.containsKey(PrefsKeys.token);

  Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);

  runApp(MainApp(isLoggedIn: isLoggedIn));
}

class MainApp extends StatelessWidget {
  final bool isLoggedIn;

  const MainApp({Key? key, this.isLoggedIn = false}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: isLoggedIn ? const MainTabsPage() : const LoginPage(),
      home: const ForgotPage(),
      initialBinding: AppBindings(),
      translations: AppTranslation(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}
