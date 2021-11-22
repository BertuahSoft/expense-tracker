import 'package:expense_tracker/src/core/localization/en.dart';
import 'package:expense_tracker/src/core/localization/id.dart';
import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'id_ID': idID,
      };
}
