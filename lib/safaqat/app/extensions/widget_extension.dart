
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension WidgetExtension on ScrollPosition {
  bool get isMaxScroll => (pixels == maxScrollExtent);
}
