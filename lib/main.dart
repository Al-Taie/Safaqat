import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:safaqat/app_binding.dart';
import 'package:safaqat/safaqat/presentation/ui/main_tabs/main_tabs_page.dart';

import 'safaqat/app/config/strings.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Color(0xffaa0000),
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();

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
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}
