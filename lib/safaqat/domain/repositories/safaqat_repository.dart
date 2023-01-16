import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/data/models/customer/customer_response.dart';
import 'package:safaqat/safaqat/data/models/events/event_dto.dart';
import 'package:safaqat/safaqat/data/models/events/events_response.dart';
import 'package:safaqat/safaqat/data/models/events/event_body.dart';
import 'package:safaqat/safaqat/data/models/news/edit/edit_news_body.dart';
import 'package:safaqat/safaqat/data/models/news/news_dto.dart';
import 'package:safaqat/safaqat/data/models/news/news_response.dart';
import 'package:safaqat/safaqat/data/models/news/publish/publish_news_body.dart';
import 'package:safaqat/safaqat/data/models/notifications/notification_response.dart';
import 'package:safaqat/safaqat/data/models/posts/post_body.dart';
import 'package:safaqat/safaqat/data/models/posts/post_category_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/post_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/posts_response.dart';
import 'package:safaqat/safaqat/data/models/projects/project_body.dart';
import 'package:safaqat/safaqat/data/models/projects/project_dto.dart';
import 'package:safaqat/safaqat/data/models/projects/projects_response.dart';
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

  Future<Resources> readNotification({String? id});

  Future<Resources<EventsResponse>> getEvents(
      {required int pageSize, required int pageNumber});

  Future<Resources<EventsResponse>> getMyEvents({
    required int pageSize,
    required int pageNumber,
    required int type,
  });

  Future<Resources<EventDto>> addEvent({required EventBody body});

  Future<Resources<EventDto>> editEvent({
    String? eventId,
    required EventBody body,
  });

  Future<Resources> deleteEvent({String? eventId});

  Future<Resources<PostsResponse>> getPosts(
      {required int pageSize, required int pageNumber});

  Future<Resources<PostsResponse>> getMyPosts({
    required int pageSize,
    required int pageNumber,
    required int type,
  });

  Future<Resources<PostDto>> addPost({required PostBody body});

  Future<Resources<PostDto>> editPost({
    String? postId,
    required PostBody body,
  });

  Future<Resources> deletePost({String? postId});

  Future<Resources<ProjectsResponse>> getProjects(
      {required int pageSize, required int pageNumber});

  Future<Resources<ProjectsResponse>> getMyProjects({
    required int pageSize,
    required int pageNumber,
    required int convener,
  });

  Future<Resources<ProjectDto>> addProject({required ProjectBody body});

  Future<Resources<ProjectDto>> editProject({
    String? projectId,
    required ProjectBody body,
  });

  Future<Resources> deleteProject({String? projectId});

  Future<Resources<List<PostCategoryDto>>> getPostCategories();
}
