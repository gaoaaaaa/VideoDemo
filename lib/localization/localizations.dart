import 'package:demoapp/localization/string_base.dart';
import 'package:demoapp/localization/string_en.dart';
import 'package:demoapp/localization/string_zh.dart';
import 'package:flutter/cupertino.dart';

class MyLocalizations
{
  Locale locale;
 static Locale myLocale;
  static Map<String,StringBase>_localizedValues={
    'en':StringEn(),
    "zh":StringZh(),
  };
  MyLocalizations(this.locale);
  StringBase get currentLocalized
  {
    return myLocale!=null?_localizedValues.containsKey(myLocale.languageCode)?_localizedValues[myLocale.languageCode]:_localizedValues["zh"]:
     _localizedValues.containsKey(locale.languageCode)?_localizedValues[locale.languageCode]:_localizedValues["zh"];
  }
  static setLocalization(Locale locale)
  {
    myLocale =locale;
  }
  static Iterable<String> get keys=>_localizedValues.keys;
static MyLocalizations of(BuildContext context)
{
  return Localizations.of(context, MyLocalizations);
}

}