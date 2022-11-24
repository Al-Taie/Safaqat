import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';

class CustomImageFile extends StatelessWidget {
  const CustomImageFile(
      {Key? key, required this.imageFile, required this.removeCallback})
      : super(key: key);

  final ImageFile imageFile;
  final Function(ImageFile file) removeCallback;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: [
        Positioned.fill(
          child: !imageFile.hasPath
              ? Image.memory(
                  imageFile.bytes!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Text(AppStrings.noPreview));
                  },
                )
              : Image.file(
                  File(imageFile.path!),
                  fit: BoxFit.cover,
                ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: InkWell(
            excludeFromSemantics: true,
            onLongPress: () {},
            child: Container(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  size: 20,
                )),
            onTap: () {
              removeCallback(imageFile);
            },
          ),
        ),
      ],
    );
  }
}
