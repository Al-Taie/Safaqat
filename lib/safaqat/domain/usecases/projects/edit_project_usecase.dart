import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/projects/project_dto.dart';
import 'package:safaqat/safaqat/domain/entities/projects/edit_project_params.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';

class EditProjectUseCase extends ParamUseCase<Resources<ProjectDto>, EditProjectParams> {
  final SafaqatRepository _safaqatRepository = Get.find();

  @override
  Future<Resources<ProjectDto>> call({required EditProjectParams params}) =>
      _safaqatRepository.editProject(
        projectId: params.projectId,
        body: params.body,
      );
}
