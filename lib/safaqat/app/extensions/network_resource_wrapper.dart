
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';
import 'package:retrofit/dio.dart';
import 'package:safaqat/safaqat/app/utils/logger.dart';

import '../../data/models/base_response.dart';
import '../../domain/entities/resources.dart';

extension ResoursesWrapping on HttpResponse<BaseResponse> {
  Resources<T> toResources<T>() {

    switch (response.statusCode) {
      case 200:
      {
        Logger.log(data.response);
          if (data.response is List) {
            if ((data.response as List).isEmpty) {
              return Resources<T>.empty(data.response);
            }
          }
          try {
            return Resources<T>.success(
              data.response!,
                response.statusCode?.toDouble() ?? 0
            );
          } catch (e) {
            return Resources<T>.successNullable(
                data.response,
                response.statusCode?.toDouble() ?? 0
            );
          }
      }
      default:
        {
          return Resources<T>.error(
            response.statusMessage,
            response.statusCode?.toDouble() ?? 0,
          );
        }
    }
  }
}

extension CallManger on Future<HttpResponse<BaseResponse>> {
  Future<Resources<T>> call<T>() {
    return then((value) => value.toResources<T>()).catchError((Object obj) {
      return Future.value(
        Resources<T>.error(
          null,
          obj.toDoubleOrNull(),
        ),
      );
    });
  }
}
