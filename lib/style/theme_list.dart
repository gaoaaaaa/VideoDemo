import 'dart:ui';

import 'package:demoapp/style/base_theme.dart';
import 'package:flutter/material.dart';

class Themes
{
  static Map<MyThemes,BaseTheme> map={MyThemes.light:LightTheme(),MyThemes.dark:DarkTheme()};
  static BaseTheme getTheme(MyThemes myThemes){

    return map[myThemes] ;

  }
  }
enum MyThemes
{
  light,
  dark,
}
class LightTheme extends BaseTheme
{
  @override
  // TODO: implement home_backgound_color
  Color get home_backgound_color => Colors.white;

  @override
  // TODO: implement home_bottom_bar_color
  Color get home_bottom_bar_color => Colors.white;

  @override
  // TODO: implement home_catogory_color
  Color get home_catogory_color => Colors.redAccent;

  @override
  // TODO: implement home_drawer_color
  Color get home_drawer_color => Colors.white;

  @override
  // TODO: implement home_text_content_color
  Color get home_text_content_color => Colors.black;

  Color get home_catogory_onselect_color => Colors.lightBlue;
  @override
  // TODO: implement home_text_description_color
  Color get home_text_description_color => null;

  @override
  // TODO: implement home_title_color
  Color get home_title_color => Colors.black;
  @override
  // TODO: implement app_bar_color
  Color get app_bar_color => Colors.white;

  @override
  // TODO: implement app_bar_icon_color
  Color get app_bar_icon_color => Colors.black;

  @override
  // TODO: implement detail_background_color
  Color get detail_background_color => Colors.white;

  @override
  // TODO: implement detail_recommend_color
  Color get detail_recommend_color => Colors.white;



  @override
  // TODO: implement app_bar_icon_background_color
  Color get app_bar_icon_background_color => Colors.white;

  @override
  // TODO: implement home_catogory_label_color
  Color get home_catogory_label_color => Colors.black38;

  @override
  // TODO: implement video_content_color
  Color get video_content_color => Colors.lightBlue;

  @override
  // TODO: implement video_icon_color
  Color get video_icon_color => Colors.red;

  @override
  // TODO: implement video_progress_background_color
  Color get video_progress_background_color => Colors.white12;

  @override
  // TODO: implement video_progress_played_color
  Color get video_progress_played_color => Colors.red;




}
class DarkTheme extends BaseTheme
{
  @override
  // TODO: implement app_bar_color
  Color get app_bar_color => Colors.black;

  @override
  // TODO: implement app_bar_icon_background_color
  Color get app_bar_icon_background_color => Colors.black;

  @override
  // TODO: implement app_bar_icon_color
  Color get app_bar_icon_color => Colors.white;

  @override
  // TODO: implement detail_background_color
  Color get detail_background_color => Colors.black;

  @override
  // TODO: implement detail_recommend_color
  Color get detail_recommend_color => Colors.black;

  @override
  // TODO: implement home_backgound_color
  Color get home_backgound_color => Colors.black;

  @override
  // TODO: implement home_bottom_bar_color
  Color get home_bottom_bar_color => Colors.black;

  @override
  // TODO: implement home_catogory_color
  Color get home_catogory_color => Colors.black;

  @override
  // TODO: implement home_catogory_label_color
  Color get home_catogory_label_color => Colors.white;

  @override
  // TODO: implement home_catogory_onselect_color
  Color get home_catogory_onselect_color => Colors.purple;

  @override
  // TODO: implement home_drawer_color
  Color get home_drawer_color => Colors.white;

  @override
  // TODO: implement home_text_content_color
  Color get home_text_content_color => Colors.white;

  @override
  // TODO: implement home_text_description_color
  Color get home_text_description_color => Colors.white;

  @override
  // TODO: implement home_title_color
  Color get home_title_color => Colors.white;

  @override
  // TODO: implement video_content_color
  Color get video_content_color => Colors.deepPurple;

  @override
  // TODO: implement video_icon_color
  Color get video_icon_color => Colors.black;

  @override
  // TODO: implement video_progress_background_color
  Color get video_progress_background_color => Colors.white;

  @override
  // TODO: implement video_progress_played_color
  Color get video_progress_played_color => Colors.black;

}