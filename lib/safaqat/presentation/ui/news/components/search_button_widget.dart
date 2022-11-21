import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';

class SearchButtonWidget extends StatelessWidget {
  const SearchButtonWidget({
    super.key,
    this.width = 48,
    this.height = 48,
  required this.onPressed,
  });

  final double width, height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(164, 250, 0, 1),
                borderRadius: BorderRadius.all(Radius.elliptical(width, height)),
              ),
            ),
            SvgPicture.asset(
              AppDrawable.icSearch,
              height: 24,
              width: 24,
            ),
          ],
        ),
      ),
    );
  }
}
