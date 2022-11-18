import 'package:get/get.dart';
import 'package:safaqat/safaqat/data/models/auth/login/login_body.dart';
import 'package:safaqat/safaqat/data/models/auth/login/login_dto.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecase/auth/login/login_usecase.dart';
import 'package:safaqat/safaqat/domain/usecase/auth/login/save_use_info_usecase.dart';

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase = Get.find();
  final SaveUserInfoUseCase _saveUserInfoUseCase = Get.find();

  final _username = ''.obs;
  String get username => _username.value;
  set username(String value) => _username.value = value;

  final _password = ''.obs;
  String get password => _password.value;
  set password(String value) => _password.value = value;

  Rx<Resources<LoginDto>> auth =
      Resources<LoginDto>.init().obs;

  void login() async {
    final body = LoginBody(
      username: username,
      password: password
    );

    auth.value = Resources.loading();

    final result = await _loginUseCase(params: body);
    result.data?.username = username;
    _saveUserInfo(result.data);
    auth.value = result;
  }

  void _saveUserInfo(LoginDto? info) {
    if (info != null) {
      _saveUserInfoUseCase(params: info);
    }
  }
}
