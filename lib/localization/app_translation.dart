import 'package:get/get.dart';
import 'package:safaqat/localization/ar_iq/ar_iq_translations.dart';
import 'en_us/en_us_translations.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'ar_IQ': arIQ,
  };
}
