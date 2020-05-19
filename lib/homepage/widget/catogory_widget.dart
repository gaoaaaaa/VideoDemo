import 'package:demoapp/api/video_api.dart';
import 'package:demoapp/data_model/Data.dart';
import 'package:demoapp/data_model/VideoModel.dart';
import 'package:demoapp/provider/page_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';

import 'package:rxdart/rxdart.dart';
class CatogoryContent extends StatefulWidget {
  VideoModel videoModel;
  VideoType videoType;
  CatogoryContent(this.videoModel,this.videoType);

  @override
  _CatogoryContentState createState() => _CatogoryContentState();
}

class _CatogoryContentState extends State<CatogoryContent> {

  videoDsc(Data data)
  {
    return Container(
      child: Text(data.title,style: TextStyle(),overflow: TextOverflow.clip,maxLines: 1,),
    );
  }
//  _onLoad()
//  async{
//    widget.nowPage++;
//    prin
//    VideoApi.getVideoContent(widget.videoType,widget.nowPage ).then((value){
//      VideoModel temp=VideoModel.fromJson(value);
//      widget.videoModel.data.addAll(temp.data);
//      publishSubject.add(widget.videoModel);
//    });
//  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      color: Colors.red,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
          ),
          itemCount: widget.videoModel.data.length,
          itemBuilder: (context,index){
            return videoDsc(widget.videoModel.data[index]);
          }),
    );
  }
}
