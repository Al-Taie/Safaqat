import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:safaqat/app_binding.dart';
import 'package:safaqat/safaqat/app/utils/logger.dart';
import 'package:safaqat/safaqat/presentation/ui/main_tabs/main_tabs_page.dart';

import 'localization/app_translation.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Color(0xffaa0000),
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();

  Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const MainTabsPage(),
      initialBinding: AppBindings(),
      translations: AppTranslation(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}
