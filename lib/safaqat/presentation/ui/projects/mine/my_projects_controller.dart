import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';
import 'package:safaqat/safaqat/app/extensions/toast_manager.dart';
import 'package:safaqat/safaqat/app/extensions/widget_extension.dart';
import 'package:safaqat/safaqat/data/models/projects/project_dto.dart';
import 'package:safaqat/safaqat/domain/entities/projects/project_convener_type.dart';
import 'package:safaqat/safaqat/domain/entities/projects/project_query.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/projects/delete_project_usecase.dart';
import 'package:safaqat/safaqat/domain/usecases/projects/get_my_projects_usecase.dart';

class MyProjectsController extends GetxController {
  final GetMyProjectsUseCase _getMyProjectsUseCase = Get.put(GetMyProjectsUseCase());
  final DeleteProjectUseCase _deleteProjectUseCase = Get.put(DeleteProjectUseCase());

  final governmentalScrollController = ScrollController();
  final privateScrollController = ScrollController();

  final _isGovernmentalScrollable = false.obs;
  bool get isGovernmentalScrollable => _isGovernmentalScrollable.value;
  set isGovernmentalScrollable(bool value) =>
      _isGovernmentalScrollable.value = value;

  final _isPrivateScrollable = false.obs;
  bool get isPrivateScrollable => _isPrivateScrollable.value;
  set isPrivateScrollable(bool value) => _isPrivateScrollable.value = value;

  @override
  void onInit() {
    super.onInit();

    governmentalScrollController.addListener(() => _pagination(
          apiCall: getGovernmentalProjects,
          onValueChange: (int value) {
            governmentalPageNumber = value;
          },
          scrollController: governmentalScrollController,
          pageNumber: governmentalPageNumber,
          maxNumberOfPages: _governmentalMaxNumberOfPages,
        ));

    privateScrollController.addListener(() => _pagination(
          apiCall: getPrivateProjects,
          onValueChange: (int value) {
            privatePageNumber = value;
          },
          scrollController: privateScrollController,
          pageNumber: privatePageNumber,
          maxNumberOfPages: _privateMaxNumberOfPages,
        ));

    governmentalScrollController.addListener(() =>
        _floatingButtonState(scrollController: governmentalScrollController));

    privateScrollController.addListener(
        () => _floatingButtonState(scrollController: privateScrollController));

    getGovernmentalProjects();
    getPrivateProjects();
    getMixedProjects();
    getForeignProjects();
  }

  final isFloatingButtonExtended = true.obs;

  var _governmentalMaxNumberOfPages = 1;
  var _privateMaxNumberOfPages = 1;
  var _mixedMaxNumberOfPages = 1;
  var _foreignMaxNumberOfPages = 1;

  final _governmentalPageNumber = 1.obs;
  int get governmentalPageNumber => _governmentalPageNumber.value;
  set governmentalPageNumber(int value) => _governmentalPageNumber.value = value;

  final _privatePageNumber = 1.obs;
  int get privatePageNumber => _privatePageNumber.value;
  set privatePageNumber(int value) => _privatePageNumber.value = value;

  final _mixedPageNumber = 1.obs;
  int get mixedPageNumber => _mixedPageNumber.value;
  set mixedPageNumber(int value) => _mixedPageNumber.value = value;

  final _foreignPageNumber = 1.obs;
  int get foreignPageNumber => _foreignPageNumber.value;
  set foreignPageNumber(int value) => _foreignPageNumber.value = value;

  final _projectData = ProjectDto().obs;
  ProjectDto get projectData => _projectData.value;
  set projectData(ProjectDto value) => _projectData.value = value;

  Rx<Resources<dynamic>> governmentalStatus = Resources<dynamic>.init().obs;
  Rx<Resources<dynamic>> privateStatus = Resources<dynamic>.init().obs;
  Rx<Resources<dynamic>> mixedStatus = Resources<dynamic>.init().obs;
  Rx<Resources<dynamic>> foreignStatus = Resources<dynamic>.init().obs;

  RxList<ProjectDto> governmentalProjects = <ProjectDto>[].obs;
  RxList<ProjectDto> filteredGovernmentalProjects = <ProjectDto>[].obs;
  RxList<ProjectDto> privateProjects = <ProjectDto>[].obs;
  RxList<ProjectDto> filteredPrivateProjects = <ProjectDto>[].obs;
  RxList<ProjectDto> mixedProjects = <ProjectDto>[].obs;
  RxList<ProjectDto> filteredMixedProjects = <ProjectDto>[].obs;
  RxList<ProjectDto> foreignProjects = <ProjectDto>[].obs;
  RxList<ProjectDto> filteredForeignProjects = <ProjectDto>[].obs;

