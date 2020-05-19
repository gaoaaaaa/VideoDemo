import 'package:demoapp/api/video_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class NowPageProvider with ChangeNotifier
{
  NowPageProvider(){
    for (var temp in VideoType.values)
      {
        nowPage[temp]=0;
      }
  }
   Map<VideoType,int> nowPage=new Map();
   int getNowPage(VideoType videoType)
  {
    return nowPage[videoType];
  }
  setNowPage(VideoType type,int temp){
    nowPage[type]=temp;
    notifyListeners();
  }
}