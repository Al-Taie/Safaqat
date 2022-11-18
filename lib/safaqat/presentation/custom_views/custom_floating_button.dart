import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.isExtended,
    required this.onClick,
  }) : super(key: key);

  final String title;
  final String icon;
  final bool isExtended;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: AppColors.primaryColor,
        onPressed: () => {onClick.call()},
        label: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (Widget child, Animation<double> animation) =>
              FadeTransition(
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              axis: Axis.horizontal,
              child: child,
            ),
          ),
          child: isExtended
              ? Row(
                  children: [
                    SvgPicture.asset(
                      icon,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColors.background,
                      ),
                    ),
                  ],
                )
              : SvgPicture.asset(
                  icon,
                  width: 24,
                  height: 24,
                ),
        ),
      ),
    );
  }
}
