import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/projects/projects_response.dart';
import 'package:safaqat/safaqat/domain/entities/projects/project_query.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';

class GetProjectsUseCase
    extends ParamUseCase<Resources<ProjectsResponse>, ProjectQuery> {
  final SafaqatRepository _safaqatRepository = Get.find();

  @override
  Future<Resources<ProjectsResponse>> call({required ProjectQuery params}) =>
      _safaqatRepository.getProjects(
        pageSize: params.pageSize,
        pageNumber: params.pageNumber,
      );
}
