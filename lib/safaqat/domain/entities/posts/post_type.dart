
import 'package:safaqat/safaqat/app/config/strings.dart';

enum PostType {
  // ignore: unused_field
  _,
  opportunity ,
  request;

  static List<PostType> get items => values.skip(1).toList();

  @override
  String toString() => (this == opportunity) ? AppStrings.opportunity : AppStrings.request;
}
