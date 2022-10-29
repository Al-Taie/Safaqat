import 'dart:io';
import 'package:intl/intl.dart';

class Utils {
  static final bool isRTL = Platform.localeName.split('_')[0] == 'ar';
  static const int maxInt32Value = 0x7FFFFFFF;

  static const String dateTimeFormat = 'yyyy-MM-dd h:mm a';

  static String formatDate({required String? dateStr, String format = 'yyyy-MM-dd'}) {
    if (dateStr == null) {
      return '-';
    }

    if(dateStr.endsWith(':000')) {
      dateStr = dateStr.replaceFirst(':000', '');
    }

    var date = DateTime.parse(dateStr);
    return DateFormat(format).format(date);
  }
}
