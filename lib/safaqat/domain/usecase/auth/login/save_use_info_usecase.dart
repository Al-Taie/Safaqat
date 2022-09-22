
import 'package:safaqat/safaqat/app/config/preferences_keys.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/auth/login/login_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SaveUserInfoUseCase extends ParamUseCase<bool, LoginDto> {
  @override
  Future<bool> call({required LoginDto params}) async {
    final SharedPreferences _preferences =
    await SharedPreferences.getInstance();

    _preferences.setString(PrefsKeys.token, params.token!);
    return Future.value(true);
  }
}
