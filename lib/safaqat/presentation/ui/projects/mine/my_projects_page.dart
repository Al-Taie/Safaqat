import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/domain/entities/projects/project_convener_type.dart';
import 'package:safaqat/safaqat/presentation/custom_views/app_bar_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_floating_button.dart';
import 'package:safaqat/safaqat/presentation/ui/projects/components/project_items_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/projects/mine/my_projects_controller.dart';

class MyProjectsPage extends StatelessWidget {
  const MyProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyProjectsController());
    ProjectConvenerType type = ProjectConvenerType.governmental;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Scaffold(
            floatingActionButton: Obx(
              () => CustomFloatingButton(
                title: AppStrings.addNewProject,
                icon: AppDrawable.icAdd,
                isExtended: controller.isFloatingButtonExtended.value,
                onClick: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  // TODO: IMPLEMENT ME
                  // const AddProjectPage().navTo();
                },
              ),
            ),
            appBar: AppBarWidget(
              width: Get.width,
              onBackPressed: Get.back,
              title: AppStrings.manageProjects,
              bottom: TabBar(
                isScrollable: true,
                labelColor: AppColors.primaryColor,
                indicatorColor: AppColors.primaryColor,
                unselectedLabelColor: AppColors.shadePrimary,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.governmental),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.private),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.mixed),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.foreign),
                  ),
                ],
                onTap: (index) {
                  type = ProjectConvenerType.fromInt(index);
                },
              ),
              onSearch: (String query) =>
                  controller.searchProjects(type, query),
            ),
            body: TabBarView(
              children: [
                Obx(
                  () => ProjectItemsWidget(
                    status: controller.governmentalStatus.value.status,
                    apiCall: controller.getGovernmentalProjects,
                    data: controller.filteredGovernmentalProjects.value,
                    isLogged: true,
                    onEdit: (value) {
                      // TODO: IMPLEMENT ME
                      // EditProjectPage(project: value).navTo();
                    },
                    onDelete: (value) {
                      controller.deleteProjects(
                        type: ProjectConvenerType.governmental,
                        id: value.id,
                      );
                    },
                    onPressed: (value) {
                      controller.projectData = value;
                    },
                  ),
                ),
                Obx(
                      () => ProjectItemsWidget(
                    status: controller.privateStatus.value.status,
                    apiCall: controller.getPrivateProjects,
                    data: controller.filteredPrivateProjects.value,
                    isLogged: true,
                    onEdit: (value) {
                      // TODO: IMPLEMENT ME
                      // EditProjectPage(project: value).navTo();
                    },
                    onDelete: (value) {
                      controller.deleteProjects(
                        type: ProjectConvenerType.private,
                        id: value.id,
                      );
                    },
                    onPressed: (value) {
                      controller.projectData = value;
                    },
                  ),
                ),
                Obx(
                      () => ProjectItemsWidget(
                    status: controller.mixedStatus.value.status,
                    apiCall: controller.getMixedProjects,
                    data: controller.filteredMixedProjects.value,
                    isLogged: true,
                    onEdit: (value) {
                      // TODO: IMPLEMENT ME
                      // EditProjectPage(project: value).navTo();
                    },
                    onDelete: (value) {
                      controller.deleteProjects(
                        type: ProjectConvenerType.mixed,
                        id: value.id,
                      );
                    },
                    onPressed: (value) {
                      controller.projectData = value;
                    },
                  ),
                ),
                Obx(
                      () => ProjectItemsWidget(
                    status: controller.foreignStatus.value.status,
                    apiCall: controller.getForeignProjects,
                    data: controller.filteredForeignProjects.value,
                    isLogged: true,
                    onEdit: (value) {
                      // TODO: IMPLEMENT ME
                      // EditProjectPage(project: value).navTo();
                    },
                    onDelete: (value) {
                      controller.deleteProjects(
                        type: ProjectConvenerType.foreign,
                        id: value.id,
                      );
                    },
                    onPressed: (value) {
                      controller.projectData = value;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
