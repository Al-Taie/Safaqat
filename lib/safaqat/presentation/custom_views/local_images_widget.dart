import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_image_file.dart';
import 'package:safaqat/safaqat/presentation/custom_views/expansion_widget.dart';

class LocalImagesWidget extends StatelessWidget {
  const LocalImagesWidget({
    Key? key,
    required this.imageController,
    required this.expanded,
    required this.onExpansionChanged,
    required this.onImagesChange,
  }) : super(key: key);

  final bool expanded;
  final ValueChanged<List<File>> onImagesChange;
  final ValueChanged<bool> onExpansionChanged;

  final MultiImagePickerController imageController;
  
  @override
  Widget build(BuildContext context) {
    return ExpansionWidget(
      expanded: expanded,
      onExpansionChanged: onExpansionChanged,
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
          initialContainerBuilder: (context, pickerCallback) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blueGrey.withOpacity(0.05),
              ),
              height: 160,
              width: double.infinity,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: TextButton(
                  child: Text(
                    AppStrings.add,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    pickerCallback();
                  },
                ),
              ),
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
            var result = values.map((e) => File(e.path.toString()));
            onImagesChange(result.toList());
          },
        ),
      ],
    );
  }
}
