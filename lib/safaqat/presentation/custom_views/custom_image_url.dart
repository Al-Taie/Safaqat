
import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';

class CustomImageUrl extends StatelessWidget {
  const CustomImageUrl(
      {Key? key, required this.imageUrl, required this.removeCallback})
      : super(key: key);

  final String imageUrl;
  final Function(String url) removeCallback;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: [
        Positioned.fill(
          child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Text(AppStrings.noPreview));
                  },
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
              removeCallback(imageUrl);
            },
          ),
        ),
      ],
    );
  }
}
