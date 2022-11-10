import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/app/extensions/toast_manager.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/loading_view.dart';
import 'package:safaqat/safaqat/presentation/custom_views/svg_icon_button.dart';
import 'package:safaqat/safaqat/presentation/ui/news/add/add_news_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/news/add/components/news_info_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/news/add/components/publish_news_widget.dart';

class AddNewsPage extends StatelessWidget {
  const AddNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddNewsController());

    controller.status.listen((result) {
      switch (result.status) {
        case Status.success:
          Get.back();
          AppStrings.publishSuccess.toToast();
          break;
        case Status.error:
          AppStrings.publishFailed.toToast();
          break;
        default:
          break;
      }
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(
            AppStrings.addNewNews,
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
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(
                      16,
                      16,
                      16,
                      0,
                    ),
                    children: [
                      NewsInfoWidget(
                        title: AppStrings.arabic,
                        newsTitle: AppStrings.title,
                        content: AppStrings.content,
                        tagsHint: AppStrings.tags,
                        tags: controller.tagsAr,
                        rtl: true,
                        onTitleChange: (String value) {
                          controller.titleAr = value;
                        },
                        onContentChange: (String value) {
                          controller.detailsAr = value;
                        },
                        onTagsChange: (List<String> value) {
                          controller.tagsAr.value = value;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      NewsInfoWidget(
                        title: AppStrings.english,
                        newsTitle: AppStrings.title,
                        content: AppStrings.content,
                        tagsHint: AppStrings.tags,
                        tags: controller.tagsEn,
                        onTitleChange: (String value) {
                          controller.titleEn = value;
                        },
                        onContentChange: (String value) {
                          controller.detailsEn = value;
                        },
                        onTagsChange: (List<String> value) {
                          controller.tagsEn.value = value;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const PublishNewsWidget(),
                    ],
                  ),
                ),
                CustomButton(
                  color: AppColors.ternary,
                  textColor: AppColors.primaryColor,
                  text: AppStrings.post,
                  onPressed: controller.publish,
                ),
              ],
            ),
            Obx(
              () => LoadingView(
                resource: controller.status.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
