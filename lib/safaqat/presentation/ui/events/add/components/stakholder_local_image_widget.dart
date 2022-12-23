import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/types.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_image_file.dart';

class StakeHolderLocalImageWidget extends StatelessWidget {
  const StakeHolderLocalImageWidget({
    Key? key,
    required this.expanded,
    required this.onExpansionChanged,
    required this.onImagesChange,
    required this.index, required this.imageController,
  }) : super(key: key);

  final bool expanded;
  final int index;
  final MultiImagePickerController imageController;
  final VoidCallback2<int, File> onImagesChange;
  final ValueChanged<bool> onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    return MultiImagePickerView(
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
        return SizedBox(
          height: 120,
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
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
                const SizedBox(height: 8),
                Text(AppStrings.logo)
              ],
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
        var result = File(values.first.path.toString());
        onImagesChange(index, result);
      },
    );
  }
}
