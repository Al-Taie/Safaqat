import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/textfiled_form.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/register/components/account_creation_and_terms_policy_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/register/register_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/review/review_page.dart';
import 'package:safaqat/safaqat/presentation/ui/home/home_page.dart';
import 'package:safaqat/safaqat/presentation/ui/news/add/add_news_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/news/add/components/news_info_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/news/add/components/publish_news_widget.dart';

class AddNewsPage extends StatelessWidget {
  const AddNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddNewsController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
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
                    tags: AppStrings.tags,
                    rtl: true,
                    onTitleChange: (String value) {},
                    onContentChange: (String value) {},
                    onTagsChange: (List<String> value) {},
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  NewsInfoWidget(
                    title: AppStrings.english,
                    newsTitle: AppStrings.title,
                    content: AppStrings.content,
                    tags: AppStrings.tags,
                    onTitleChange: (String value) {},
                    onContentChange: (String value) {},
                    onTagsChange: (List<String> value) {},
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
              onPressed: const HomePage().navTo,
            ),
          ],
        ),
      ),
    );
  }
}
