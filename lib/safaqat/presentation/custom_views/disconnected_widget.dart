import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/config/colors.dart';
import '../../app/config/drawable.dart';
import '../../app/config/strings.dart';

class DisconnectedWidget extends StatelessWidget {
  final Function onClickTryAgain;

  const DisconnectedWidget({Key? key, required this.onClickTryAgain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(AppDrawable.icNoWifi),
        const SizedBox(
          height: 24,
        ),
        Text(
          AppStrings.noInternetConnection,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: AppColors.shadePrimary,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Text(
            AppStrings.internetConnectionMessage,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.shadeSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        OutlinedButton(
          onPressed: () {
            onClickTryAgain.call();
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              width: 1,
              color: AppColors.primaryColor,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 48,
              vertical: 16,
            ),
            child: Text(
              AppStrings.tryAgain,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
