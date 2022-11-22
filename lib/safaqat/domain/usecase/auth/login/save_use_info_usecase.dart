
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/preferences_keys.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/auth/login/login_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SaveUserInfoUseCase extends ParamUseCase<bool, LoginDto> {
  final SharedPreferences _preferences = Get.find();

  @override
  Future<bool> call({required LoginDto params}) async {
    _preferences.setString(PrefsKeys.token, params.token!);
    _preferences.setString(PrefsKeys.id, params.id!);
    return Future.value(true);
  }
}
