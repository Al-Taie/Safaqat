import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/boolean_extension.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/presentation/custom_views/alert_dialog_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/svg_icon_button.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key? key,
    required this.name,
    required this.date,
    required this.read,
    required this.color,
    required this.description,
    required this.incoming,
    required this.onRead,
  }) : super(key: key);

  final String name, date, description;
  final bool read, incoming;
  final Color color;
  final VoidCallback onRead;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (read.not()) {
          onRead();
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: read ? AppColors.background : color,
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ExpandChild(
            indicatorPadding: EdgeInsets.zero,
            collapsedVisibilityFactor: 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name),
                    Text(date),
                    Text(read ? AppStrings.read : AppStrings.unread),
                  ],
                ),
                const SizedBox(height: 16),
                Text(description)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
