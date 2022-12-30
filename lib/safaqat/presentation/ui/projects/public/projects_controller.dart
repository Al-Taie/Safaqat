import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/extensions/widget_extension.dart';
import 'package:safaqat/safaqat/data/models/projects/project_dto.dart';
import 'package:safaqat/safaqat/data/models/projects/projects_response.dart';
import 'package:safaqat/safaqat/domain/entities/projects/project_query.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/auth/logout/delete_user_info_usecase.dart';
import 'package:safaqat/safaqat/domain/usecases/projects/get_projects_usecase.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/login_page.dart';

class ProjectsController extends GetxController {
  final DeleteUserInfoUseCase _logoutUseCase = Get.put(DeleteUserInfoUseCase());
  final GetProjectsUseCase _getProjectsUseCase = Get.put(GetProjectsUseCase());
  final scrollController = ScrollController();

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_pagination);
    scrollController.addListener(_floatingButtonState);
    getProjects();
  }

  final isFloatingButtonExtended = true.obs;

  final _pageNumber = 1.obs;
  var _maxNumberOfPages = 1;

  int get pageNumber => _pageNumber.value;

  set pageNumber(int value) => _pageNumber.value = value;

  final _projectData = ProjectDto().obs;
  ProjectDto get projectData => _projectData.value;
  set projectData(ProjectDto value) => _projectData.value = value;

  Rx<Resources<ProjectsResponse>> status = Resources<ProjectsResponse>.init().obs;

  RxList<ProjectDto> projects = <ProjectDto>[].obs;
  RxList<ProjectDto> filteredProjects = <ProjectDto>[].obs;

  final _query = ''.obs;

  String get query => _query.value;

  set query(String value) => _query.value = value;

  void getProjects() async {
    final body = ProjectQuery(pageNumber: pageNumber);

    status.value = Resources.loading();

    final result = await _getProjectsUseCase(params: body);
    status.value = result;

    if (result.data?.projects != null) {
      projects.value = result.data!.projects!;
      filteredProjects.value = projects.value;
    }
    _maxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void searchProjects(String query) {
    List<ProjectDto> newFilteredData = projects.value;

    newFilteredData =
        newFilteredData.where((e) => e.toString().contains(query)).toList();

    filteredProjects.value = newFilteredData;
  }

  void _pagination() {
    if (scrollController.position.isMaxScroll &&
        (pageNumber < _maxNumberOfPages)) {
      pageNumber++;
      isFloatingButtonExtended.value = true;
      getProjects();
    } else if (scrollController.position.isMinScroll && pageNumber > 1) {
      pageNumber--;
      isFloatingButtonExtended.value = true;
      getProjects();
    }
  }

  void _floatingButtonState() {
    if (scrollController.position.isMinScroll) {
      isFloatingButtonExtended.value = true;
    } else {
      isFloatingButtonExtended.value = false;
    }
  }

  void logout() {
    _logoutUseCase();
    Get.offAll(() => const LoginPage());
  }
}
