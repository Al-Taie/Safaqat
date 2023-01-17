// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'safaqat_api_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _SafaqatApiServices implements SafaqatApiServices {
  _SafaqatApiServices(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://safaqat.trevew.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<BaseResponse<LoginDto>>> login(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<LoginDto>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Customer/Login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<LoginDto>.fromJson(
      _result.data!,
      (json) => LoginDto.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<dynamic>>> changePassword(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<dynamic>>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'ChangePassword',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<dynamic>>> register(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<dynamic>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Customer/Register',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<CustomerResponse>>> getCustomers() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<CustomerResponse>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Customer',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<CustomerResponse>.fromJson(
      _result.data!,
      (json) => CustomerResponse.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<List<CityDto>>>> getCities(
      countryCode) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'CountryCode': countryCode};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<List<CityDto>>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'City/CityOnCode',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<CityDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<CityDto>((i) => CityDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<List<CountryDto>>>> getCountries() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<List<CountryDto>>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Country/List',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<CountryDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<CountryDto>(
              (i) => CountryDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<List<NewsDto>>>> searchNews(query) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'SearchString': query};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<List<NewsDto>>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'News/Search',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<NewsDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<NewsDto>((i) => NewsDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<NewsResponse>>> getNews(
    pageSize,
    pageNumber, {
    noAuth = true,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageSize': pageSize,
      r'pageNumber': pageNumber,
    };
    final _headers = <String, dynamic>{r'No-Authentication': noAuth};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<NewsResponse>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'News/List',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<NewsResponse>.fromJson(
      _result.data!,
      (json) => NewsResponse.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<NewsResponse>>> getMyNews(
    pageSize,
    pageNumber,
    type,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageSize': pageSize,
      r'pageNumber': pageNumber,
      r'type': type,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<NewsResponse>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'News/List',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<NewsResponse>.fromJson(
      _result.data!,
      (json) => NewsResponse.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<NewsDto>>> publishNews({
    username,
    titleAr,
    titleEn,
    detailsAr,
    detailsEn,
    showName,
    tagsAr,
    tagsEn,
    images,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (username != null) {
      _data.fields.add(MapEntry(
        'Username',
        username,
      ));
    }
    if (titleAr != null) {
      _data.fields.add(MapEntry(
        'NewsTitleA',
        titleAr,
      ));
    }
    if (titleEn != null) {
      _data.fields.add(MapEntry(
        'NewsTitleE',
        titleEn,
      ));
    }
    if (detailsAr != null) {
      _data.fields.add(MapEntry(
        'NewsDetailsA',
        detailsAr,
      ));
    }
    if (detailsEn != null) {
      _data.fields.add(MapEntry(
        'NewsDetailsE',
        detailsEn,
      ));
    }
    if (showName != null) {
      _data.fields.add(MapEntry(
        'ShowName',
        showName.toString(),
      ));
    }
    tagsAr?.forEach((i) {
      _data.fields.add(MapEntry('TagsA', i));
    });
    tagsEn?.forEach((i) {
      _data.fields.add(MapEntry('TagsE', i));
    });
    if (images != null) {
      _data.files.addAll(images.map((i) => MapEntry(
          'Images',
          MultipartFile.fromFileSync(
            i.path,
            filename: i.path.split(Platform.pathSeparator).last,
          ))));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<NewsDto>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'News/Publish',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<NewsDto>.fromJson(
      _result.data!,
      (json) => NewsDto.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<NewsDto>>> editNews(
    newsId,
    body,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'news_id': newsId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<NewsDto>>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'News/Edit',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<NewsDto>.fromJson(
      _result.data!,
      (json) => NewsDto.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<dynamic>>> editNewsImage({images}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (images != null) {
      _data.files.addAll(images.map((i) => MapEntry(
          'Images',
          MultipartFile.fromFileSync(
            i.path,
            filename: i.path.split(Platform.pathSeparator).last,
          ))));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<dynamic>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'News/EditImage',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<dynamic>>> deleteNews(newsId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'news_id': newsId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<dynamic>>>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'News/Delete',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<NotificationsResponse>>> getNotification(
    customerId,
    pageSize,
    pageNumber,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'customerId': customerId,
      r'pageSize': pageSize,
      r'pageNumber': pageNumber,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<NotificationsResponse>>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  'Notification/List',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<NotificationsResponse>.fromJson(
      _result.data!,
      (json) => NotificationsResponse.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<dynamic>>> readNotification(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'notification_id': id};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<dynamic>>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Notification/Shown',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<EventsResponse>>> getEvents(
    pageSize,
    pageNumber, {
    noAuth = true,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageSize': pageSize,
      r'pageNumber': pageNumber,
    };
    final _headers = <String, dynamic>{r'No-Authentication': noAuth};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<EventsResponse>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Events/List',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<EventsResponse>.fromJson(
      _result.data!,
      (json) => EventsResponse.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<EventsResponse>>> getMyEvents(
    pageSize,
    pageNumber,
    type,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageSize': pageSize,
      r'pageNumber': pageNumber,
      r'type': type,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<EventsResponse>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Events/List',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<EventsResponse>.fromJson(
      _result.data!,
      (json) => EventsResponse.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<EventDto>>> publishEvent({
    titleAr,
    titleEn,
    detailsAr,
    detailsEn,
    showName,
    tagsAr,
    tagsEn,
    type,
    attendanceType,
    countryNo,
    cityCode,
    latitude,
    longitude,
    startDate,
    endDate,
    telephone,
    email,
    webSite,
    images,
    stakeholders,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (titleAr != null) {
      _data.fields.add(MapEntry(
        'EventTitleA',
        titleAr,
      ));
    }
    if (titleEn != null) {
      _data.fields.add(MapEntry(
        'EventTitleE',
        titleEn,
      ));
    }
    if (detailsAr != null) {
      _data.fields.add(MapEntry(
        'EventDetailsA',
        detailsAr,
      ));
    }
    if (detailsEn != null) {
      _data.fields.add(MapEntry(
        'EventDetailsE',
        detailsEn,
      ));
    }
    if (showName != null) {
      _data.fields.add(MapEntry(
        'ShowName',
        showName.toString(),
      ));
    }
    tagsAr?.forEach((i) {
      _data.fields.add(MapEntry('TagsA', i));
    });
    tagsEn?.forEach((i) {
      _data.fields.add(MapEntry('TagsE', i));
    });
    if (type != null) {
      _data.fields.add(MapEntry(
        'EventType',
        type.toString(),
      ));
    }
    if (attendanceType != null) {
      _data.fields.add(MapEntry(
        'EAttendanceType',
        attendanceType.toString(),
      ));
    }
    if (countryNo != null) {
      _data.fields.add(MapEntry(
        'CountryNo',
        countryNo.toString(),
      ));
    }
    if (cityCode != null) {
      _data.fields.add(MapEntry(
        'CityCode',
        cityCode.toString(),
      ));
    }
    if (latitude != null) {
      _data.fields.add(MapEntry(
        'Coordinates.latitude',
        latitude.toString(),
      ));
    }
    if (longitude != null) {
      _data.fields.add(MapEntry(
        'Coordinates.longitude',
        longitude.toString(),
      ));
    }
    if (startDate != null) {
      _data.fields.add(MapEntry(
        'StartDate',
        startDate,
      ));
    }
    if (endDate != null) {
      _data.fields.add(MapEntry(
        'EndDate',
        endDate,
      ));
    }
    if (telephone != null) {
      _data.fields.add(MapEntry(
        'Telephone',
        telephone,
      ));
    }
    if (email != null) {
      _data.fields.add(MapEntry(
        'Email',
        email,
      ));
    }
    if (webSite != null) {
      _data.fields.add(MapEntry(
        'WebSite',
        webSite,
      ));
    }
    if (images != null) {
      _data.files.addAll(images.map((i) => MapEntry(
          'Images',
          MultipartFile.fromFileSync(
            i.path,
            filename: i.path.split(Platform.pathSeparator).last,
          ))));
    }

    stakeholders?.let((it) {
      it.toMultiPart().apply((value) {
        _data.fields.addAll(value.fields);
        _data.files.addAll(value.files);
        Logger.log(_data.files.length);
      });
    });

    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<EventDto>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'Events/Create',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<EventDto>.fromJson(
      _result.data!,
      (json) => EventDto.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<EventDto>>> editEvent({
    eventId,
    titleAr,
    titleEn,
    detailsAr,
    detailsEn,
    showName,
    tagsAr,
    tagsEn,
    type,
    attendanceType,
    countryNo,
    cityCode,
    latitude,
    longitude,
    startDate,
    endDate,
    telephone,
    email,
    webSite,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'eventId': eventId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (titleAr != null) {
      _data.fields.add(MapEntry(
        'EventTitleA',
        titleAr,
      ));
    }
    if (titleEn != null) {
      _data.fields.add(MapEntry(
        'EventTitleE',
        titleEn,
      ));
    }
    if (detailsAr != null) {
      _data.fields.add(MapEntry(
        'EventDetailsA',
        detailsAr,
      ));
    }
    if (detailsEn != null) {
      _data.fields.add(MapEntry(
        'EventDetailsE',
        detailsEn,
      ));
    }
    if (showName != null) {
      _data.fields.add(MapEntry(
        'ShowName',
        showName.toString(),
      ));
    }
    tagsAr?.forEach((i) {
      _data.fields.add(MapEntry('TagsA', i));
    });
    tagsEn?.forEach((i) {
      _data.fields.add(MapEntry('TagsE', i));
    });
    if (type != null) {
      _data.fields.add(MapEntry(
        'EventType',
        type.toString(),
      ));
    }
    if (attendanceType != null) {
      _data.fields.add(MapEntry(
        'EAttendanceType',
        attendanceType.toString(),
      ));
    }
    if (countryNo != null) {
      _data.fields.add(MapEntry(
        'CountryNo',
        countryNo.toString(),
      ));
    }
    if (cityCode != null) {
      _data.fields.add(MapEntry(
        'CityCode',
        cityCode.toString(),
      ));
    }
    if (latitude != null) {
      _data.fields.add(MapEntry(
        'Coordinates.latitude',
        latitude.toString(),
      ));
    }
    if (longitude != null) {
      _data.fields.add(MapEntry(
        'Coordinates.longitude',
        longitude.toString(),
      ));
    }
    if (startDate != null) {
      _data.fields.add(MapEntry(
        'StartDate',
        startDate,
      ));
    }
    if (endDate != null) {
      _data.fields.add(MapEntry(
        'EndDate',
        endDate,
      ));
    }
    if (telephone != null) {
      _data.fields.add(MapEntry(
        'Telephone',
        telephone,
      ));
    }
    if (email != null) {
      _data.fields.add(MapEntry(
        'Email',
        email,
      ));
    }
    if (webSite != null) {
      _data.fields.add(MapEntry(
        'WebSite',
        webSite,
      ));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<EventDto>>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'Events/Edit',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<EventDto>.fromJson(
      _result.data!,
      (json) => EventDto.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<dynamic>>> deleteEvent(eventsId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'eventId': eventsId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<dynamic>>>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Events/Delete',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<List<PostCategoryDto>>>>
      getPostCategories() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<List<PostCategoryDto>>>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  'Post/category',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<PostCategoryDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<PostCategoryDto>(
              (i) => PostCategoryDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<PostsResponse>>> getPosts(
    pageSize,
    pageNumber, {
    noAuth = true,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageSize': pageSize,
      r'pageNumber': pageNumber,
    };
    final _headers = <String, dynamic>{r'No-Authentication': noAuth};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<PostsResponse>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Post/List',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<PostsResponse>.fromJson(
      _result.data!,
      (json) => PostsResponse.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<PostsResponse>>> getMyPosts(
    pageSize,
    pageNumber,
    type,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageSize': pageSize,
      r'pageNumber': pageNumber,
      r'type': type,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<PostsResponse>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Post/List',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<PostsResponse>.fromJson(
      _result.data!,
      (json) => PostsResponse.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<PostDto>>> publishPost({
    titleAr,
    titleEn,
    descriptionAr,
    descriptionNameEn,
    instituteNameAr,
    instituteNameEn,
    type,
    categoryCode,
    cityCode,
    latitude,
    longitude,
    costCode,
    expiryDate,
    showPhone,
    showEmail,
    images,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (titleAr != null) {
      _data.fields.add(MapEntry(
        'PostTitleA',
        titleAr,
      ));
    }
    if (titleEn != null) {
      _data.fields.add(MapEntry(
        'PostTitleE',
        titleEn,
      ));
    }
    if (descriptionAr != null) {
      _data.fields.add(MapEntry(
        'DescriptionA',
        descriptionAr,
      ));
    }
    if (descriptionNameEn != null) {
      _data.fields.add(MapEntry(
        'DescriptionE',
        descriptionNameEn,
      ));
    }
    if (instituteNameAr != null) {
      _data.fields.add(MapEntry(
        'InstituteNameA',
        instituteNameAr,
      ));
    }
    if (instituteNameEn != null) {
      _data.fields.add(MapEntry(
        'InstituteNameE',
        instituteNameEn,
      ));
    }
    if (type != null) {
      _data.fields.add(MapEntry(
        'PostType',
        type.toString(),
      ));
    }
    if (categoryCode != null) {
      _data.fields.add(MapEntry(
        'CategoryCode',
        categoryCode.toString(),
      ));
    }
    if (cityCode != null) {
      _data.fields.add(MapEntry(
        'City',
        cityCode.toString(),
      ));
    }
    if (latitude != null) {
      _data.fields.add(MapEntry(
        'Coordinates.latitude',
        latitude.toString(),
      ));
    }
    if (longitude != null) {
      _data.fields.add(MapEntry(
        'Coordinates.longitude',
        longitude.toString(),
      ));
    }
    if (costCode != null) {
      _data.fields.add(MapEntry(
        'CostCode',
        costCode.toString(),
      ));
    }
    if (expiryDate != null) {
      _data.fields.add(MapEntry(
        'ExpiryDate',
        expiryDate,
      ));
    }
    if (showPhone != null) {
      _data.fields.add(MapEntry(
        'ShowTel',
        showPhone.toString(),
      ));
    }
    if (showEmail != null) {
      _data.fields.add(MapEntry(
        'ShowEmail',
        showEmail.toString(),
      ));
    }
    if (images != null) {
      _data.files.addAll(images.map((i) => MapEntry(
          'Images',
          MultipartFile.fromFileSync(
            i.path,
            filename: i.path.split(Platform.pathSeparator).last,
          ))));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<PostDto>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'Post/Create',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<PostDto>.fromJson(
      _result.data!,
      (json) => PostDto.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<PostDto>>> editPost({
    postId,
    titleAr,
    titleEn,
    descriptionAr,
    descriptionNameEn,
    instituteNameAr,
    instituteNameEn,
    type,
    categoryCode,
    cityCode,
    latitude,
    longitude,
    costCode,
    expiryDate,
    showPhone,
    showEmail,
    images,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'PostId': postId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (titleAr != null) {
      _data.fields.add(MapEntry(
        'PostTitleA',
        titleAr,
      ));
    }
    if (titleEn != null) {
      _data.fields.add(MapEntry(
        'PostTitleE',
        titleEn,
      ));
    }
    if (descriptionAr != null) {
      _data.fields.add(MapEntry(
        'DescriptionA',
        descriptionAr,
      ));
    }
    if (descriptionNameEn != null) {
      _data.fields.add(MapEntry(
        'DescriptionE',
        descriptionNameEn,
      ));
    }
    if (instituteNameAr != null) {
      _data.fields.add(MapEntry(
        'InstituteNameA',
        instituteNameAr,
      ));
    }
    if (instituteNameEn != null) {
      _data.fields.add(MapEntry(
        'InstituteNameE',
        instituteNameEn,
      ));
    }
    if (type != null) {
      _data.fields.add(MapEntry(
        'PostType',
        type.toString(),
      ));
    }
    if (categoryCode != null) {
      _data.fields.add(MapEntry(
        'CategoryCode',
        categoryCode.toString(),
      ));
    }
    if (cityCode != null) {
      _data.fields.add(MapEntry(
        'City',
        cityCode.toString(),
      ));
    }
    if (latitude != null) {
      _data.fields.add(MapEntry(
        'Coordinates.latitude',
        latitude.toString(),
      ));
    }
    if (longitude != null) {
      _data.fields.add(MapEntry(
        'Coordinates.longitude',
        longitude.toString(),
      ));
    }
    if (costCode != null) {
      _data.fields.add(MapEntry(
        'CostCode',
        costCode.toString(),
      ));
    }
    if (expiryDate != null) {
      _data.fields.add(MapEntry(
        'ExpiryDate',
        expiryDate,
      ));
    }
    if (showPhone != null) {
      _data.fields.add(MapEntry(
        'ShowTel',
        showPhone.toString(),
      ));
    }
    if (showEmail != null) {
      _data.fields.add(MapEntry(
        'ShowEmail',
        showEmail.toString(),
      ));
    }
    if (images != null) {
      _data.files.addAll(images.map((i) => MapEntry(
          'Images',
          MultipartFile.fromFileSync(
            i.path,
            filename: i.path.split(Platform.pathSeparator).last,
          ))));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<PostDto>>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'Post/Edit',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<PostDto>.fromJson(
      _result.data!,
      (json) => PostDto.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<dynamic>>> deletePost(postId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'postId': postId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<dynamic>>>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Post/Delete',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<ProjectsResponse>>> getProjects(
    pageSize,
    pageNumber, {
    noAuth = true,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageSize': pageSize,
      r'pageNumber': pageNumber,
    };
    final _headers = <String, dynamic>{r'No-Authentication': noAuth};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<ProjectsResponse>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Project/List',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<ProjectsResponse>.fromJson(
      _result.data!,
      (json) => ProjectsResponse.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<ProjectsResponse>>> getMyProjects(
    pageSize,
    pageNumber,
    convener,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageSize': pageSize,
      r'pageNumber': pageNumber,
      r'convener': convener,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<ProjectsResponse>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Project/List',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<ProjectsResponse>.fromJson(
      _result.data!,
      (json) => ProjectsResponse.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<ProjectDto>>> publishProject({
    nameAr,
    nameEn,
    descriptionAr,
    descriptionNameEn,
    instituteNameAr,
    instituteNameEn,
    convener,
    sector,
    category,
    cityCode,
    latitude,
    longitude,
    cost,
    startDate,
    endDate,
    actualEndDate,
    showPhone,
    showEmail,
    images,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (nameAr != null) {
      _data.fields.add(MapEntry(
        'ProjNameA',
        nameAr,
      ));
    }
    if (nameEn != null) {
      _data.fields.add(MapEntry(
        'ProjNameE',
        nameEn,
      ));
    }
    if (descriptionAr != null) {
      _data.fields.add(MapEntry(
        'DescA',
        descriptionAr,
      ));
    }
    if (descriptionNameEn != null) {
      _data.fields.add(MapEntry(
        'DescE',
        descriptionNameEn,
      ));
    }
    if (instituteNameAr != null) {
      _data.fields.add(MapEntry(
        'InstituteNameA',
        instituteNameAr,
      ));
    }
    if (instituteNameEn != null) {
      _data.fields.add(MapEntry(
        'InstituteNameE',
        instituteNameEn,
      ));
    }
    if (convener != null) {
      _data.fields.add(MapEntry(
        'ProjConvener',
        convener.toString(),
      ));
    }
    if (sector != null) {
      _data.fields.add(MapEntry(
        'ProjSector',
        sector.toString(),
      ));
    }
    if (category != null) {
      _data.fields.add(MapEntry(
        'Category',
        category.toString(),
      ));
    }
    if (cityCode != null) {
      _data.fields.add(MapEntry(
        'CityCode',
        cityCode.toString(),
      ));
    }
    if (latitude != null) {
      _data.fields.add(MapEntry(
        'Coordinates.latitude',
        latitude.toString(),
      ));
    }
    if (longitude != null) {
      _data.fields.add(MapEntry(
        'Coordinates.longitude',
        longitude.toString(),
      ));
    }
    if (cost != null) {
      _data.fields.add(MapEntry(
        'Cost',
        cost.toString(),
      ));
    }
    if (startDate != null) {
      _data.fields.add(MapEntry(
        'StartDate',
        startDate,
      ));
    }
    if (endDate != null) {
      _data.fields.add(MapEntry(
        'EndDate',
        endDate,
      ));
    }
    if (actualEndDate != null) {
      _data.fields.add(MapEntry(
        'ActualEndDate',
        actualEndDate,
      ));
    }
    if (showPhone != null) {
      _data.fields.add(MapEntry(
        'ShowTel',
        showPhone.toString(),
      ));
    }
    if (showEmail != null) {
      _data.fields.add(MapEntry(
        'ShowEmail',
        showEmail.toString(),
      ));
    }
    if (images != null) {
      _data.files.addAll(images.map((i) => MapEntry(
          'Images',
          MultipartFile.fromFileSync(
            i.path,
            filename: i.path.split(Platform.pathSeparator).last,
          ))));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<ProjectDto>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'Project/Create',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<ProjectDto>.fromJson(
      _result.data!,
      (json) => ProjectDto.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<ProjectDto>>> editProject({
    projectId,
    nameAr,
    nameEn,
    descriptionAr,
    descriptionNameEn,
    instituteNameAr,
    instituteNameEn,
    convener,
    sector,
    category,
    cityCode,
    latitude,
    longitude,
    cost,
    startDate,
    endDate,
    actualEndDate,
    showPhone,
    showEmail,
    images,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'projectId': projectId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (nameAr != null) {
      _data.fields.add(MapEntry(
        'ProjNameA',
        nameAr,
      ));
    }
    if (nameEn != null) {
      _data.fields.add(MapEntry(
        'ProjNameE',
        nameEn,
      ));
    }
    if (descriptionAr != null) {
      _data.fields.add(MapEntry(
        'DescA',
        descriptionAr,
      ));
    }
    if (descriptionNameEn != null) {
      _data.fields.add(MapEntry(
        'DescE',
        descriptionNameEn,
      ));
    }
    if (instituteNameAr != null) {
      _data.fields.add(MapEntry(
        'InstituteNameA',
        instituteNameAr,
      ));
    }
    if (instituteNameEn != null) {
      _data.fields.add(MapEntry(
        'InstituteNameE',
        instituteNameEn,
      ));
    }
    if (convener != null) {
      _data.fields.add(MapEntry(
        'ProjConvener',
        convener.toString(),
      ));
    }
    if (sector != null) {
      _data.fields.add(MapEntry(
        'ProjSector',
        sector.toString(),
      ));
    }
    if (category != null) {
      _data.fields.add(MapEntry(
        'Category',
        category.toString(),
      ));
    }
    if (cityCode != null) {
      _data.fields.add(MapEntry(
        'CityCode',
        cityCode.toString(),
      ));
    }
    if (latitude != null) {
      _data.fields.add(MapEntry(
        'Coordinates.latitude',
        latitude.toString(),
      ));
    }
    if (longitude != null) {
      _data.fields.add(MapEntry(
        'Coordinates.longitude',
        longitude.toString(),
      ));
    }
    if (cost != null) {
      _data.fields.add(MapEntry(
        'Cost',
        cost.toString(),
      ));
    }
    if (startDate != null) {
      _data.fields.add(MapEntry(
        'StartDate',
        startDate,
      ));
    }
    if (endDate != null) {
      _data.fields.add(MapEntry(
        'EndDate',
        endDate,
      ));
    }
    if (actualEndDate != null) {
      _data.fields.add(MapEntry(
        'ActualEndDate',
        actualEndDate,
      ));
    }
    if (showPhone != null) {
      _data.fields.add(MapEntry(
        'ShowTel',
        showPhone.toString(),
      ));
    }
    if (showEmail != null) {
      _data.fields.add(MapEntry(
        'ShowEmail',
        showEmail.toString(),
      ));
    }
    if (images != null) {
      _data.files.addAll(images.map((i) => MapEntry(
          'Images',
          MultipartFile.fromFileSync(
            i.path,
            filename: i.path.split(Platform.pathSeparator).last,
          ))));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<ProjectDto>>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'Project/Edit',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<ProjectDto>.fromJson(
      _result.data!,
      (json) => ProjectDto.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<List<CostCategoryDto>>>>
      getCostCategories() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<List<CostCategoryDto>>>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  'Project/Cost',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<CostCategoryDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<CostCategoryDto>(
              (i) => CostCategoryDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<dynamic>>> deleteProject(projectId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'projectId': projectId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<dynamic>>>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Project/Delete',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<List<ServiceDto>>>> getServices() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<List<ServiceDto>>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Contract/ServiceCodes',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<ServiceDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<ServiceDto>(
              (i) => ServiceDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<ContractResponse>>> getContracts(
    pageSize,
    pageNumber, {
    noAuth = true,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageSize': pageSize,
      r'pageNumber': pageNumber,
    };
    final _headers = <String, dynamic>{r'No-Authentication': noAuth};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<ContractResponse>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Contract/List',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<ContractResponse>.fromJson(
      _result.data!,
      (json) => ContractResponse.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<ContractResponse>>> getMyContracts(
    pageSize,
    pageNumber,
    projectId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageSize': pageSize,
      r'pageNumber': pageNumber,
      r'projId': projectId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<ContractResponse>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Contract/List',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<ContractResponse>.fromJson(
      _result.data!,
      (json) => ContractResponse.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<dynamic>>> deleteContract(contractId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ContractId': contractId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<dynamic>>>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Contract/Delete',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<dynamic>>> closeContract(contractId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ContractId': contractId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<dynamic>>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Contract/Close',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<ContractDto>>> publishContract({
    projectId,
    nameAr,
    nameEn,
    descriptionAr,
    descriptionNameEn,
    contractorNameAr,
    contractorNameEn,
    contractValue,
    currency,
    serviceCode,
    startDate,
    endDate,
    showPhone,
    showEmail,
    showInPostPage,
    images,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (projectId != null) {
      _data.fields.add(MapEntry(
        'ProjId',
        projectId,
      ));
    }
    if (nameAr != null) {
      _data.fields.add(MapEntry(
        'ContNameA',
        nameAr,
      ));
    }
    if (nameEn != null) {
      _data.fields.add(MapEntry(
        'ContNameE',
        nameEn,
      ));
    }
    if (descriptionAr != null) {
      _data.fields.add(MapEntry(
        'DescA',
        descriptionAr,
      ));
    }
    if (descriptionNameEn != null) {
      _data.fields.add(MapEntry(
        'DescE',
        descriptionNameEn,
      ));
    }
    if (contractorNameAr != null) {
      _data.fields.add(MapEntry(
        'ContractorA',
        contractorNameAr,
      ));
    }
    if (contractorNameEn != null) {
      _data.fields.add(MapEntry(
        'ContractorE',
        contractorNameEn,
      ));
    }
    if (contractValue != null) {
      _data.fields.add(MapEntry(
        'ContValue',
        contractValue.toString(),
      ));
    }
    if (currency != null) {
      _data.fields.add(MapEntry(
        'ValueCurrency',
        currency.toString(),
      ));
    }
    if (serviceCode != null) {
      _data.fields.add(MapEntry(
        'ServiceCode',
        serviceCode.toString(),
      ));
    }
    if (startDate != null) {
      _data.fields.add(MapEntry(
        'StartDate',
        startDate,
      ));
    }
    if (endDate != null) {
      _data.fields.add(MapEntry(
        'FinishDate',
        endDate,
      ));
    }
    if (showPhone != null) {
      _data.fields.add(MapEntry(
        'ShowTel',
        showPhone.toString(),
      ));
    }
    if (showEmail != null) {
      _data.fields.add(MapEntry(
        'ShowEmail',
        showEmail.toString(),
      ));
    }
    if (showInPostPage != null) {
      _data.fields.add(MapEntry(
        'ShowInPostPage',
        showInPostPage.toString(),
      ));
    }
    if (images != null) {
      _data.files.addAll(images.map((i) => MapEntry(
          'Images',
          MultipartFile.fromFileSync(
            i.path,
            filename: i.path.split(Platform.pathSeparator).last,
          ))));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<ContractDto>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'Project/Create',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<ContractDto>.fromJson(
      _result.data!,
      (json) => ContractDto.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<BaseResponse<ContractDto>>> editContract({
    contractId,
    projectId,
    nameAr,
    nameEn,
    descriptionAr,
    descriptionNameEn,
    contractorNameAr,
    contractorNameEn,
    contractValue,
    currency,
    serviceCode,
    startDate,
    endDate,
    showPhone,
    showEmail,
    showInPostPage,
    images,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ContractId': contractId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (projectId != null) {
      _data.fields.add(MapEntry(
        'ProjId',
        projectId,
      ));
    }
    if (nameAr != null) {
      _data.fields.add(MapEntry(
        'ContNameA',
        nameAr,
      ));
    }
    if (nameEn != null) {
      _data.fields.add(MapEntry(
        'ContNameE',
        nameEn,
      ));
    }
    if (descriptionAr != null) {
      _data.fields.add(MapEntry(
        'DescA',
        descriptionAr,
      ));
    }
    if (descriptionNameEn != null) {
      _data.fields.add(MapEntry(
        'DescE',
        descriptionNameEn,
      ));
    }
    if (contractorNameAr != null) {
      _data.fields.add(MapEntry(
        'ContractorA',
        contractorNameAr,
      ));
    }
    if (contractorNameEn != null) {
      _data.fields.add(MapEntry(
        'ContractorE',
        contractorNameEn,
      ));
    }
    if (contractValue != null) {
      _data.fields.add(MapEntry(
        'ContValue',
        contractValue.toString(),
      ));
    }
    if (currency != null) {
      _data.fields.add(MapEntry(
        'ValueCurrency',
        currency.toString(),
      ));
    }
    if (serviceCode != null) {
      _data.fields.add(MapEntry(
        'ServiceCode',
        serviceCode.toString(),
      ));
    }
    if (startDate != null) {
      _data.fields.add(MapEntry(
        'StartDate',
        startDate,
      ));
    }
    if (endDate != null) {
      _data.fields.add(MapEntry(
        'FinishDate',
        endDate,
      ));
    }
    if (showPhone != null) {
      _data.fields.add(MapEntry(
        'ShowTel',
        showPhone.toString(),
      ));
    }
    if (showEmail != null) {
      _data.fields.add(MapEntry(
        'ShowEmail',
        showEmail.toString(),
      ));
    }
    if (showInPostPage != null) {
      _data.fields.add(MapEntry(
        'ShowInPostPage',
        showInPostPage.toString(),
      ));
    }
    if (images != null) {
      _data.files.addAll(images.map((i) => MapEntry(
          'Images',
          MultipartFile.fromFileSync(
            i.path,
            filename: i.path.split(Platform.pathSeparator).last,
          ))));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<BaseResponse<ContractDto>>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'Project/Edit',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<ContractDto>.fromJson(
      _result.data!,
      (json) => ContractDto.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
