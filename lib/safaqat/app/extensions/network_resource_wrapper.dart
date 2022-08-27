
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';
import 'package:retrofit/dio.dart';

import '../../data/models/base_response.dart';
import '../../domain/entities/resources.dart';

extension ResoursesWrapping on HttpResponse<BaseResponse> {
  Resources<T> toResources<T>() {
    switch (response.statusCode) {
      case 200:
        {
          if (data.result is List) {
            if ((data.result as List).isEmpty) {
              return Resources<T>.empty(data.result);
            }
          }
          try {
            return Resources<T>.success(
              data.result!,
              null, // replace null by another response after added to base response.
            );
          } catch (e) {
            throw null ?? 0; // replace null by another response after added to base response.
          }
        }
      default:
        {
          return Resources<T>.error(
            response.statusMessage,
            null, // replace null by another response after added to base response.
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

