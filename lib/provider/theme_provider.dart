import 'package:demoapp/style/base_theme.dart';
import 'package:demoapp/style/theme_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ThemeProvider with ChangeNotifier
{
  static BaseTheme ofBaseTheme(BuildContext context)
  {
    return Provider.of<ThemeProvider>(context).baseTheme;
  }
  static BaseTheme ofSetBaseTheme(BuildContext context,MyThemes myThemes)
  {
     Provider.of<ThemeProvider>(context,listen: false).setTheme(myThemes);
  }
  ThemeProvider(this.baseTheme);
  BaseTheme baseTheme;
  setTheme(MyThemes myThemes)
  {
    baseTheme=Themes.getTheme(myThemes);
    notifyListeners();
  }

}