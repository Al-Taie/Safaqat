import 'package:safaqat/safaqat/data/models/auth/change_password/change_password_body.dart';
import 'package:safaqat/safaqat/data/models/auth/login/login_body.dart';
import 'package:safaqat/safaqat/data/models/auth/login/login_dto.dart';
import 'package:safaqat/safaqat/data/models/auth/register/register_body.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';

abstract class AuthenticationRepository {
  Future<Resources<LoginDto>> login(LoginBody body);

  Future<Resources> changePassword(ChangePasswordBody body);

  Future<Resources> register(RegisterBody body);
}
