import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../app/config/base_end_points.dart';

part 'safaqat_api_services.g.dart';

@RestApi(baseUrl: URLs.baseApiUrl)
abstract class SafaqatApiServices{
  factory SafaqatApiServices(Dio dio , {String baseUrl}) = _SafaqatApiServices;
}
