import 'dart:io';

import 'package:safaqat/safaqat/app/utils/utils.dart';

class AppDrawable {
  //path
  static const _drawable = 'assets/drawable';

  static const icTabHome = '$_drawable/ic_tab_home.svg';
  static const icNoWifi = '$_drawable/ic_no_wifi.svg';
  static const empty = '$_drawable/empty.png';
  static const icEmail = '$_drawable/ic_email.svg';

  static const bottomLeftSplashLogo = '$_drawable/bottom_left_splash_logo.png';
  static const topRightSplashLogo = '$_drawable/top_right_splash_logo.png';
  static const centerSplashLayer = '$_drawable/center_splash_layer.svg';
  static const centerSplashTitle = '$_drawable/center_splash_title.svg';
  static const centerBaseLayer = '$_drawable/center_base_layer.svg';
  static const greenLine = '$_drawable/green_line.svg';
  static const avatarPlaceholder = '$_drawable/avatar_placeholder.svg';
  static const grayLine = '$_drawable/gray_line.svg';
  static const icCheekMark = '$_drawable/ic_check_mark.svg';
  static const icContact = '$_drawable/ic_contact.svg';
  static const icPerson = '$_drawable/ic_person.svg';
  static const icTopArrow = '$_drawable/ic_top_arrow.svg';
  static const icDownArrow = '$_drawable/ic_down_arrow.svg';
  static const icGallery = '$_drawable/ic_gallery.svg';
  static const icSearch = '$_drawable/ic_search.svg';
  static const icName = '$_drawable/ic_name.svg';
  static const icDate = '$_drawable/ic_date.svg';
  static const _icBack = '$_drawable/ic_backward.svg';
  static const _icForward = '$_drawable/ic_forward.svg';
  static String get icBack => Utils.isRTL ? _icForward : _icBack;
  static const icAdd = '$_drawable/ic_add.svg';
}
