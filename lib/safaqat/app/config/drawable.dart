import 'dart:io';

class AppDrawable {
  static final bool _isRTL = Platform.localeName.split('_')[0] == 'ar';

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

}
