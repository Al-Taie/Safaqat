import 'dart:io';
import 'package:intl/intl.dart';

class Utils {
  static final bool isRTL = Platform.localeName.split('_')[0] == 'ar';

  static String formatDate({required String? dateStr, String format = 'yyyy-MM-dd'}) {
    if (dateStr == null) {
      return '-';
    }

    var date = DateTime.parse(dateStr);
    return DateFormat(format).format(date);
  }
}
