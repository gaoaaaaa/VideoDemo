

import 'package:demoapp/data_model/VideoModel.dart';

class VideoTopic {
    String alias; // 专为暂无购车指标的用户解决
    String ename; // T1507598268958
    String tid; // T1507598268958
    String tname; // 汽车界在线
    String topic_icons; // http://dingyue.ws.126.net/aKe8Gzz9PCAOaDVt7PqbT804Uq7itm8w40EnzaW70xkT11567233462504.png

    VideoTopic({this.alias, this.ename, this.tid, this.tname, this.topic_icons});

    factory VideoTopic.fromJson(Map<String, dynamic> json) {
        return VideoTopic(
            alias: json['alias'],
            ename: json['ename'],
            tid: json['tid'], 
            tname: json['tname'], 
            topic_icons: json['topic_icons']??VideoModel.unFound,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['alias'] = this.alias;
        data['ename'] = this.ename;
        data['tid'] = this.tid;
        data['tname'] = this.tname;
        data['topic_icons'] = this.topic_icons;
        return data;
    }
}