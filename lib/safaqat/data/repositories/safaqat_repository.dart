import 'dart:io';

import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/extensions/network_resource_wrapper.dart';
import 'package:safaqat/safaqat/data/data_source/network/safaqat_api_services.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/data/models/customer/customer_response.dart';
import 'package:safaqat/safaqat/data/models/events/event_body.dart';
import 'package:safaqat/safaqat/data/models/events/event_dto.dart';
import 'package:safaqat/safaqat/data/models/events/events_response.dart';
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
  Future<Resources<List<CityDto>>> getCities(int countryCode) =>
      _apiServices.getCities(countryCode).call();

  @override
  Future<Resources<NewsResponse>> getNews(
      {required int pageSize, required int pageNumber}) {
    return _apiServices.getNews(pageSize, pageNumber).call();
  }

  @override
  Future<Resources<NewsResponse>> getMyNews({
    required int pageSize,
    required int pageNumber,
    required int type,
  }) =>
      _apiServices.getMyNews(pageSize, pageNumber, type).call();

  @override
  Future<Resources<NewsDto>> addNews(
          {required PublishNewsBody body, required List<File> images}) =>
      _apiServices
          .publishNews(
              titleAr: body.titleAr,
              titleEn: body.titleEn,
              detailsAr: body.detailsAr,
              detailsEn: body.detailsEn,
              showName: body.showName,
              tagsAr: body.tagsAr,
              tagsEn: body.tagsEn,
              images: images)
          .call();

  @override
  Future<Resources<NewsDto>> editNews({
    String? newsId,
    required EditNewsBody body,
  }) =>
      _apiServices.editNews(newsId, body).call();

  @override
  Future<Resources> deleteNews({
    String? newsId,
  }) =>
      _apiServices.deleteNews(newsId).call();

  @override
  Future<Resources<NotificationsResponse>> getNotification({
    required String customerId,
    required int pageSize,
    required int pageNumber,
  }) {
    return _apiServices
        .getNotification(customerId, pageSize, pageNumber)
        .call();
  }

  @override
  Future<Resources> readNotification({
    String? id,
  }) =>
      _apiServices.readNotification(id).call();

  @override
  Future<Resources<EventsResponse>> getEvents(
      {required int pageSize, required int pageNumber}) {
    return _apiServices.getEvents(pageSize, pageNumber).call();
  }

  @override
  Future<Resources<EventsResponse>> getMyEvents({
    required int pageSize,
    required int pageNumber,
    required int type,
  }) =>
      _apiServices.getMyEvents(pageSize, pageNumber, type).call();

  @override
  Future<Resources<EventDto>> addEvent({required EventBody body}) =>
      _apiServices
          .publishEvent(
            titleAr: body.titleAr,
            titleEn: body.titleEn,
            detailsAr: body.detailsAr,
            detailsEn: body.detailsEn,
            showName: body.showName,
            tagsAr: body.tagsAr,
            tagsEn: body.tagsEn,
            webSite: body.webSite,
            email: body.email,
            latitude: body.coordinates?.latitude,
            longitude: body.coordinates?.longitude,
            startDate: body.startDate,
            endDate: body.endDate,
            telephone: body.telephone,
            type: body.type,
            attendanceType: body.attendanceType,
            cityCode: body.cityCode,
            countryNo: body.countryNo,
            // images: body.images,
            // stakeholders: body.stakeholders
          )
          .call();

  @override
  Future<Resources<EventDto>> editEvent({
    String? eventId,
    required EventBody body,
  }) =>
      _apiServices
          .editEvent(
            eventId: eventId,
            titleAr: body.titleAr,
            titleEn: body.titleEn,
            detailsAr: body.detailsAr,
            detailsEn: body.detailsEn,
            showName: body.showName,
            tagsAr: body.tagsAr,
            tagsEn: body.tagsEn,
            webSite: body.webSite,
            email: body.email,
            latitude: body.coordinates?.latitude,
            longitude: body.coordinates?.longitude,
            startDate: body.startDate,
            endDate: body.endDate,
            telephone: body.telephone,
            type: body.type,
            attendanceType: body.attendanceType,
            cityCode: body.cityCode,
            countryNo: body.countryNo,
          )
          .call();

  @override
  Future<Resources> deleteEvent({String? eventId}) =>
      _apiServices.deleteEvent(eventId).call();

  @override
  Future<Resources<PostDto>> addPost({required PostBody body}) => _apiServices
      .publishPost(
        titleAr: body.titleAr,
        titleEn: body.titleEn,
        descriptionAr: body.descriptionAr,
        descriptionNameEn: body.descriptionEn,
        instituteNameAr: body.instituteNameAr,
        instituteNameEn: body.instituteNameEn,
        latitude: body.coordinates?.latitude,
        longitude: body.coordinates?.longitude,
        costCode: body.costCode,
        categoryCode: body.categoryCode,
        expiryDate: body.expiryDate,
        showEmail: body.showEmail,
        showPhone: body.showPhone,
        type: body.type,
        cityCode: body.city?.cityNo,
        images: body.images,
      )
      .call();

  @override
  Future<Resources<ProjectDto>> addProject({required ProjectBody body}) =>
      _apiServices
          .publishProject(
            nameAr: body.nameAr,
            nameEn: body.nameEn,
            descriptionAr: body.descriptionAr,
            descriptionNameEn: body.descriptionEn,
            instituteNameAr: body.instituteNameAr,
            instituteNameEn: body.instituteNameEn,
            latitude: body.coordinates?.latitude,
            longitude: body.coordinates?.longitude,
            cost: body.cost,
            category: body.category?.code,
            startDate: body.startDate,
            endDate: body.endDate,
            actualEndDate: body.actualEndDate,
            convener: body.convener,
            sector: body.sector,
            showEmail: body.showEmail,
            showPhone: body.showPhone,
            cityCode: body.city?.cityNo,
            images: body.images,
          )
          .call();

  @override
  Future<Resources> deletePost({String? postId}) =>
      _apiServices.deletePost(postId).call();

  @override
  Future<Resources> deleteProject({String? projectId}) =>
      _apiServices.deleteProject(projectId).call();

  @override
  Future<Resources<PostDto>> editPost({
    String? postId,
    required PostBody body,
  }) =>
      _apiServices
          .editPost(
            postId: postId,
            titleAr: body.titleAr,
            titleEn: body.titleEn,
            descriptionAr: body.descriptionAr,
            descriptionNameEn: body.descriptionEn,
            instituteNameAr: body.instituteNameAr,
            instituteNameEn: body.instituteNameEn,
            latitude: body.coordinates?.latitude,
            longitude: body.coordinates?.longitude,
            costCode: body.costCode,
            categoryCode: body.categoryCode,
            expiryDate: body.expiryDate,
            showEmail: body.showEmail,
            showPhone: body.showPhone,
            type: body.type,
            cityCode: body.city?.cityNo,
            // images: body.images,
          )
          .call();

  @override
  Future<Resources<ProjectDto>> editProject({
    String? projectId,
    required ProjectBody body,
  }) =>
      _apiServices
          .editProject(
            projectId: projectId,
            nameAr: body.nameAr,
            nameEn: body.nameEn,
            descriptionAr: body.descriptionAr,
            descriptionNameEn: body.descriptionEn,
            instituteNameAr: body.instituteNameAr,
            instituteNameEn: body.instituteNameEn,
            latitude: body.coordinates?.latitude,
            longitude: body.coordinates?.longitude,
            cost: body.cost,
            category: body.category?.code,
            startDate: body.startDate,
            endDate: body.endDate,
            actualEndDate: body.actualEndDate,
            convener: body.convener,
            sector: body.sector,
            showEmail: body.showEmail,
            showPhone: body.showPhone,
            cityCode: body.city?.cityNo,
            // images: body.images,
          )
          .call();

  @override
  Future<Resources<PostsResponse>> getMyPosts({
    required int pageSize,
    required int pageNumber,
    required int type,
  }) =>
      _apiServices.getMyPosts(pageSize, pageNumber, type).call();

  @override
  Future<Resources<ProjectsResponse>> getMyProjects({
    required int pageSize,
    required int pageNumber,
    required int convener,
  }) =>
      _apiServices.getMyProjects(pageSize, pageNumber, convener).call();

  @override
  Future<Resources<PostsResponse>> getPosts({
    required int pageSize,
    required int pageNumber,
  }) =>
      _apiServices.getPosts(pageSize, pageNumber).call();

  @override
  Future<Resources<ProjectsResponse>> getProjects({
    required int pageSize,
    required int pageNumber,
  }) =>
      _apiServices.getProjects(pageSize, pageNumber).call();

  @override
  Future<Resources<List<PostCategoryDto>>> getPostCategories() =>
      _apiServices.getPostCategories().call();
}
