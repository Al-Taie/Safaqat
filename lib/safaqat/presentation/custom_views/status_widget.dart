import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:safaqat/safaqat/app/utils/logger.dart';

import '../../app/config/colors.dart';
import '../../domain/entities/resources.dart';
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
        return child;
      case Status.error:
        return DisconnectedWidget(
          onClickTryAgain: onClickTryAgain,
        );
      case Status.empty:
        return const EmptyWidget();
    }
  }
}
