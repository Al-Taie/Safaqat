
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/events/event_body.dart';
import 'package:safaqat/safaqat/data/models/events/event_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/post_body.dart';
import 'package:safaqat/safaqat/data/models/posts/post_dto.dart';
import 'package:safaqat/safaqat/data/models/projects/project_body.dart';
import 'package:safaqat/safaqat/data/models/projects/project_dto.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';

class AddProjectUseCase extends ParamUseCase<Resources<ProjectDto>, ProjectBody> {
  final SafaqatRepository _safaqatRepository = Get.find();

  @override
  Future<Resources<ProjectDto>> call({required ProjectBody params}) =>
      _safaqatRepository.addProject(body: params);
}
