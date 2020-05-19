

import 'package:demoapp/data_model/VideoModel.dart';
import 'package:flutter/cupertino.dart';

import 'VideoTopic.dart';

class Data {
    int commentStatus; // 1
    String cover; // http://vimg2.ws.126.net/image/snapshot/2018/9/O/E/VXR5A7HOE.jpg
    String description; // 拜仁球员接连受伤，欧冠名单都要凑不齐了
    int length; // 73
    String m3u8Hd_url; // null
    String m3u8_url; // http://flv.bn.netease.com/bb2af7020cf847316616a36c1408e38de1e71a20476d635c34ac29798237fb3c597ccaab8e84eacb1807e8febf61fe31b46efcd6ce0bb4627a6f8ed3b9bb8d48c192e9bc4f6ee3fb21de3e79b098f82a0459bdd810c8000a26ae4f1e615605e86af0f66061e12b871f38cdc64e522836.m3u8
    String mp4Hd_url; // null
    String mp4_url; // http://flv3.bn.netease.com/bb2af7020cf847316616a36c1408e38d2956a06a4f02047db56be56c8fcc608b76cfffe731b37557ce27ff49c4358ff89aa8bb242d8ad1ee38d346b9f7cf031ba5166d78ad5016316d3b79f7e9eb77b9c1be21401951aea303f7765ada20bc362448bc5e02e683397459cf25b8fb27ae5e7cbc019d97fd76.mp4
    int playCount; // 0
    int playersize; // 1
    String ptime; // 2018-09-19 16:35:33
    String replyBoard; // video_bbs
    int replyCount; // 0
    String replyid; // XR5A7HO9050835RB
    String sectiontitle;
    int sizeHD; // 0
    int sizeSD; // 3175
    int sizeSHD; // 0
    String title; // 拜仁球员接连受伤，欧冠名单都要凑不齐了
    String topicDesc; // 分享一个国家或民族的历史、地理、风土人情、传统习俗、生活方式、文学艺术、行为规范、思维方式、价值观念等
    String topicImg; // http://vimg3.ws.126.net/image/snapshot/2017/12/D/U/VD3OCMCDU.jpg
    String topicName; // 秋雨之美
    String topicSid; // VD3OCMCDS
    String vid; // VXR5A7HO9
    VideoTopic videoTopic;
    String videosource; // 新媒体
    int votecount; // 0

    Data({this.commentStatus, this.cover, this.description, this.length, this.m3u8Hd_url, this.m3u8_url, this.mp4Hd_url, this.mp4_url, this.playCount, this.playersize, this.ptime, this.replyBoard, this.replyCount, this.replyid, this.sectiontitle, this.sizeHD, this.sizeSD, this.sizeSHD, this.title, this.topicDesc, this.topicImg, this.topicName, this.topicSid, this.vid, this.videoTopic, this.videosource, this.votecount});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            commentStatus: json['commentStatus'], 
            cover: json['cover']??VideoModel.unFound,
            description: json['description'], 
            length: json['length'], 
            m3u8Hd_url: json['m3u8Hd_url'] , 
            m3u8_url: json['m3u8_url'], 
            mp4Hd_url: json['mp4Hd_url'] , 
            mp4_url: json['mp4_url'], 
            playCount: json['playCount'], 
            playersize: json['playersize'], 
            ptime: json['ptime'], 
            replyBoard: json['replyBoard'], 
            replyCount: json['replyCount'], 
            replyid: json['replyid'], 
            sectiontitle: json['sectiontitle'], 
            sizeHD: json['sizeHD'], 
            sizeSD: json['sizeSD'], 
            sizeSHD: json['sizeSHD'], 
            title: json['title'], 
            topicDesc: json['topicDesc'], 
            topicImg: json['topicImg']??VideoModel.unFound,
            topicName: json['topicName'], 
            topicSid: json['topicSid'], 
            vid: json['vid'], 
            videoTopic: json['videoTopic']==null||json['videoTopic'] is List ?null:VideoTopic.fromJson(json['videoTopic']),
            videosource: json['videosource'], 
            votecount: json['votecount'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['commentStatus'] = this.commentStatus;
        data['cover'] = this.cover;
        data['description'] = this.description;
        data['length'] = this.length;
        data['m3u8_url'] = this.m3u8_url;
        data['mp4_url'] = this.mp4_url;
        data['playCount'] = this.playCount;
        data['playersize'] = this.playersize;
        data['ptime'] = this.ptime;
        data['replyBoard'] = this.replyBoard;
        data['replyCount'] = this.replyCount;
        data['replyid'] = this.replyid;
        data['sectiontitle'] = this.sectiontitle;
        data['sizeHD'] = this.sizeHD;
        data['sizeSD'] = this.sizeSD;
        data['sizeSHD'] = this.sizeSHD;
        data['title'] = this.title;
        data['topicDesc'] = this.topicDesc;
        data['topicImg'] = this.topicImg;
        data['topicName'] = this.topicName;
        data['topicSid'] = this.topicSid;
        data['vid'] = this.vid;
        data['videosource'] = this.videosource;
        data['votecount'] = this.votecount;
        if (this.m3u8Hd_url != null) {
            data['m3u8Hd_url'] = this.m3u8Hd_url;
        }
        if (this.mp4Hd_url != null) {
            data['mp4Hd_url'] = this.mp4Hd_url;
        }
        if (this.videoTopic != null) {
            data['videoTopic'] = this.videoTopic.toJson();
        }
        return data;
    }
}