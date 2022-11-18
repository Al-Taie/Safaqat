import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/presentation/custom_views/card_icon.dart';
import 'package:safaqat/safaqat/presentation/custom_views/svg_icon_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/text_icon.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    Key? key,
    required this.title,
    required this.name,
    required this.image,
    required this.date,
    this.isLogged = false,
    this.onPressed,
    this.onEdit,
    this.onDelete,
  }) : super(key: key);

  final String title, name, date, image;
  final bool isLogged;
  final VoidCallback? onPressed, onEdit, onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: const Color(0xffF0EFFF),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(5),
            topLeft: const Radius.circular(5),
            bottomLeft: Utils.isRTL
                ? const Radius.circular(20)
                : const Radius.circular(5),
            bottomRight: Utils.isRTL
                ? const Radius.circular(5)
                : const Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CardImage(image: image),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.title.copyWith(fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  TextIcon(
                    icon: AppDrawable.icName,
                    text: name,
                  ),
                  if (isLogged)
                    SizedBox(
                      width: Get.width - 136,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextIcon(
                            icon: AppDrawable.icDate,
                            text: date,
                          ),
                          Row(
                            children: [
                              SvgIconButton(
                                  icon: AppDrawable.icTrash, onPressed: onDelete),
                              SvgIconButton(
                                  icon: AppDrawable.icEdit, onPressed: onEdit),
                            ],
                          )
                        ],
                      ),
                    )
                  else
                    TextIcon(
                      icon: AppDrawable.icDate,
                      text: date,
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
