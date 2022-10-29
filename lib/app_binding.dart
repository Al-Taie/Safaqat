import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/preferences_keys.dart';
import 'package:safaqat/safaqat/domain/usecase/auth/register/get_cities_usecase.dart';
import 'package:safaqat/safaqat/domain/usecase/auth/register/get_countires_usecase.dart';
import 'package:safaqat/safaqat/domain/usecase/auth/register/register_usecase.dart';
import 'package:safaqat/safaqat/domain/usecase/notification/get_notification_usecase.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/login_page.dart';
import 'package:safaqat/safaqat/presentation/ui/home/home_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/notification/notification_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:safaqat/safaqat/data/data_source/network/safaqat_api_services.dart';
import 'package:safaqat/safaqat/data/repositories/authentication_repository.dart';
import 'package:safaqat/safaqat/data/repositories/safaqat_repository.dart';
import 'package:safaqat/safaqat/domain/repositories/authentication_repository.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';
import 'package:safaqat/safaqat/domain/usecase/auth/login/login_usecase.dart';
import 'package:safaqat/safaqat/domain/usecase/auth/login/save_use_info_usecase.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/confirm/confirm_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/forgot/forget_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/login_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/register/register_controller.dart';


class AppBindings implements Bindings {
  final SharedPreferences preferences;

  AppBindings(this.preferences);

  @override
  void dependencies() {
    Get.put(_provideDioClient(_provideAuthenticationInterceptor()));
    Get.put(_provideSafaqatApiServices(Get.find<Dio>()));
    Get.put(_provideAuthenticationRepository());
    Get.put(_provideSafaqatRepository());
    Get.putAsync(() => SharedPreferences.getInstance());

    Get.put(LoginUseCase());
    Get.put(GetCountriesUseCase());
    Get.put(GetCitiesUseCase());
    Get.put(RegisterUseCase());
    Get.put(SaveUserInfoUseCase());

    Get.put(LoginController());
    Get.put(RegisterController());
    Get.put(ForgetController());
    Get.put(ConfirmController());
    Get.put(HomeController());
  }

  SafaqatApiServices _provideSafaqatApiServices(Dio dio) {
    return SafaqatApiServices(dio);
  }

  AuthenticationRepository _provideAuthenticationRepository() {
    return AuthenticationRepositoryImpl();
  }

  SafaqatRepository _provideSafaqatRepository() {
    return SafaqatRepositoryImpl();
  }

  Dio _provideDioClient(InterceptorsWrapper authInterceptor) {
    final dio = Dio();
    dio.interceptors.add(DioLoggingInterceptor(
      level: Level.body,
      compact: false,
    ));
    dio.interceptors.add(authInterceptor);
    return dio;
  }

  InterceptorsWrapper _provideAuthenticationInterceptor() {
    return InterceptorsWrapper(onRequest: (options, handler) {
      final token = 'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoi2KfYrdmF2K8iLCJDSUQiOiJJUTIwMDAxMDAwMDAwMiIsImV4cCI6MTY2NzE0MzAzNH0.J7EX6pyVjE0L6bLExB8hAwPDY6tSiDXN8464CGYrpu73SiENw_ZNrnt9QApl_Ma0q0Vp5YRwLFhtUOku5WJMxw';


      options.headers['authorization'] = 'bearer $token';
      options.headers['Content-Type'] = 'application/json';

      return handler.next(options);
    }, onResponse: (response, handler) {
      if (response.statusCode == 401) {
        Get.offAll(const LoginPage());
      }
      return handler.next(response); // continue
    });
  }
}
