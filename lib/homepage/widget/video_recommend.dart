
import 'package:cached_network_image/cached_network_image.dart';
import 'package:demoapp/data_model/Data.dart';
import 'package:demoapp/data_model/VideoModel.dart';
import 'package:demoapp/page/detail_page/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class VideoRecommend extends StatelessWidget {
  Data data;

  VideoRecommend(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
      ),
      margin: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
        Container(
          width: 100,
height: 100,
child: Image.network(data.videoTopic?.topic_icons??"https://preview.qiantucdn.com/58pic/33/65/41/80458PIC82D24vcSb0Uve_PIC2018.png!qt324new_nowater"),
//        decoration:ShapeDecoration(
//            image: DecorationImage(
//              fit: BoxFit.fill,
//                image: NetworkImage(
//                  data.videoTopic?.topic_icons??"https://preview.qiantucdn.com/58pic/33/65/41/80458PIC82D24vcSb0Uve_PIC2018.png!qt324new_nowater",
//                )
//            ),
//            shape: RoundedRectangleBorder()
//        ),
//      child: Row(
//        children: <Widget>[
//          CachedNetworkImage(
//            imageUrl: data.videoTopic?.topic_icons??"https://preview.qiantucdn.com/58pic/33/65/41/80458PIC82D24vcSb0Uve_PIC2018.png!qt324new_nowater",
//          ),
//        ],
//      ),
      ),
          Expanded(
            child: InkWell(
              onTap: (){
//                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context){
                      return data.vid==null?null:DetailPage(data.vid);
                    }
                ));

//                Navigator.push(context, MaterialPageRoute(
//                  builder: (context){
//                    return data.vid==null?null:DetailPage(data.vid);
//                  }
//                ));
//                Navigator.popAndPushNamed(context, );
              },
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: data?.cover??"https://preview.qiantucdn.com/58pic/33/65/41/80458PIC82D24vcSb0Uve_PIC2018.png!qt324new_nowater",
              ),
            ),
          )
        ],
      ),
    );
  }
}
