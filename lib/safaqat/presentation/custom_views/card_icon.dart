import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String image;
  final double? size;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const CardImage(
      {Key? key,
        required this.image,
        this.size = 60,
        this.onPressed,
        this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: backgroundColor,
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: size,
          height: size,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
            child: Image.network(
              image,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
