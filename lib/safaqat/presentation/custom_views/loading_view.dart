import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../app/config/colors.dart';
import '../../domain/entities/resources.dart';

class LoadingView extends StatelessWidget {
  final Resources resource;
  const LoadingView({
    Key? key,
    required this.resource,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (resource.status == Status.loading) {
      return const SpinKitFadingCircle(
        color: AppColors.primaryColor,
        size: 64,
      );
    } else {
      return Container();
    }
  }
}
