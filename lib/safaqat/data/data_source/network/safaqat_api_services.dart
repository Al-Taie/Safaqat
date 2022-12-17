import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:safaqat/safaqat/app/config/base_end_points.dart';
import 'package:safaqat/safaqat/app/utils/logger.dart';
import 'package:safaqat/safaqat/data/models/auth/change_password/change_password_body.dart';
import 'package:safaqat/safaqat/data/models/auth/login/login_body.dart';
import 'package:safaqat/safaqat/data/models/auth/login/login_dto.dart';
import 'package:safaqat/safaqat/data/models/auth/register/register_body.dart';
import 'package:safaqat/safaqat/data/models/base_response.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/data/models/customer/customer_response.dart';
import 'package:safaqat/safaqat/data/models/events/event_body.dart';
import 'package:safaqat/safaqat/data/models/events/event_coordinates.dart';
import 'package:safaqat/safaqat/data/models/events/event_dto.dart';
import 'package:safaqat/safaqat/data/models/events/events_response.dart';
import 'package:safaqat/safaqat/data/models/events/stakeholder_dto.dart';
import 'package:safaqat/safaqat/data/models/news/edit/edit_news_body.dart';
import 'package:safaqat/safaqat/data/models/news/news_dto.dart';
import 'package:safaqat/safaqat/data/models/news/news_response.dart';
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
      @Query('pageSize') int pageSize, @Query('pageNumber') int pageNumber,
      {@Header('No-Authentication') bool noAuth = true});

  @GET('News/List')
  Future<HttpResponse<BaseResponse<NewsResponse>>> getMyNews(
    @Query('pageSize') int pageSize,
    @Query('pageNumber') int pageNumber,
    @Query('type') int type,
  );

  @POST('News/Publish')
  @MultiPart()
  Future<HttpResponse<BaseResponse<NewsDto>>> publishNews({
    @Part(name: 'Username') String? username,
    @Part(name: 'NewsTitleA') String? titleAr,
    @Part(name: 'NewsTitleE') String? titleEn,
    @Part(name: 'NewsDetailsA') String? detailsAr,
    @Part(name: 'NewsDetailsE') String? detailsEn,
    @Part(name: 'ShowName') bool? showName,
    @Part(name: 'TagsA') List<String>? tagsAr,
    @Part(name: 'TagsE') List<String>? tagsEn,
    @Part(name: 'Images') List<File>? images,
  });

  @PUT('News/Edit')
  Future<HttpResponse<BaseResponse<NewsDto>>> editNews(
    @Query('news_id') String? newsId,
    @Body() EditNewsBody body,
  );

  @POST('News/EditImage')
  @MultiPart()
  Future<HttpResponse<BaseResponse<dynamic>>> editNewsImage({
    @Part(name: 'Images') List<File>? images,
  });

  @DELETE('News/Delete')
  Future<HttpResponse<BaseResponse<dynamic>>> deleteNews(
    @Query('news_id') String? newsId,
  );

  @GET('Notification/GetNotification')
  Future<HttpResponse<BaseResponse<NotificationsResponse>>> getNotification(
    @Query('customerId') String customerId,
    @Query('pageSize') int pageSize,
    @Query('pageNumber') int pageNumber,
  );

  @GET('Events/List')
  Future<HttpResponse<BaseResponse<EventsResponse>>> getEvents(
      @Query('pageSize') int pageSize, @Query('pageNumber') int pageNumber,
      {@Header('No-Authentication') bool noAuth = true});

  @GET('Events/List')
  Future<HttpResponse<BaseResponse<EventsResponse>>> getMyEvents(
    @Query('pageSize') int pageSize,
    @Query('pageNumber') int pageNumber,
    @Query('type') int type,
  );

  @POST('Events/Create')
  @MultiPart()
  Future<HttpResponse<BaseResponse<EventDto>>> publishEvent({
    @Part(name: 'EventTitleA') String? titleAr,
    @Part(name: 'EventTitleE') String? titleEn,
    @Part(name: 'EventDetailsA') String? detailsAr,
    @Part(name: 'EventDetailsE') String? detailsEn,
    @Part(name: 'ShowName') bool? showName,
    @Part(name: 'TagsA') List<String>? tagsAr,
    @Part(name: 'TagsE') List<String>? tagsEn,
    @Part(name: 'EventType') int? type,
    @Part(name: 'EAttendanceType') int? attendanceType,
    @Part(name: 'CountryNo') int? countryNo,
    @Part(name: 'CityCode') int? cityCode,
    @Part(name: 'Coordinates.latitude') double? latitude,
    @Part(name: 'Coordinates.longitude') double? longitude,
    @Part(name: 'StartDate') String? startDate,
    @Part(name: 'EndDate') String? endDate,
    @Part(name: 'Telephone') String? telephone,
    @Part(name: 'Email') String? email,
    @Part(name: 'WebSite') String? webSite,
    @Part(name: 'Stakeholder') List<Stakeholder>? stakeholders,
  });

  // @POST('Events/Create')
  // Future<HttpResponse<BaseResponse<EventDto>>> publishEvent({
  //   @Body() required EventBody body
  // });

  @PUT('Events/Edit')
  Future<HttpResponse<BaseResponse<EventDto>>> editEvent(
    @Query('eventId') String? eventId,
    @Body() EventBody body,
  );

  @DELETE('Events/Delete')
  Future<HttpResponse<BaseResponse<dynamic>>> deleteEvent(
    @Query('eventId') String? eventsId,
  );
}
