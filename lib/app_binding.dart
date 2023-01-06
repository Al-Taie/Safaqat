import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/preferences_keys.dart';
import 'package:safaqat/safaqat/data/data_source/network/safaqat_api_services.dart';
import 'package:safaqat/safaqat/data/repositories/authentication_repository.dart';
import 'package:safaqat/safaqat/data/repositories/safaqat_repository.dart';
import 'package:safaqat/safaqat/domain/repositories/authentication_repository.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';
import 'package:safaqat/safaqat/presentation/ui/app_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/confirm/confirm_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/forgot/forget_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/login_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/login_page.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/register/register_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/location_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/news/public/news_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/posts/public/posts_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBindings implements Bindings {
  final SharedPreferences preferences;

  AppBindings(this.preferences);

  @override
  void dependencies() {
    Get.putAsync(() => SharedPreferences.getInstance());
    Get.put(_provideDioClient(_provideAuthenticationInterceptor()));
    Get.put(_provideSafaqatApiServices(Get.find<Dio>()));
    Get.put(_provideAuthenticationRepository());
    Get.put(_provideSafaqatRepository());

    Get.put(AppController());
    Get.put(LoginController());
    Get.put(RegisterController());
    Get.put(ForgetController());
    Get.put(ConfirmController());
    Get.put(LocationController());
    Get.put(NewsController());
    Get.put(PostsController());
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
    dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        request: true,
        requestHeader: true,
        responseHeader: true));
    return dio;
  }

  InterceptorsWrapper _provideAuthenticationInterceptor() {
    return InterceptorsWrapper(onRequest: (options, handler) {
      if (options.headers.containsKey('No-Authentication')) {
        options.headers.remove('authorization');
      } else {
        final token = preferences.getString(PrefsKeys.token);
        options.headers['authorization'] = 'bearer $token';
      }

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
