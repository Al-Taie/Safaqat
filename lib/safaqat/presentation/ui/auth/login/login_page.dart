import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      body: Container(),
    );
  }
}
