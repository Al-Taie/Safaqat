import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/app/extensions/toast_manager.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/loading_view.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/login_page.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/register/register_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/review/components/review_page_template.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/review/components/text_label.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    controller.status.listen((result) {

      switch (result.status) {
        case Status.success:
          const LoginPage().navToReplacement();
          AppStrings.registerSuccess.toToast();
          break;
        case Status.error:
          AppStrings.registerFailed.toToast();
          break;
        default:
          break;
      }
    });

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
                child: Center(
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundImage: MemoryImage(controller.imageBytes),
                    backgroundColor: Colors.transparent,
                  ),
                )),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  controller.fullNameAr,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  controller.fullNameEn,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  controller.born,
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
              text: controller.nationality.name,
            ),
            const SizedBox(height: 8),
            TextLabel(
              label: '${AppStrings.address}:',
              text: controller.address,
            ),
            const SizedBox(height: 8),
            TextLabel(
              label: '${AppStrings.phone}:',
              text: controller.phone,
            ),
            const SizedBox(height: 8),
            TextLabel(
              label: '${AppStrings.email}:',
              text: controller.email,
            ),
            const SizedBox(height: 8),
            TextLabel(
              label: '${AppStrings.organization}:',
              text: controller.organization,
            ),
            const SizedBox(height: 8),
            TextLabel(
              label: '${AppStrings.jobPosition}:',
              text: controller.jobPosition,
            ),
            const SizedBox(height: 8),
            TextLabel(
              label: '${AppStrings.username}:',
              text: controller.username,
            ),
            const SizedBox(height: 8),
            TextLabel(
              label: '${AppStrings.password}:',
              text: controller.password,
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
            // onPressed: const ConfirmPage(type: ConfirmType.register).navTo,
            onPressed: controller.register,
          ),
        ),
        Obx(
              () => LoadingView(
            resource: controller.status.value,
          ),
        ),
      ],
    );
  }
}
