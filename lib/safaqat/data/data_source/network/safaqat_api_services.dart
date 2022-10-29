import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:safaqat/safaqat/app/config/base_end_points.dart';
import 'package:safaqat/safaqat/data/models/auth/change_password/change_password_body.dart';
import 'package:safaqat/safaqat/data/models/auth/login/login_body.dart';
import 'package:safaqat/safaqat/data/models/auth/login/login_dto.dart';
import 'package:safaqat/safaqat/data/models/auth/register/register_body.dart';
import 'package:safaqat/safaqat/data/models/base_response.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/data/models/customer/customer_response.dart';
import 'package:safaqat/safaqat/data/models/news/news_dto.dart';
import 'package:safaqat/safaqat/data/models/news/news_response.dart';
import 'package:safaqat/safaqat/data/models/news/publish_news_body.dart';
import 'package:safaqat/safaqat/data/models/notifications/notification_dto.dart';
import 'package:safaqat/safaqat/data/models/notifications/notification_response.dart';

part 'safaqat_api_services.g.dart';

@RestApi(baseUrl: URLs.baseApiUrl)
abstract class SafaqatApiServices {
  factory SafaqatApiServices(Dio dio, {String baseUrl}) = _SafaqatApiServices;

  @POST('Customer/Login')
  Future<HttpResponse<BaseResponse<LoginDto>>> login(@Body() LoginBody body);

  @PUT('ChangePassword')
  Future<HttpResponse<BaseResponse<dynamic>>> changePassword(
    @Body() ChangePasswordBody body,
  );

  @POST('Customer/Register')
  Future<HttpResponse<BaseResponse<dynamic>>> register(
      @Body() RegisterBody body);

  @GET('Customer')
  Future<HttpResponse<BaseResponse<CustomerResponse>>> getCustomers();

  @GET('City/CityOnCode')
  Future<HttpResponse<BaseResponse<List<CityDto>>>> getCities(
      @Query('CountryCode') int countryCode);

  @GET('Country/List')
  Future<HttpResponse<BaseResponse<List<CountryDto>>>> getCountries();

  @GET('News/Search')
  Future<HttpResponse<BaseResponse<List<NewsDto>>>> searchNews(
      @Query('SearchString') String query);

  @GET('News/List')
  Future<HttpResponse<BaseResponse<NewsResponse>>> getNews(
      @Query('pageSize') int pageSize, @Query('pageNumber') int pageNumber);

  @POST('News/Publish')
  Future<HttpResponse<BaseResponse<dynamic>>> publishNews(
      @Body() PublishNewsBody body);

  @GET('Notification/GetNotification')
  Future<HttpResponse<BaseResponse<NotificationsResponse>>> getNotification(
      @Query('customerId') String customerId,
      @Query('pageSize') int pageSize,
      @Query('pageNumber') int pageNumber);
}
