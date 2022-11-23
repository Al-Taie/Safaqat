import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    Key? key,
    required this.onAccept,
    required this.onCancel,
    required this.title,
    required this.description,
  }) : super(key: key);

  final VoidCallback? onAccept;
  final VoidCallback? onCancel;
  final String title, description;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: SizedBox(
        height: 200,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.shadePrimary,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Flexible(
                child: Text(
                  description,
                  style: const TextStyle(
                    height: 1.8,
                    fontSize: 14,
                    color: AppColors.shadeSecondary,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: onCancel,
                    child: Text(
                      AppStrings.no,
                    ),
                  ),
                  TextButton(
                    onPressed: onAccept,
                    child: Text(
                      AppStrings.yes,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
