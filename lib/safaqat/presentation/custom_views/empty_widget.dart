import 'package:flutter/material.dart';

import '../../app/config/colors.dart';
import '../../app/config/drawable.dart';
import '../../app/config/strings.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
          ),
          Image.asset(
            AppDrawable.empty,
            width: 200,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            AppStrings.noThingFound,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: AppColors.shadePrimary,
            ),
          ),
        ],
      ),
    );
  }
}
