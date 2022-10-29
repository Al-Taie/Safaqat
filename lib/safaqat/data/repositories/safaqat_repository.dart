import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/extensions/network_resource_wrapper.dart';
import 'package:safaqat/safaqat/data/data_source/network/safaqat_api_services.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/data/models/customer/customer_response.dart';
import 'package:safaqat/safaqat/data/models/news/news_dto.dart';
import 'package:safaqat/safaqat/data/models/news/news_response.dart';
import 'package:safaqat/safaqat/data/models/news/publish_news_body.dart';
import 'package:safaqat/safaqat/data/models/notifications/notification_dto.dart';
import 'package:safaqat/safaqat/data/models/notifications/notification_response.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';

import '../../domain/repositories/safaqat_repository.dart';

class SafaqatRepositoryImpl extends SafaqatRepository {
  final SafaqatApiServices _apiServices = Get.find();

  @override
  Future<Resources<List<CountryDto>>> getCountries() =>
      _apiServices.getCountries().call();

  @override
  Future<Resources<CustomerResponse>> getCustomers() =>
      _apiServices.getCustomers().call();

  @override
  Future<Resources<List<NewsDto>>> searchNews({required String query}) =>
      _apiServices.searchNews(query).call();

  @override
  Future<Resources<List<CityDto>>> getCities(int countryCode)  =>
      _apiServices.getCities(countryCode).call();

  @override
  Future<Resources<NewsResponse>> getNews({
    required int pageSize,
    required int pageNumber
  }) {
    return _apiServices.getNews(pageSize, pageNumber).call();
  }

  @override
  Future<Resources> addNews({
    required PublishNewsBody body,
  }) => _apiServices.publishNews(body).call();

  @override
  Future<Resources<NotificationsResponse>> getNotification({
    required String customerId,
    required int pageSize,
    required int pageNumber
  }) {
    return _apiServices.getNotification(customerId, pageSize, pageNumber).call();
  }

}
