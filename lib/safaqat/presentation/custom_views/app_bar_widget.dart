import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/presentation/custom_views/animated_text_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/search_filed.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    super.key,
    this.title,
    required this.width,
    this.height = 50,
    this.isSearchEnabled = false,
    this.onBackPressed,
    this.padding = const EdgeInsets.all(8),
    this.onSearch,
    this.toolbarHeight,
    this.bottom,
  }) : preferredSize = Size(height, width);

  final String? title;
  final bool isSearchEnabled;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onBackPressed;
  final void Function(String term)? onSearch;
  final double? toolbarHeight;
  final double width, height;
  final PreferredSizeWidget? bottom;
  @override
  final Size preferredSize;

  @override
  Widget build(
    BuildContext context,
  ) {
    Rx<bool> isAnimated = false.obs;
    FocusNode searchFocusNode = FocusNode();
    final ScaffoldState? scaffold = Scaffold.maybeOf(context);
    final bool hasDrawer = scaffold?.hasDrawer ?? false;
    Widget? leading;

    if (hasDrawer && onBackPressed == null) {
      leading = IconButton(
        icon: const Icon(Icons.menu),
        iconSize: 24,
        color: AppColors.shadeSecondary,
        onPressed: Scaffold.of(context).openDrawer,
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    }

    if (onBackPressed != null) {
      leading = IconButton(
        icon: SvgPicture.asset(AppDrawable.icBack),
        iconSize: 24,
        color: AppColors.shadeSecondary,
        onPressed: onBackPressed,
      );
    }
    return Padding(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: height,
            child: Stack(
              children: [
                if (leading != null) leading,
                if (title != null)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: AnimatedTextWidget(
                        title?.capitalizeFirst ?? '',
                        isAnimated: isAnimated,
                      ),
                    ),
                  ),
                if (isSearchEnabled)
                  Obx(
                    () => Align(
                      alignment:
                          Utils.isRTL ? Alignment.topLeft : Alignment.topRight,
                      child: Card(
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                        shadowColor: AppColors.shadow,
                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 150),
                          child: SizedBox(
                            height: height,
                            width: isAnimated.value
                                ? MediaQuery.of(context).size.width * 0.8
                                : 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                isAnimated.value
                                    ? Expanded(
                                        child: animatedSearchFiled(
                                          searchFocusNode: searchFocusNode,
                                          onSearching: onSearch,
                                        ),
                                      )
                                    : Container(),
                                IconButton(
                                  splashColor: Colors.grey,
                                  icon: SvgPicture.asset(
                                    AppDrawable.icSearch,
                                    color: AppColors.shadeSecondary,
                                  ),
                                  onPressed: () {
                                    isAnimated.value =
                                        isAnimated.value ? false : true;
                                    searchFocusNode.requestFocus();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          bottom ?? const SizedBox()
        ],
      ),
    );
  }
}
