import 'package:safaqat/safaqat/app/config/preferences_keys.dart';
import 'package:safaqat/safaqat/app/core/usecases/no_param_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteUserInfoUseCase extends NoParamUseCase<bool> {
  @override
  Future<bool> call() async {
    final SharedPreferences preferences =
    await SharedPreferences.getInstance();

    await preferences.remove(PrefsKeys.token);
    return Future.value(true);
  }
}
