

import '../Data.dart';

class VideoDetailModel {
    Data data;
    int code; // 1
    String msg; // success

    VideoDetailModel({this.data, this.code, this.msg});

    factory VideoDetailModel.fromJson(Map<String, dynamic> json) {
        return VideoDetailModel(
            data: json['data'] != null ? Data.fromJson(json['data']) : null,
            code: json['code'], 
            msg: json['msg'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['code'] = this.code;
        data['msg'] = this.msg;
        if (this.data != null) {
            data['data'] = this.data.toJson();
        }
        return data;
    }
}