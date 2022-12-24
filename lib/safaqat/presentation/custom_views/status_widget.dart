import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';

import 'disconnected_widget.dart';
import 'empty_widget.dart';

class StatusWidget extends StatelessWidget {
  final Status status;
  final Widget child;
  final Function onClickTryAgain;

  const StatusWidget({
    Key? key,
    required this.status,
    required this.child,
    required this.onClickTryAgain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case Status.init:
        return Container();
      case Status.loading:
        return const SpinKitFadingCircle(
          color: AppColors.primaryColor,
          size: 64,
        );
      case Status.success:
        return RefreshIndicator(
          key: key,
          onRefresh: () async => onClickTryAgain(),
          color: AppColors.primaryColor,
          child: child,
        );
      case Status.error:
        return DisconnectedWidget(
          onClickTryAgain: onClickTryAgain,
        );
      case Status.empty:
        return RefreshIndicator(
          key: key,
          onRefresh: () async => onClickTryAgain(),
          color: AppColors.primaryColor,
          child: Stack(
            children: [const EmptyWidget(), child],
          ),
        );
    }
  }
}
