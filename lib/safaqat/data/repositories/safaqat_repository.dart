import 'package:get/get.dart';
import 'package:safaqat/safaqat/data/data_source/network/safaqat_api_services.dart';

import '../../domain/repositories/safaqat_repository.dart';

class SafaqatRepositoryImpl extends SafaqatRepository {
  final SafaqatApiServices _apiServices = Get.find();
}
