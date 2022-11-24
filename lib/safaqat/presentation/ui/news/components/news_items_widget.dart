import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/app/extensions/list_extension.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/data/models/news/news_dto.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/presentation/custom_views/status_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/news/components/news_card_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/news/details/news_details_page.dart';

class NewsItemsWidget extends StatelessWidget {
  const NewsItemsWidget({
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
  final List<NewsDto> data;
  final ValueChanged<NewsDto> onPressed;
  final ValueChanged<NewsDto>? onDelete, onEdit;

  @override
  Widget build(BuildContext context) {
    return StatusWidget(
      status: status,
      onClickTryAgain: apiCall,
      child: Expanded(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView.builder(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(
                  16,
                  8,
                  16,
                  16,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var item = data[index];
                  return NewsCardWidget(
                    title: (Utils.isRTL ? item.titleAr : item.titleEn) ?? '-',
                    name: item.ownerName ?? '-',
                    image: item.images?.firstOrNull ?? '',
                    date: Utils.formatDate(dateStr: item.date),
                    isLogged: isLogged,
                    onEdit: () {
                      onEdit?.call(item);
                    },
                    onDelete: () {
                      onDelete?.call(item);
                    },
                    onPressed: () {
                      onPressed(item);
                      NewsDetailsPage(news: item).navTo();
                    },
                  );
                }),
            if (scrollButtonVisibility)
              IconButton(
                icon: const Icon(Icons.arrow_circle_up_rounded),
                onPressed: onScrollUpPressed,
              )
          ],
        ),
      ),
    );
  }
}
