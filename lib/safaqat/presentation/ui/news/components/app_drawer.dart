import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
    required this.name,
    required this.imageUrl,
    this.onProfile,
    this.onManageNews,
    this.onManageEvents,
    this.onManagePosts,
    this.onManageProjects,
    this.onManageContracts,
    this.onSettings,
    this.onSupport,
    this.onTerms,
    this.onLogout,
  }) : super(key: key);

  final String name, imageUrl;
  final VoidCallback? onProfile,
      onManageNews,
      onManageEvents,
      onManagePosts,
      onManageProjects,
      onManageContracts,
      onSettings,
      onSupport,
      onTerms,
      onLogout;

  Widget item({text, icon, onClick, Color color = AppColors.shadeSecondary}) {
    var iconWidget = icon is String
        ? SvgPicture.asset(icon, color: color)
        : Icon(icon, color: color);
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(fontSize: 15, color: AppColors.shadePrimary),
      ),
      leading: iconWidget,
      onTap: onClick,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Utils.isRTL ? Radius.zero : const Radius.circular(16),
          topLeft: Utils.isRTL ? const Radius.circular(16) : Radius.zero,
          bottomRight: Utils.isRTL ? Radius.zero : const Radius.circular(16),
          bottomLeft: Utils.isRTL ? const Radius.circular(16) : Radius.zero,
        ),
      ),
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.75),
              borderRadius: BorderRadius.only(
                topLeft: Utils.isRTL ? const Radius.circular(8) : Radius.zero,
                topRight: Utils.isRTL ? Radius.zero : const Radius.circular(8),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!Utils.isRTL)
                    Flexible(
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: AppColors.background,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: AppColors.primaryColor,
                          value: downloadProgress.progress,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  if (Utils.isRTL)
                    Flexible(
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          // item(
          //   text: AppStrings.profile,
          //   icon: AppDrawable.icTabPerson,
          //   onClick: onProfile,
          // ),
          item(
            text: AppStrings.manageNews,
            icon: AppDrawable.icNews,
            onClick: onManageNews,
          ),
          item(
            text: AppStrings.manageEvents,
            icon: Icons.event,
            onClick: onManageEvents,
          ),
          item(
            text: AppStrings.managePosts,
            icon: Icons.description,
            onClick: onManagePosts,
          ),
          item(
            text: AppStrings.manageProjects,
            icon: Icons.construction,
            onClick: onManageProjects,
          ),
          item(
            text: AppStrings.manageContracts,
            icon: Icons.document_scanner_outlined,
            onClick: onManageContracts,
          ),
          // item(
          //   text: AppStrings.settings,
          //   icon: AppDrawable.icSettings,
          //   onClick: onSettings,
          // ),
          // item(
          //   text: AppStrings.support,
          //   icon: AppDrawable.icSupport,
          //   onClick: onSupport,
          // ),
          // item(
          //   text: AppStrings.termsAndPolicy,
          //   icon: AppDrawable.icTerms,
          //   onClick: onTerms,
          // ),
          item(
            text: AppStrings.logout,
            icon: AppDrawable.icLogout,
            onClick: onLogout,
          ),
        ],
      ),
    );
  }
}
