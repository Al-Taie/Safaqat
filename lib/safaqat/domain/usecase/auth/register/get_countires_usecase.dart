import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/no_param_usecase.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';

class GetCountriesUseCase extends NoParamUseCase<Resources<List<CountryDto>>> {
  final SafaqatRepository _safaqatRepository = Get.find();

  @override
  Future<Resources<List<CountryDto>>> call() =>
      _safaqatRepository.getCountries();
}
