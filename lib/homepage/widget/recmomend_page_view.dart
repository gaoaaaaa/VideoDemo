import 'package:demoapp/data_model/VideoModel.dart';
import 'package:demoapp/data_model/detail/recommendModel.dart';
import 'package:demoapp/homepage/widget/video_recommend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
class RecommendPageView extends StatefulWidget {
  RecommendData recommendData;

  RecommendPageView(this.recommendData);

  @override
  _RecommendPageViewState createState() => _RecommendPageViewState();
}

class _RecommendPageViewState extends State<RecommendPageView> {
  PageController pageController;
  VideoModel jokerModel;
  VideoModel boutiqueModel;
  @override
  void initState() {
    // TODO: implement initState
    pageController=new PageController();
    jokerModel=widget.recommendData.joker;
    boutiqueModel=widget.recommendData.boutique;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return             Container(
      height: 500,
//      color: Colors.deepOrangeAccent,
      width: double.infinity,
      child: PageView(
        controller: pageController,
        onPageChanged: (index){
//                  pageController.animateToPage(index, duration: Duration(microseconds: 500), curve: null);
          pageController.jumpToPage(index);
        },
        children: <Widget>[
          ListView.builder(
            itemCount: boutiqueModel.data.length,
            itemBuilder: (context,index){
              return VideoRecommend(boutiqueModel.data[index]);
            },
          ),
          ListView.builder(
            itemCount: jokerModel.data.length,
            itemBuilder: (context,index){
              return VideoRecommend(jokerModel.data[index]);
            },
          )
        ],
      ),
    );
  }
}
