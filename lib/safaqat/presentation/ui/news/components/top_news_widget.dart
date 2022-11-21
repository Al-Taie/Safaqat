import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/presentation/ui/home/home_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/news/components/search_widget.dart';

class TopNewsWidget extends StatelessWidget implements PreferredSizeWidget {
  TopNewsWidget(
      {super.key,
      required this.title,
      required this.width,
      required this.height,
      this.toolbarHeight,
      this.bottom,
      this.onBack,
      required this.rate})
      : preferredSize = Size(height - rate * 80, width);

  final String title;
  final double width, height, rate;
  final VoidCallback? onBack;
  final HomeController controller = Get.find();
  final _textController = TextEditingController();
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final ScaffoldState? scaffold = Scaffold.maybeOf(context);
    final bool hasDrawer = scaffold?.hasDrawer ?? false;
    Widget? leading;

    if (hasDrawer && onBack == null) {
      leading = IconButton(
        icon: const Icon(Icons.menu),
        iconSize: 24,
        color: AppColors.ternary,
        onPressed: Scaffold.of(context).openDrawer,
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    }

  if (onBack!= null){
    leading = IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      iconSize: 24,
      color: AppColors.ternary,
      onPressed: onBack,
    );
  }

    return SizedBox(
      width: width,
      height: height - rate * (bottom != null ? 15 : 80),
      child: Column(
        children: [
          Flexible(
            child: Stack(
              clipBehavior: Clip.antiAlias,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: Get.width,
                    height: Get.height / (3.7 + rate),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(0),
                        topRight: const Radius.circular(0),
                        bottomLeft: Utils.isRTL
                            ? const Radius.circular(100)
                            : Radius.zero,
                        bottomRight: Utils.isRTL
                            ? Radius.zero
                            : const Radius.circular(100),
                      ),
                      color: AppColors.ternary,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: Get.width,
                    height: Get.height / (3.9 + rate),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(0),
                        topRight: const Radius.circular(0),
                        bottomLeft: Utils.isRTL
                            ? const Radius.circular(100)
                            : Radius.zero,
                        bottomRight: Utils.isRTL
                            ? Radius.zero
                            : const Radius.circular(100),
                      ),
                      color: const Color.fromRGBO(148, 166, 255, 1),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: Get.width,
                    height: Get.height / (4.1 + rate),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(0),
                        topRight: const Radius.circular(0),
                        bottomLeft: Utils.isRTL
                            ? const Radius.circular(100)
                            : Radius.zero,
                        bottomRight: Utils.isRTL
                            ? Radius.zero
                            : const Radius.circular(100),
                      ),
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height / (7.5 + rate),
                  left: Utils.isRTL ? Get.width / 10 : 0,
                  right: Utils.isRTL ? 0 : Get.width / 10,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: Utils.isRTL ? 0 : 16,
                      right: Utils.isRTL ? 16 : 0,
                    ),
                    child: SizedBox(
                      width: Get.width / 1.2,
                      height: 50,
                      child: SearchWidget(
                          controller: _textController,
                          hintText: AppStrings.search,
                          onTextChanged: (value) {
                            if (value.isEmpty) {
                              controller.getNews();
                            }
                          },
                          onPressed: () {
                            controller.query = _textController.text;

                            if (_textController.text.isNotEmpty) {
                              controller.searchNews();
                            }
                          }),
                    ),
                  ),
                ),
                Positioned(
                  top: height / (3.3 + rate),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      width: Get.width,
                      child: Text(
                        title,
                        // textAlign: TextAlign.center,
                        style: AppTextStyle.title
                            .copyWith(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment:
                      Utils.isRTL ? Alignment.topRight : Alignment.topLeft,
                  child: leading,
                )
              ],
            ),
          ),
          bottom ?? const SizedBox()
        ],
      ),
    );
  }
}
