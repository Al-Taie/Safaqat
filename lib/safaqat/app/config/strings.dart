import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'home': "home",
      'noInternetConnection': "No internet connection",
      'internetConnectionMessage':
      "Your internet connection is currently not available please check or try again.",
      'tryAgain': "Try again",
      'noThingFound': "No Thing Found",
    },
    'ar_IQ': {
      'home': "الرئيسية",
      'noInternetConnection': "لا يوجد اتصال بالانترنت",
      'internetConnectionMessage':
      "اتصال الإنترنت الخاص بك غير متاح حاليًا ، يرجى التحقق أو المحاولة مرة أخرى.",
      'tryAgain': "حاول مرة أخرى",
      'noThingFound': "لم يتم العثور على نتائج",
    },
  };
}

class AppStrings {
  static final home = "home".tr;
  static final noInternetConnection = "noInternetConnection".tr;
  static final internetConnectionMessage = "internetConnectionMessage".tr;
  static final tryAgain = "tryAgain".tr;
  static final noThingFound = "noThingFound".tr;
}