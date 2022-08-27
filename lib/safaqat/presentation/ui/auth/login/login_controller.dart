import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController() {}

  final _email = ''.obs;
  String get email => _email.value;
  set email(String value) => _email.value = value;

  final _password = ''.obs;
  String get password => _password.value;
  set password(String value) => _password.value = value;

}
