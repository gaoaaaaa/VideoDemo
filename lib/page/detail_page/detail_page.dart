import 'dart:math';

import 'package:demoapp/api/video_api.dart';
import 'package:demoapp/data_model/VideoModel.dart';
import 'package:demoapp/data_model/detail/VideoDetailModel.dart';
import 'package:demoapp/data_model/detail/recommendModel.dart';
import 'package:demoapp/data_model/detail/video_detail_data.dart';
import 'package:demoapp/homepage/widget/app_bar_menu.dart';
import 'package:demoapp/homepage/widget/paly_list.dart';
import 'package:demoapp/homepage/widget/recmomend_page_view.dart';
import 'package:demoapp/homepage/widget/video_recommend.dart';
import 'package:demoapp/homepage/widget/video_widget.dart';
import 'package:demoapp/provider/theme_provider.dart';
import 'package:demoapp/style/theme_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/phoenix_footer.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:share/share.dart';
import 'package:video_player/video_player.dart';

class DetailPage extends StatefulWidget {
  VideoDetailModel detailModel;
  String vid;
  DetailPage(this.vid,{this.detailModel});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  VideoDetailModel detailModel;
  VideoModel videoModel;
  VideoDetailData videoDetailData;
  PublishSubject<VideoDetailData> subject;
  int randPage;

//  VideoPlayerController videoPlayerController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    videoDetailData=new VideoDetailData();
    subject=  PublishSubject<VideoDetailData>();
    // TODO: implement initState
//        randPage=Random().nextInt(10);
    randPage=0;
    VideoApi.getRecommend(randPage).then((value){
      videoDetailData.recommendData=value;
      subject.add(videoDetailData);
//      Future.delayed(Duration(seconds: 15),(){
//        videoDetailData.recommendData.boutique.data.addAll(videoDetailData.recommendData.joker.data);
//        subject.add(videoDetailData);
//      });
    });
//    VideoApi.getVideoContent(VideoType.boutique, Random(20).nextInt(20)).then((value){
//       videoModel=VideoModel.fromJson(value);
//       setState(() {
//
//       });
//    });
    VideoApi.getVideoDetail(widget.vid).then((value) {
      detailModel = VideoDetailModel.fromJson(value);
      videoDetailData.detailModel=detailModel;
      subject.add(videoDetailData);
//print(value.toString());
    });

    super.initState();
  }
  Future<void>_onRefresh()
  async{
    print("refresh");
    VideoApi.getVideoDetail(widget.vid).then((value) {
      detailModel = VideoDetailModel.fromJson(value);
      videoDetailData.detailModel=detailModel;
      subject.add(videoDetailData);
//print(value.toString());
    });
    return ;
  }
  Future<void>_onLoad()
  async{
    randPage=randPage+1;
    VideoApi.getRecommend(randPage).then((value){
      videoDetailData.recommendData.joker.data.addAll(value.joker.data);
      videoDetailData.recommendData.boutique.data.addAll(value.boutique.data);
      subject.add(videoDetailData);
//      Future.delayed(Duration(seconds: 15),(){
//        videoDetailData.recommendData.boutique.data.addAll(videoDetailData.recommendData.joker.data);
//        subject.add(videoDetailData);
//      });
    print("load"+randPage.toString());
  });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context,theme,child){
        var baseTheme=theme.baseTheme;
        return StreamBuilder<VideoDetailData>(
          stream: subject.stream,
          builder: (context,snapshot){
            var data=snapshot.data;
            return         Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  backgroundColor: baseTheme.app_bar_color,
                  leading: Drawer(
                    child: Container(
                      color: baseTheme.app_bar_color,
                      child: IconButton(
                        color: baseTheme.app_bar_icon_color,
                        icon: Icon(Icons.playlist_play,),
                        onPressed: (){
                          _scaffoldKey.currentState.openDrawer();
                        },
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    detailModel!=null?AppBarMenu(color:baseTheme.app_bar_icon_color,mp4Url: detailModel.data.mp4_url,):Container()
                  ],
                ),
                drawer: PlayList(baseTheme.app_bar_color,baseTheme.app_bar_icon_color),
//      appBar: AppBar(
//        leading: Drawer()        ,
//      title: showMenuBar(),
//      ),
                backgroundColor: baseTheme.detail_background_color,
                body:Container(
//                  decoration: BoxDecoration(),
                  padding: EdgeInsets.all( 10),
                  child: EasyRefresh(
                    header: ClassicalHeader(showInfo: false),
//                  showInfo: false,loadReadyText: "",completeDuration:Duration(seconds: 1),loadText: "",
                    footer: PhoenixFooter(),
                    onRefresh: _onRefresh,
                    onLoad: _onLoad,
                    child: snapshot?.data!=null?ListView(
//        physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        data?.detailModel?.data!=null?VideoStack(data.detailModel):Center(
                          child: CircularProgressIndicator(),
                        ),
                        data?.recommendData!=null?RecommendPageView(data.recommendData):Center(
                          child: CircularProgressIndicator(),
                        ),
//                      Align(
//                        alignment: Alignment.bottomCenter,
//                        child: Text("ok"),
//                      )
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[Icon(Icons.plus_one,size: 50,),
                            Text("这里上拉刷新!")
                          ],
                        )                    ],
                    ):Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )

            );
          },
        );



      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subject.close();
    super.dispose();
  }
}
