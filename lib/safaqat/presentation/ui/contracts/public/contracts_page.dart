import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/app/extensions/list_extension.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/domain/entities/contracts/contract_status.dart';
import 'package:safaqat/safaqat/presentation/custom_views/app_bar_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/status_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/contracts/components/contract_card_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/contracts/details/contract_details_page.dart';
import 'package:safaqat/safaqat/presentation/ui/contracts/public/contracts_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/events/mine/my_events_page.dart';
import 'package:safaqat/safaqat/presentation/ui/news/components/app_drawer.dart';
import 'package:safaqat/safaqat/presentation/ui/news/mine/my_news_page.dart';
import 'package:safaqat/safaqat/presentation/ui/posts/mine/my_posts_page.dart';
import 'package:safaqat/safaqat/presentation/ui/projects/mine/my_projects_page.dart';

class ContractsPage extends StatelessWidget {
  const ContractsPage({Key? key, this.logged = false}) : super(key: key);

  final bool logged;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContractsController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
          drawer: logged
              ? AppDrawer(
                  name: '-',
                  imageUrl:
                      'https://st2.depositphotos.com/1006318/5909/v/600/depositphotos_59095205-stock-illustration-businessman-profile-icon.jpg',
                  onManageNews: const MyNewsPage().navTo,
                  onManageEvents: const MyEventsPage().navTo,
                  onManagePosts: const MyPostsPage().navTo,
                  onManageProjects: const MyProjectsPage().navTo,
                  onLogout: controller.logout,
                )
              : null,
          appBar: AppBarWidget(
            width: Get.width,
            isSearchEnabled: true,
            // title: AppStrings.posts,
            onSearch: (String query) => controller.searchContracts(query),
          ),
          body: Obx(() {
            return StatusWidget(
              status: controller.status.value.status,
              onClickTryAgain: controller.getContracts,
              child: ListView.builder(
                  controller: controller.scrollController,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    8,
                    16,
                    16,
                  ),
                  itemCount: controller.filteredContracts.length,
                  itemBuilder: (context, index) {
                    var item = controller.filteredContracts[index];
                    return ContractCardWidget(
                      title: item.name,
                      name: item.contractor ?? '-',
                      image: item.images.firstOrNull ?? '',
                      date: Utils.formatDate(dateStr: item.startDate),
                      service: item.service,
                      status: ContractStatus.fromInt(item.contractStatus ?? 0),
                      onPressed: () {
                        controller.contractData = item;
                        ContractDetailsPage(contract: controller.contractData).navTo();
                      },
                    );
                  }),
            );
          }),
        ),
      ),
    );
  }
}
