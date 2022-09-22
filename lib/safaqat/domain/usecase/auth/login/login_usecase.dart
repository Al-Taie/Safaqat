import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/auth/login/login_body.dart';
import 'package:safaqat/safaqat/data/models/auth/login/login_dto.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/authentication_repository.dart';

class LoginUseCase extends ParamUseCase<Resources<LoginDto>, LoginBody> {
  final AuthenticationRepository _authenticationRepository = Get.find();

  @override
  Future<Resources<LoginDto>> call({required LoginBody params}) {
    return _authenticationRepository.login(params);
  }
}
