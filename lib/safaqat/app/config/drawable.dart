import 'dart:io';

class AppDrawable {
  static final bool _isRTL = Platform.localeName.split("_")[0] == "ar";

  //path
  static const _drawable = "assets/drawable";

  static const icTabHome = "$_drawable/ic_tab_home.svg";
  static const icNoWifi = "$_drawable/ic_no_wifi.svg";
  static const empty = "$_drawable/empty.png";

}