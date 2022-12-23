import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/utils/logger.dart';
import 'package:safaqat/safaqat/domain/entities/events/stakeholder.dart';

class StakeholderWidget extends StatelessWidget {
  const StakeholderWidget({
    Key? key,
    required this.stakeholder,
    required this.index,
    required this.onClick, required this.onDeleteCliked,
  }) : super(key: key);
  final Stakeholder stakeholder;
  final int index;
  final ValueChanged<Stakeholder> onClick, onDeleteCliked;

  @override
  Widget build(BuildContext context) {
    stakeholder.stakeholderOrder = index;
    return GestureDetector(
      // onTap: () => onClick(stakeholder),
      onLongPress: () => onDeleteCliked(stakeholder),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.file(
          stakeholder.stakeholderLogo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
