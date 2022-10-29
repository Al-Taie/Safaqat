import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key? key,
    required this.name,
    required this.date,
    required this.read,
    required this.incoming,
  }) : super(key: key);

  final String name, date;
  final bool read, incoming;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffEDEAEA),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name),
            Text(date),
            Text(read ? AppStrings.read : AppStrings.unread),
          ],
        ),
      ),
    );
  }
}
