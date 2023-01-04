import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/app/utils/show_menu.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/projects/project_convener_dto.dart';
import 'package:safaqat/safaqat/data/models/projects/project_sector_dto.dart';
import 'package:safaqat/safaqat/presentation/custom_views/alert_dialog_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/card_icon.dart';
import 'package:safaqat/safaqat/presentation/custom_views/text_icon.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    Key? key,
    required this.title,
    required this.name,
    required this.image,
    required this.date,
    required this.city,
    required this.convener,
    required this.sector,
    this.isLogged = false,
    this.onPressed,
    this.onDelete,
    this.onEdit,
  }) : super(key: key);

  final String title, name, date, image;
  final CityDto? city;
  final ProjectConvenerDto? convener;
  final ProjectSectorDto? sector;
  final bool isLogged;
  final VoidCallback? onPressed, onEdit, onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Utils.isRTL ? Alignment.topLeft : Alignment.topRight,
        children: [
          Card(
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
                      Row(
                        children: [
                          TextIcon(
                            icon: AppDrawable.icDate,
                            text: date,
                          ),
                          const SizedBox(width: 8),
                          TextIcon(
                            icon: Icons.location_pin,
                            text: city?.name,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          TextIcon(
                            icon: Icons.local_convenience_store_outlined,
                            text: convener?.name,
                          ),
                          const SizedBox(width: 8),
                          TextIcon(
                            icon: Icons.category,
                            text: sector?.name,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          if (onEdit != null && onDelete != null && isLogged)
            SizedBox(
              height: 42,
              width: 42,
              child: GestureDetector(
                onTapDown: (TapDownDetails details) {
                  ShowMenu.showPopup(
                    offset: details.globalPosition,
                    context: context,
                    menuItems: [
                      MenuItems.edit,
                      MenuItems.delete,
                    ],
                    onEditPressed: onEdit,
                    onDeletePressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) => AlertDialogWidget(
                          onAccept: onDelete,
                          onCancel: Get.back,
                          title: AppStrings.deleteProject,
                          description: AppStrings.deleteDescription,
                        ),
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    AppDrawable.icTwoDots,
                    height: 12,
                    width: 6,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
