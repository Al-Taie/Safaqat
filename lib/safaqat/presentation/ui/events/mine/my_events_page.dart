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
    EventType type = EventType.general;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: DefaultTabController(
        length: 6,
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
                isScrollable: true,
                labelColor: AppColors.primaryColor,
                indicatorColor: AppColors.primaryColor,
                unselectedLabelColor: AppColors.shadePrimary,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.general),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.conference),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.trainingCourse),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.exhibition),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.seminar),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.forum),
                  ),
                ],
                onTap: (index) {
                  if (index == EventType.general.index) {
                    type = EventType.general;
                  } else if (index == EventType.conference.index) {
                    type = EventType.conference;
                  } else if (index == EventType.trainingCourse.index) {
                    type = EventType.trainingCourse;
                  } else if (index == EventType.exhibition.index) {
                    type = EventType.exhibition;
                  } else if (index == EventType.seminar.index) {
                    type = EventType.seminar;
                  } else {
                    type = EventType.forum;
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
                              type: EventType.general, id: value.id);
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
                    Obx(
                      () => EventItemsWidget(
                        status: controller.conferenceStatus.value.status,
                        apiCall: controller.getConferenceEvents,
                        scrollController: controller.conferenceScrollController,
                        data: controller.filteredConferenceEvents.value,
                        isLogged: true,
                        onEdit: (value) {
                          EditEventPage(event: value).navTo();
                        },
                        onDelete: (value) {
                          controller.deleteEvents(
                              type: EventType.conference, id: value.id);
                        },
                        onPressed: (value) {
                          controller.eventData = value;
                        },
                        onScrollUpPressed: () {
                          controller.conferencePageNumber--;
                        },
                        scrollButtonVisibility:
                            controller.isConferenceScrollable,
                      ),
                    ),
                    Obx(
                      () => EventItemsWidget(
                        status: controller.trainingCourseStatus.value.status,
                        apiCall: controller.getTrainingCourseEvents,
                        scrollController:
                            controller.trainingCourseScrollController,
                        data: controller.filteredTrainingCourseEvents.value,
                        isLogged: true,
                        onEdit: (value) {
                          EditEventPage(event: value).navTo();
                        },
                        onDelete: (value) {
                          controller.deleteEvents(
                              type: EventType.trainingCourse, id: value.id);
                        },
                        onPressed: (value) {
                          controller.eventData = value;
                        },
                        onScrollUpPressed: () {
                          controller.trainingCoursePageNumber--;
                        },
                        scrollButtonVisibility:
                            controller.isTrainingCourseScrollable,
                      ),
                    ),
                    Obx(
                      () => EventItemsWidget(
                        status: controller.exhibitionStatus.value.status,
                        apiCall: controller.getExhibitionEvents,
                        scrollController: controller.exhibitionScrollController,
                        data: controller.filteredExhibitionEvents.value,
                        isLogged: true,
                        onEdit: (value) {
                          EditEventPage(event: value).navTo();
                        },
                        onDelete: (value) {
                          controller.deleteEvents(
                              type: EventType.exhibition, id: value.id);
                        },
                        onPressed: (value) {
                          controller.eventData = value;
                        },
                        onScrollUpPressed: () {
                          controller.exhibitionPageNumber--;
                        },
                        scrollButtonVisibility:
                            controller.isExhibitionScrollable,
                      ),
                    ),
                    Obx(
                      () => EventItemsWidget(
                        status: controller.seminarStatus.value.status,
                        apiCall: controller.getSeminarEvents,
                        scrollController: controller.seminarScrollController,
                        data: controller.filteredSeminarEvents.value,
                        isLogged: true,
                        onEdit: (value) {
                          EditEventPage(event: value).navTo();
                        },
                        onDelete: (value) {
                          controller.deleteEvents(
                              type: EventType.seminar, id: value.id);
                        },
                        onPressed: (value) {
                          controller.eventData = value;
                        },
                        onScrollUpPressed: () {
                          controller.seminarPageNumber--;
                        },
                        scrollButtonVisibility: controller.isSeminarScrollable,
                      ),
                    ),
                    Obx(
                      () => EventItemsWidget(
                        status: controller.forumStatus.value.status,
                        apiCall: controller.getForumEvents,
                        scrollController: controller.forumScrollController,
                        data: controller.filteredForumEvents.value,
                        isLogged: true,
                        onEdit: (value) {
                          EditEventPage(event: value).navTo();
                        },
                        onDelete: (value) {
                          controller.deleteEvents(
                              type: EventType.forum, id: value.id);
                        },
                        onPressed: (value) {
                          controller.eventData = value;
                        },
                        onScrollUpPressed: () {
                          controller.forumPageNumber--;
                        },
                        scrollButtonVisibility: controller.isForumScrollable,
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
