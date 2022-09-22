import 'package:safaqat/safaqat/app/config/preferences_keys.dart';
import 'package:safaqat/safaqat/app/core/usecases/no_param_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteUserInfoUseCase extends NoParamUseCase<bool> {
  @override
  Future<bool> call() async {
    final SharedPreferences _preferences =
    await SharedPreferences.getInstance();

    await _preferences.remove(PrefsKeys.token);
    return Future.value(true);
  }
}
