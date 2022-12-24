import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/data/models/events/event_dto.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/presentation/custom_views/status_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/components/event_card_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/details/event_details_page.dart';

class EventItemsWidget extends StatelessWidget {
  const EventItemsWidget({
    Key? key,
    required this.status,
    required this.apiCall,
    required this.scrollController,
    required this.data,
    required this.onPressed,
    this.isLogged = false,
    this.onEdit,
    this.onDelete,
    required this.onScrollUpPressed,
    required this.scrollButtonVisibility,
  }) : super(key: key);

  final Status status;
  final VoidCallback apiCall, onScrollUpPressed;
  final bool isLogged, scrollButtonVisibility;
  final ScrollController scrollController;
  final List<EventDto> data;
  final ValueChanged<EventDto> onPressed;
  final ValueChanged<EventDto>? onDelete, onEdit;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: key,
      onRefresh: () async => apiCall(),
      color: AppColors.primaryColor,
      child: StatusWidget(
        status: status,
        onClickTryAgain: apiCall,
        child: ListView.builder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            padding: const EdgeInsets.fromLTRB(
              16,
              8,
              16,
              16,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              var item = data[index];
              return EventCardWidget(
                title: (Utils.isRTL ? item.titleAr : item.titleEn) ?? '-',
                name: item.ownerName ?? '-',
                date: Utils.formatDate(dateStr: item.startDate),
                isLogged: isLogged,
                onEdit: () {
                  onEdit?.call(item);
                },
                onDelete: () {
                  onDelete?.call(item);
                },
                onPressed: () {
                  onPressed(item);
                  EventDetailsPage(event: item).navTo();
                },
              );
            }),
      ),
    );
  }
}
