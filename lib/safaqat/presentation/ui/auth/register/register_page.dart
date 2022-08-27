import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/register/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      body: Container(),
    );
  }
}
