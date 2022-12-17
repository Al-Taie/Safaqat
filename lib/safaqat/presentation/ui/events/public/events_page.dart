import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/presentation/custom_views/app_bar_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/loading_view.dart';
import 'package:safaqat/safaqat/presentation/ui/events/components/event_card_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/details/event_details_page.dart';
import 'package:safaqat/safaqat/presentation/ui/events/mine/my_events_page.dart';
import 'package:safaqat/safaqat/presentation/ui/events/public/events_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/news/components/app_drawer.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key, this.isLogged = false}) : super(key: key);

  final bool isLogged;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EventsController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
          drawer: isLogged
              ? AppDrawer(
            name: 'Full Name',
            imageUrl:
            'https://st2.depositphotos.com/1006318/5909/v/600/depositphotos_59095205-stock-illustration-businessman-profile-icon.jpg',
            onManageEvents: const MyEventsPage().navTo,
            onProfile: () {},
            onLogout: controller.logout,
          )
              : null,
          appBar: AppBarWidget(
            width: Get.width,
            isSearchEnabled: true,
            title: AppStrings.events,
            onSearch: (String query) => controller.searchEvents(query),
          ),
          body: Stack(
            children: [
              Obx(() {
                return ListView.builder(
                    controller: controller.scrollController,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(
                      16,
                      8,
                      16,
                      16,
                    ),
                    itemCount: controller.filteredEvents.length,
                    itemBuilder: (context, index) {
                      var item = controller.filteredEvents[index];
                      return EventCardWidget(
                        title: (Utils.isRTL ? item.titleAr : item.titleEn) ??
                            '-',
                        name: item.ownerName ?? '-',
                        // image: item.images?.firstOrNull ?? '',
                        date: Utils.formatDate(dateStr: item.startDate),
                        onPressed: () {
                          controller.eventData = item;
                          EventDetailsPage(event: controller.eventData).navTo();
                        },
                      );
                    });
              }),
              Obx(() => LoadingView(
                resource: controller.status.value,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
