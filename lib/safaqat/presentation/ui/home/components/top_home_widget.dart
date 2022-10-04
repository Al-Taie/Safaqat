import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/presentation/ui/home/components/search_widget.dart';

class TopHomeWidget extends StatelessWidget {
  const TopHomeWidget({
    super.key,
    required this.title,
    required this.width,
    required this.height,
  });

  final String title;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: Get.width,
              height: Get.height / 2.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(0),
                  topRight: const Radius.circular(0),
                  bottomLeft:
                      Utils.isRTL ? const Radius.circular(100) : Radius.zero,
                  bottomRight:
                      Utils.isRTL ? Radius.zero : const Radius.circular(100),
                ),
                color: const Color.fromRGBO(164, 250, 0, 1),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: Get.width,
              height: Get.height / 3.015,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(0),
                  topRight: const Radius.circular(0),
                  bottomLeft:
                      Utils.isRTL ? const Radius.circular(100) : Radius.zero,
                  bottomRight:
                      Utils.isRTL ? Radius.zero : const Radius.circular(100),
                ),
                color: const Color.fromRGBO(148, 166, 255, 1),
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: 0,
            child: Container(
              width: Get.width,
              height: Get.height / 3.169,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(0),
                  topRight: const Radius.circular(0),
                  bottomLeft:
                      Utils.isRTL ? const Radius.circular(100) : Radius.zero,
                  bottomRight:
                      Utils.isRTL ? Radius.zero : const Radius.circular(100),
                ),
                color: const Color.fromRGBO(68, 104, 255, 0.800000011920929),
              ),
            ),
          ),
          Positioned(
            top: Get.height / 6.5,
            left: Get.width / 1.5,
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(132, 152, 240, 0.5),
                border: Border.all(
                  color: const Color.fromRGBO(93, 128, 210, 1),
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.elliptical(52, 52)),
              ),
            ),
          ),
          Positioned(
            top: Get.height / 4.5,
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
                child: const SearchWidget(),
              ),
            ),
          ),
          Positioned(
            top: Get.height / 6.5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: Get.width,
                child: Text(
                  title,
                  style: AppTextStyle.title.copyWith(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
