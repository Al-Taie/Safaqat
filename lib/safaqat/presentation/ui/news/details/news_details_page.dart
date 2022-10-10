import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/app/extensions/list_extension.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/data/models/news/news_dto.dart';
import 'package:safaqat/safaqat/presentation/custom_views/svg_icon_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/text_icon.dart';
import 'package:safaqat/safaqat/presentation/ui/news/details/components/tags_viewer_widget.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({Key? key, required this.news}) : super(key: key);

  final NewsDto news;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(
            AppStrings.newsDetails,
            style: AppTextStyle.title.copyWith(fontSize: 18),
          ),
          centerTitle: true,
          backgroundColor: AppColors.background,
          elevation: 0,
          leading: SvgIconButton(
            icon: AppDrawable.icBack,
            onPressed: Get.back,
          ),
        ),
        body: Padding(
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
                    icon: AppDrawable.icDate,
                    text: Utils.formatDate(dateStr: news.date),
                  ),
                  const SizedBox(width: 4),
                  TextIcon(
                    icon: AppDrawable.icName,
                    text: news.ownerName ?? '-',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(news.images?.firstOrNull ?? ''),
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
              TagsViewerWidget(
                tags: Utils.isRTL ? news.tagsAr : news.tagsEn,
              )
            ],
          ),
        ),
      ),
    );
  }
}
