import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/no_param_usecase.dart';
import 'package:safaqat/safaqat/data/models/projects/cost_category_dto.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';

class GetCostCategoriesUseCase
    extends NoParamUseCase<Resources<List<CostCategoryDto>>> {
  final SafaqatRepository _safaqatRepository = Get.find();

  @override
  Future<Resources<List<CostCategoryDto>>> call() =>
      _safaqatRepository.getCostCategories();
}
