import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/data/models/customer/customer_response.dart';
import 'package:safaqat/safaqat/data/models/events/edit_event_body.dart';
import 'package:safaqat/safaqat/data/models/events/event_dto.dart';
import 'package:safaqat/safaqat/data/models/events/events_response.dart';
import 'package:safaqat/safaqat/data/models/events/publish_event_body.dart';
import 'package:safaqat/safaqat/data/models/news/edit/edit_news_body.dart';
import 'package:safaqat/safaqat/data/models/news/news_dto.dart';
import 'package:safaqat/safaqat/data/models/news/news_response.dart';
import 'package:safaqat/safaqat/data/models/news/publish/publish_news_body.dart';
import 'package:safaqat/safaqat/data/models/notifications/notification_response.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'dart:io';

abstract class SafaqatRepository {
  Future<Resources<CustomerResponse>> getCustomers();

  Future<Resources<List<CityDto>>> getCities(int countryCode);

  Future<Resources<List<CountryDto>>> getCountries();

  Future<Resources<List<NewsDto>>> searchNews({required String query});

  Future<Resources<NewsResponse>> getNews(
      {required int pageSize, required int pageNumber});

  Future<Resources<NewsResponse>> getMyNews({
    required int pageSize,
    required int pageNumber,
    required int type,
  });

  Future<Resources<NewsDto>> addNews({
    required PublishNewsBody body,
    required List<File> images,
  });

  Future<Resources<NewsDto>> editNews({
    String? newsId,
    required EditNewsBody body,
  });

  Future<Resources> deleteNews({String? newsId});

  Future<Resources<NotificationsResponse>> getNotification(
      {required String customerId,
      required int pageSize,
      required int pageNumber});

  Future<Resources<EventsResponse>> getEvents(
      {required int pageSize, required int pageNumber});

  Future<Resources<EventsResponse>> getMyEvents({
    required int pageSize,
    required int pageNumber,
    required int type,
  });

  Future<Resources<EventDto>> addEvent({
    required PublishEventBody body,
    required List<File> images,
  });

  Future<Resources<EventDto>> editEvent({
    String? eventId,
    required EditEventBody body,
  });

  Future<Resources> deleteEvent({String? eventId});
}
