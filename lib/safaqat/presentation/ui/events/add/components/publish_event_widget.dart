import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_image_file.dart';
import 'package:safaqat/safaqat/presentation/custom_views/expansion_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/add/add_event_controller.dart';


class PublishEventWidget extends StatelessWidget {
  const PublishEventWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddEventController());
    final imageController = MultiImagePickerController(
      maxImages: 10,
      allowedImageTypes: ['png', 'jpg', 'jpeg'],
    );

    return ExpansionWidget(
      headerColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(10),
      title: AppStrings.pictures,
      children: [
        MultiImagePickerView(
          controller: imageController,
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, image, removeCallback) {
            return CustomImageFile(
              imageFile: image,
              removeCallback: removeCallback,
            );
          },
          addMoreBuilder: (context, pickerCallback) {
            return SizedBox(
              height: 170,
              width: double.infinity,
              child: Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue.withOpacity(0.2),
                    shape: const CircleBorder(),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.add,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                  onPressed: () {
                    pickerCallback();
                  },
                ),
              ),
            );
          },
          onChange: (values) {
            controller.images =
                values.map((e) => File(e.path.toString())).toList();
          },
        ),
      ],
    );
  }
}
