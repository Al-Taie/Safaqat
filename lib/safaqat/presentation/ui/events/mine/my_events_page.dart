import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/domain/entities/events/event_category.dart';
import 'package:safaqat/safaqat/presentation/custom_views/app_bar_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_floating_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/loading_view.dart';
import 'package:safaqat/safaqat/presentation/ui/events/add/add_event_page.dart';
import 'package:safaqat/safaqat/presentation/ui/events/components/event_items_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/edit/edit_event_page.dart';
import 'package:safaqat/safaqat/presentation/ui/events/mine/my_events_controller.dart';


class MyEventsPage extends StatelessWidget {
  const MyEventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyEventsController());
    EventCategory type = EventCategory.general;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            floatingActionButton: Obx(
              () => CustomFloatingButton(
                title: AppStrings.addNewEvent,
                icon: AppDrawable.icAdd,
                isExtended: controller.isFloatingButtonExtended.value,
                onClick: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  const AddEventPage().navTo();
                },
              ),
            ),
            appBar: AppBarWidget(
              width: Get.width,
              onBackPressed: Get.back,
              title: AppStrings.manageEvents,
              bottom: TabBar(
                labelColor: AppColors.primaryColor,
                indicatorColor: AppColors.primaryColor,
                unselectedLabelColor: AppColors.shadePrimary,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.posted),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.waited),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.rejected),
                  ),
                ],
                onTap: (index) {
                  if (index == EventCategory.general.index) {
                    type = EventCategory.general;
                  } else if (index == EventCategory.conference.index) {
                    type = EventCategory.conference;
                  }  else if (index == EventCategory.trainingCourse.index) {
                    type = EventCategory.trainingCourse;
                  }  else if (index == EventCategory.exhibition.index) {
                    type = EventCategory.exhibition;
                  }  else if (index == EventCategory.seminar.index) {
                    type = EventCategory.seminar;
                  } else {
                    type = EventCategory.forum;
                  }
                },
              ),
              onSearch: (String query) => controller.searchEvents(type, query),
            ),
            body: Stack(
              fit: StackFit.expand,
              children: [
                TabBarView(
                  children: [
                    Obx(
                      () => EventItemsWidget(
                        status: controller.generalStatus.value.status,
                        apiCall: controller.getGeneralEvents,
                        scrollController: controller.generalScrollController,
                        data: controller.filteredGeneralEvents.value,
                        isLogged: true,
                        onEdit: (value) {
                          EditEventPage(event: value).navTo();
                        },
                        onDelete: (value) {
                          controller.deleteEvents(
                              type: EventCategory.general, id: value.id);
                        },
                        onPressed: (value) {
                          controller.eventData = value;
                        },
                        onScrollUpPressed: () {
                          controller.generalPageNumber--;
                        },
                        scrollButtonVisibility: controller.isGeneralScrollable,
                      ),
                    ),
                  ],
                ),
                LoadingView(resource: controller.status.value)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
