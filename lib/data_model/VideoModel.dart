

import 'Data.dart';

class VideoModel {
    static String unFound="https://preview.qiantucdn.com/58pic/33/65/41/80458PIC82D24vcSb0Uve_PIC2018.png!qt324new_nowater";

    List<Data> data;
    int code; // 1
    String msg; // success

    VideoModel({this.data, this.code, this.msg});

    factory VideoModel.fromJson(Map<String, dynamic> json) {
        return VideoModel(
            data: json['data'] != null ? (json['data'] as List).map((i) => Data.fromJson(i)).toList() : null, 
            code: json['code'], 
            msg: json['msg'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['code'] = this.code;
        data['msg'] = this.msg;
        if (this.data != null) {
            data['data'] = this.data.map((v) => v.toJson()).toList();
        }
        return data;
    }
}