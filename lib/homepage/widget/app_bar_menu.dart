import 'package:demoapp/provider/theme_provider.dart';
import 'package:demoapp/style/theme_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBarMenu extends StatelessWidget {
  Color color;
  String mp4Url;

  AppBarMenu({this.color,this.mp4Url});

  share(){
    Share.share("check out my website $mp4Url",subject: 'look');
  }
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Function>(
      onSelected: (fc){
        fc();
      },
      icon: Icon(Icons.more_horiz,color: color,),
      itemBuilder: (context){
        return [
          PopupMenuItem(
            value: share,
            child: Icon(Icons.share,color:color,semanticLabel: "在浏览器播放",),
          )
        ];
      },
    );
  }
}