  void getGovernmentalProjects() async {
    final params = ProjectQuery(
      pageNumber: governmentalPageNumber,
      type: ProjectConvenerType.governmental.index,
    );

    governmentalStatus.value = Resources.loading();

    final result = await _getMyProjectsUseCase(params: params);
    governmentalStatus.value = result;

    if (result.data?.projects != null) {
      governmentalProjects.value = result.data!.projects!;
      filteredGovernmentalProjects.value = governmentalProjects.value;
    }

    _governmentalMaxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void getPrivateProjects() async {
    final params = ProjectQuery(
      pageNumber: privatePageNumber,
      type: ProjectConvenerType.private.index,
    );

    privateStatus.value = Resources.loading();

    final result = await _getMyProjectsUseCase(params: params);
    privateStatus.value = result;

    if (result.data?.projects != null) {
      privateProjects.value = result.data!.projects!;
      filteredPrivateProjects.value = privateProjects.value;
    }

    _privateMaxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void getMixedProjects() async {
    final params = ProjectQuery(
      pageNumber: mixedPageNumber,
      type: ProjectConvenerType.mixed.index,
    );

    mixedStatus.value = Resources.loading();

    final result = await _getMyProjectsUseCase(params: params);
    mixedStatus.value = result;

    if (result.data?.projects != null) {
      mixedProjects.value = result.data!.projects!;
      filteredMixedProjects.value = mixedProjects.value;
    }

    _mixedMaxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void getForeignProjects() async {
    final params = ProjectQuery(
      pageNumber: foreignPageNumber,
      type: ProjectConvenerType.foreign.index,
    );

    foreignStatus.value = Resources.loading();

    final result = await _getMyProjectsUseCase(params: params);
    foreignStatus.value = result;

    if (result.data?.projects != null) {
      foreignProjects.value = result.data!.projects!;
      filteredForeignProjects.value = foreignProjects.value;
    }

    _foreignMaxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void searchProjects(ProjectConvenerType type, String query) {
    var newFilteredData = <ProjectDto>[];

    if (type == ProjectConvenerType.governmental) {
      newFilteredData = governmentalProjects;
    } else if (type == ProjectConvenerType.private) {
      newFilteredData = privateProjects;
    }else if (type == ProjectConvenerType.mixed) {
      newFilteredData = mixedProjects;
    }else if (type == ProjectConvenerType.foreign) {
      newFilteredData = foreignProjects;
    }

    newFilteredData =
        newFilteredData.where((e) => e.toString().contains(query)).toList();

    if (type == ProjectConvenerType.governmental) {
      filteredGovernmentalProjects.value = newFilteredData;
    } else if (type == ProjectConvenerType.private) {
      filteredPrivateProjects.value = newFilteredData;
    }  else if (type == ProjectConvenerType.mixed) {
      filteredMixedProjects.value = newFilteredData;
    }
    else if (type == ProjectConvenerType.foreign) {
      filteredForeignProjects.value = newFilteredData;
    }
  }

  void _pagination({
    required VoidCallback apiCall,
    required ValueChanged<int> onValueChange,
    required ScrollController scrollController,
    required int pageNumber,
    required int maxNumberOfPages,
  }) {
    if (scrollController.position.isMaxScroll &&
        (pageNumber < maxNumberOfPages)) {
      onValueChange(++pageNumber);
      isFloatingButtonExtended.value = true;
      apiCall();
    } else if (scrollController.position.isMinScroll && pageNumber > 1) {
      onValueChange(--pageNumber);
      isFloatingButtonExtended.value = true;
      apiCall();
    }
  }

  void _floatingButtonState({required ScrollController scrollController}) {
    if (scrollController.position.isMinScroll) {
      isFloatingButtonExtended.value = true;
    } else {
      isFloatingButtonExtended.value = false;
    }
  }

  void deleteProjects({required ProjectConvenerType type, String? id}) async {
    Get.back();

    final result = await _deleteProjectUseCase(params: id);

    if (result.status != Status.success) {
      AppStrings.deletedFailed.toToast();
      return;
    }

    AppStrings.deletedSuccessfully.toToast();

    if (type == ProjectConvenerType.governmental) {
      governmentalProjects.removeWithUpdate(
        filteredGovernmentalProjects,
        (it) => it.id == id,
      );
    } else if (type == ProjectConvenerType.private) {
      privateProjects.removeWithUpdate(
        filteredPrivateProjects,
        (it) => it.id == id,
      );
    } else if (type == ProjectConvenerType.mixed) {
      mixedProjects.removeWithUpdate(
        filteredMixedProjects,
            (it) => it.id == id,
      );
    } else if (type == ProjectConvenerType.foreign) {
      foreignProjects.removeWithUpdate(
        filteredForeignProjects,
            (it) => it.id == id,
      );
    }
  }
}
