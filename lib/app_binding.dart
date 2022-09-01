import 'package:get/get.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/confirm/confirm_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/forgot/forget_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/login_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/register/register_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/home/home_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/splash/splash_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => ForgetController());
    Get.lazyPut(() => ConfirmController());
  }
}
