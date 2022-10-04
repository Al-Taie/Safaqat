import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/data/models/news/news_dto.dart';
import 'package:safaqat/safaqat/presentation/custom_views/text_icon.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({Key? key, required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                child: Text(
                  (Utils.isRTL ? news.titleAr : news.titleEn) ?? '-',
                  style: AppTextStyle.title,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  TextIcon(
                    icon: AppDrawable.icName,
                    text: news.ownerName ?? '-',
                  ),
                  const SizedBox(width: 4),
                  TextIcon(
                    icon: AppDrawable.icDate,
                    text: Utils.formatDate(dateStr: news.date),
                  )
                ],
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(news.image1 ?? ''),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: Get.width,
                child: Text(
                  (Utils.isRTL ? news.detailsAr : news.detailsEn) ?? '-',
                  style: AppTextStyle.title
                      .copyWith(fontSize: 14, color: AppColors.shadePrimary),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 1,
                width: Get.width,
                color: AppColors.shadeQuaternary,
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: Get.width,
                child: Text(
                  AppStrings.hashtags,
                  style: AppTextStyle.title.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 8),
              TagsWidget(
                tags: Utils.isRTL ? news.tagsAr : news.tagsEn,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TagsWidget extends StatelessWidget {
  const TagsWidget({
    Key? key,
    this.tags,
  }) : super(key: key);
  final List<String>? tags;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AlignedGridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 7,
        crossAxisSpacing: 3,
        physics: const BouncingScrollPhysics(),
        itemCount: tags?.length ?? 0,
        itemBuilder: (context, index) => Chip(label: Text(tags?[index] ?? '-')),
      ),
    );
  }
}
