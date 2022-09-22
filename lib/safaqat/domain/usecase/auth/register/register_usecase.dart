import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/auth/register/register_body.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/authentication_repository.dart';

class RegisterUseCase extends ParamUseCase<Resources, RegisterBody> {
  final AuthenticationRepository _authenticationRepository = Get.find();

  @override
  Future<Resources> call({required RegisterBody params}) =>
     _authenticationRepository.register(params);
}
