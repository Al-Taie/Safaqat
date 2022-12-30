import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:safaqat/app_binding.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/preferences_keys.dart';
import 'package:safaqat/safaqat/app/utils/logger.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/login_page.dart';
import 'package:safaqat/safaqat/presentation/ui/collection_page.dart';
import 'package:safaqat/safaqat/presentation/ui/main_tabs/authorized_main_tabs_page.dart';
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
  await Future.delayed(const Duration(seconds: 3));

  runApp(
    MainApp(
      isLoggedIn: isLoggedIn,
      preferences: preferences,
    ),
  );
}

class MainApp extends StatelessWidget {
  final bool isLoggedIn;
  final SharedPreferences preferences;

  const MainApp({
    Key? key,
    required this.preferences,
    this.isLoggedIn = false,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final isArabicLanguage = Get.deviceLocale?.languageCode == 'ar';

    return GetMaterialApp(
      home: isLoggedIn ? AuthorizedMainTabsPage() : const LoginPage(),
      initialBinding: AppBindings(preferences),
      translations: AppTranslation(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('ar', 'IQ'),
      theme: ThemeData(
        fontFamily: (isArabicLanguage) ? 'Cairo' : '',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
