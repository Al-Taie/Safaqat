import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/extensions/network_resource_wrapper.dart';
import 'package:safaqat/safaqat/data/data_source/network/safaqat_api_services.dart';
import 'package:safaqat/safaqat/data/models/auth/change_password/change_password_body.dart';
import 'package:safaqat/safaqat/data/models/auth/login/login_body.dart';
import 'package:safaqat/safaqat/data/models/auth/login/login_dto.dart';
import 'package:safaqat/safaqat/data/models/auth/register/register_body.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final SafaqatApiServices _apiServices = Get.find();

  @override
  Future<Resources> changePassword(ChangePasswordBody body) =>
      _apiServices.changePassword(body).call();

  @override
  Future<Resources<LoginDto>> login(LoginBody body) =>
      _apiServices.login(body).call();

  @override
  Future<Resources> register(RegisterBody body) =>
      _apiServices.register(body).call();

}
