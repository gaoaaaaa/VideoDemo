import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'localizations.dart';

class MyLocalizationDelegate extends LocalizationsDelegate<MyLocalizations>
{
  MyLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return true;
  }

  @override
  Future<MyLocalizations> load(Locale locale) {
    // TODO: implement load
    return SynchronousFuture<MyLocalizations>(new MyLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<MyLocalizations> old) {
    // TODO: implement shouldReload
    return false;
  }

static MyLocalizationDelegate delegate=new MyLocalizationDelegate();


}