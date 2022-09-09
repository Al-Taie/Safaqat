import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/confirm/confirm_page.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/review/components/review_page_template.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/review/components/text_label.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/review/review_controller.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewController());
    return Stack(
      children: [
        ReviewPageTemplate(
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: AppColors.background),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 2,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: ClipOval(
                child: SvgPicture.asset(
                  AppDrawable.avatarPlaceholder,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.nameArabic,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  AppStrings.nameEnglish,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  AppStrings.born,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 42.0,
                vertical: 20,
              ),
              child: SvgPicture.asset(AppDrawable.grayLine),
            ),
            TextLabel(
              label: '${AppStrings.nationality}:',
              text: '-',
            ),
            TextLabel(
              label: '${AppStrings.city}:',
              text: '-',
            ),
            TextLabel(
              label: '${AppStrings.phone}:',
              text: '-',
            ),
            TextLabel(
              label: '${AppStrings.email}:',
              text: '-',
            ),
            TextLabel(
              label: '${AppStrings.organization}:',
              text: '-',
            ),
            TextLabel(
              label: '${AppStrings.jobPosition}:',
              text: '-',
            ),
            TextLabel(
              label: '${AppStrings.username}:',
              text: '-',
            ),
            TextLabel(
              label: '${AppStrings.password}:',
              text: '-',
            ),
            const SizedBox(height: 48),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomButton(
            color: AppColors.ternary,
            textColor: AppColors.primaryColor,
            text: AppStrings.sendConfirmCode,
            onPressed: const ConfirmPage(type: ConfirmType.register).navTo,
          ),
        ),
      ],
    );
  }
}
