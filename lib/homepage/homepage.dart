import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:demoapp/api/video_api.dart';
import 'package:demoapp/data_model/Data.dart';
import 'package:demoapp/data_model/VideoModel.dart';

import 'package:demoapp/data_model/detail/VideoDetailModel.dart';
import 'package:demoapp/homepage/widget/catogory_widget.dart';
import 'package:demoapp/localization/localizations.dart';
import 'package:demoapp/localization/localizations_delegate.dart';
import 'package:demoapp/page/detail_page/detail_page.dart';
import 'package:demoapp/provider/page_index_provider.dart';
import 'package:demoapp/provider/theme_provider.dart';
import 'package:demoapp/style/theme_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/phoenix_footer.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:share/share.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static String imagePath="assets/image/png/";
  Map<VideoType, VideoModel> map;
  GlobalKey<ScaffoldState> scaffoldKey;
  TabController tabController;
  VideoType type;
  PublishSubject<Map<VideoType, VideoModel>> subject;
  List<String> categoryName;
  Map<VideoType, int> nowPage = new Map();
  int page = 0;


  @override
  void initState() {
    scaffoldKey=new GlobalKey();
    type = VideoType.boutique;
    subject = new PublishSubject();
    tabController = new TabController(length: VideoType.values.length, vsync: this);
    map = new Map();
    nowPage = new Map();
//   VideoApi.getHomePage().then((map){
//     this.map=map;
//     subject.add(map);
//   });
    tabController.addListener(() {
      type = VideoType.values[tabController.index];
//      int index=Provider.of<NowPageProvider>(context).getNowPage(type);
      if (nowPage[type] == null) {
        nowPage[type] = 0;
        VideoApi.getVideoContent(type, 0).then((value) {
          VideoModel temp = VideoModel.fromJson(value);
          map[type] = temp;
          subject.add(map);
//        subject.stream.;
        });
      }
//      int now=nowPage[type];
    });
//    tabController.addListener((){
//      print("page Load");
//      int index=Provider.of<NowPageProvider>(context,listen: false).getNowPage(type);
//      VideoApi.getVideoContent(VideoType.boutique, index).then((value){
//        var temp=VideoModel.fromJson(value);
//        map[VideoType.boutique].data.addAll(temp.data);
//        subject.add(map);
//      });
//    });
    VideoApi.getVideoContent(type, 0).then((value) {
      nowPage[type] = 0;
      map[type] = VideoModel.fromJson(value);
      subject.add(map);
    });
    // TODO: implement initState
//    VideoApi.getVideoContent(VideoType.boutique, 1).then((theme){
////      var map=json.decode(theme);
//      VideoModel videoModel=VideoModel.fromJson(theme);
////print(theme['data'][0].toString());
//      print(videoModel.data[0].description);
//    });
//    VideoApi.getVideoDetail("VDBHR5JBA").then((theme){
////      var map=json.decode(theme);
//      VideoDetailModel detailModel=VideoDetailModel.fromJson(theme);
////print(theme.toString());
//      print(detailModel.data.mp4_url);
//    });

    super.initState();
  }

  Future<void> _onRefresh()
  async{
    VideoApi.getVideoContent(type, 0).then((value) {
      nowPage[type] = 0;
      map[type] = VideoModel.fromJson(value);
      subject.add(map);
    });
  }
 Future<void> _onLoad() async {
    nowPage[type] += 1;
    VideoApi.getVideoContent(
        type, nowPage[type])
        .then((value) {
      VideoModel temp =
      VideoModel.fromJson(value);
      map[type].data.addAll(temp.data);
      subject.add(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) {
        var baseTheme = theme.baseTheme;
        return StreamBuilder<Map<VideoType, VideoModel>>(
          stream: subject.stream,
          builder: (context, snapshot) {
            _drawer()
            {
              _changeTheme()
              {
                return Consumer<ThemeProvider>(
                  builder: (context,themeProvider,child){
                    return InkWell(
                      onTap: (){
//                        Navigator.pop(context);
                        showAboutDialog(
                          context: context,
                          children: MyThemes.values.map((theme){
                            return InkWell(
                              onTap: (){
                                themeProvider.setTheme(theme);
                                setState(() {

                                });
                              },
                              child: Text(theme.toString(),style: TextStyle(fontSize: 20),),
                            );
                          }).toList()                    );

                      },
                      child:
                      Text("切换主题",style: TextStyle(fontSize: 20),),
                    );
                  },
                );
              }
              _changeLanguage(){
                return InkWell(
                  onTap: (){
//                        Navigator.pop(context);
                    showAboutDialog(
                        context: context,
                        children:MyLocalizations.keys.map((key){
                          return InkWell(
                            onTap: (){
                              MyLocalizations.setLocalization(Locale(key));
                              setState(() {

                              });
                            },
                            child: Text(key,style:  TextStyle(fontSize: 20),),
                          );
                        }).toList()

                    );

                  },
                  child:
                  Text("切换语言",style: TextStyle(fontSize: 20),),
                );
              }
              return Drawer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _changeTheme(),
                    _changeLanguage(),
                  ],
                ),
              );
            }
            _tabBar()
            {
              return                   TabBar(
                  unselectedLabelColor: baseTheme.home_catogory_label_color,
                  labelColor: baseTheme.home_catogory_onselect_color,
                  controller: tabController,
                  tabs: List.generate(VideoType.values.length, (index) {
                    return tabBarItem(
                        MyLocalizations.of(context)
                            .currentLocalized
                            .category_name_list[index],
                        20);
                  }).toList());

            }

            _appBar() {
              return AppBar(
                flexibleSpace: InkWell(
                    onTap: (){
                      scaffoldKey.currentState.openDrawer();
                    },
                    child: Icon(Icons.drag_handle,color: baseTheme.app_bar_icon_color,)),
bottom: _tabBar(),
//                leading: InkWell(
//                    onTap: (){
//                      scaffoldKey.currentState.openDrawer();
//                    },
//                    child: Icon(Icons.drag_handle,color: baseTheme.app_bar_icon_color,)),
                backgroundColor: baseTheme.app_bar_color,
//        Localizations.of<MyLocalizations>(context, MyLocalizations).currentLocalized.app_bar_name
//                title: Text(MyLocalizations.of(context).currentLocalized.app_bar_name),
              actions: <Widget>[

              ],
              );
            }
            _videoDsc(Data data) {_name(String img,String name)
              {
                return                 Expanded(
                  child: Text(name,style: TextStyle(),maxLines: 1,),
//          DecoratedBox(
//          decoration: BoxDecoration(
//              color: Colors.tealAccent,
//              image: DecorationImage(
//                  fit: BoxFit.fill,
//                  image: AssetImage(imagePath+img)
//              )
//          ),
//            child: Text(name),
//          )
                );
              }
              _title(String img,String icon)
              {
                return         CircleAvatar(
                  backgroundColor: Colors.cyanAccent,
                  backgroundImage: NetworkImage(
                      icon
                  ),
//                child: CachedNetworkImage(
//                  imageUrl: icon,
////                  fit: BoxFit.fill,
//                  errorWidget: (context,url,error){
//                    return Image.network(VideoModel.unFound);
//                  },
//                ),
                );
              }
              _videoCover(String url)
              {
                return             Container(
                  decoration: BoxDecoration(
//                    border: Border.all(color: Color.fromRGBO(3, 54, 25, 1.0),width: 3),
//                    borderRadius: BorderRadius.circular(20)
                  ),
//        decoration: BoxDecoration(
//            color: Colors.tealAccent,
//            image: DecorationImage(
//                fit: BoxFit.fill,
//                image: AssetImage(
//                    imagePath+"tip3.png")
//            )
//        ),
                  child: CachedNetworkImage(
                    imageUrl: url,
                    fit: BoxFit.fill,
                    errorWidget: (context,url,error){
                      return Image.network(VideoModel.unFound);
                    },
                  ),
                );
              }
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return data.vid==null?null:DetailPage(data.vid);
                      }
                  ));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 300,
                                     decoration: BoxDecoration(
                    color: baseTheme.video_content_color,
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                ),
                  child: Opacity(
                    opacity: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
//                          decoration: BoxDecoration(
//                            color: Colors.cyanAccent,
//                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
//                          ),
                          child:                         Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              _name("tip1.png", data.topicName),
                              _title("tip2.png", data.topicImg)     ,
                            ],
                          ),
                        ),
                        Expanded(
                          child: _videoCover(data.cover),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            _easyRefresh(List<Data> data)
            {
              return EasyRefresh(
                onRefresh: _onRefresh,
                footer: PhoenixFooter(),
                onLoad: _onLoad,
                child: GridView.builder(
                    physics:
                    NeverScrollableScrollPhysics(),
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount:
                    data.length,
                    itemBuilder: (context, index) {
                      return _videoDsc(data[index]);
                    }),
              );
            }


            return SafeArea(
              child: MediaQuery.removePadding(
                removeBottom: true,
                removeLeft: true,
                removeRight: true,
                removeTop: true,
                context: context,
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor: baseTheme.home_backgound_color,
                  drawer: _drawer(),
                  appBar: _appBar(),
                  body: Container(
//                    decoration: BoxDecoration(
//                      image: DecorationImage(
//                        fit:BoxFit.fitHeight,
//                        image: AssetImage("assets/image/png/cartoon_paper.png")
//                      )
//                    ),
                    child: snapshot?.data != null?TabBarView(
                        controller: tabController,
                        children: VideoType.values.map((typ) =>
                        snapshot?.data[typ] != null
                            ? _easyRefresh(snapshot.data[typ].data) : Center(
                          child: CircularProgressIndicator(),
                        )
                        ).toList()
                    ):Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }
}

Widget tabBarItem(String name, double fontSize) {
  return Text(name, style: TextStyle(fontSize: fontSize),maxLines: 1,);
}
