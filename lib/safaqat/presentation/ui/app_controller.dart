import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/extensions/int_extension.dart';
import 'package:safaqat/safaqat/app/extensions/list_extension.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/post_category_dto.dart';
import 'package:safaqat/safaqat/domain/usecases/auth/register/get_cities_usecase.dart';
import 'package:safaqat/safaqat/domain/usecases/auth/register/get_countires_usecase.dart';
import 'package:safaqat/safaqat/domain/usecases/posts/get_post_categories_usecase.dart';

class AppController extends GetxController {
  final _getCountriesUseCase = Get.put(GetCountriesUseCase());
  final _getCitiesUseCase = Get.put(GetCitiesUseCase());
  final _getPostCategories = Get.put(GetPostCategoriesUseCase());

  @override
  void onInit() {
    super.onInit();
    _getCountries();
    _getCategories();
  }

  final RxList<CountryDto> countries = <CountryDto>[].obs;
  final RxList<CityDto> cities = <CityDto>[].obs;

  final RxList<PostCategoryDto> postCategories = <PostCategoryDto>[].obs;

  final RxList<String> tagsAr = <String>[].obs;
  final RxList<String> tagsEn = <String>[].obs;

  final _country = CountryDto().obs;

  CountryDto get country => _country.value;

  set country(CountryDto value) {
    _country.value = value;
    _getCities();
  }

  final _city = CityDto().obs;

  CityDto get city => _city.value;

  set city(CityDto value) => _city.value = value;

  void _getCountries() async {
    final result = await _getCountriesUseCase();
    if (result.data != null) {
      countries.value = result.data!;
    }
  }

  void _getCities() async {
    final result = await _getCitiesUseCase(
      params: country.countryNo.toIntOrZero(),
    );
    if (result.data != null) {
      cities.value = result.data!;
    }
  }

  void _getCategories() async {
    final result = await _getPostCategories();
    if (result.data != null) {
      postCategories.value = result.data!
          .toList()
          .unique((x) => x.code)
          .unique((x) => x.nameAr)
          .unique((x) => x.nameEn);

      try {
        postCategories.sort((a, b) => a.nameEn!.compareTo(b.nameEn!));
      } catch (e) {
        // SKIP
      }
    }
  }
}
