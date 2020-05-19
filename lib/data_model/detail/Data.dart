

class Data {
    String cover; // http://vimg3.ws.126.net/videolib2_snapshot/2018/3/5/2/EDBHR5852_3.jpg
    String description;
    int hits; // 0
    int length; // 12
    Object m3u8Hd_url; // null
    String m3u8_url; // http://flv0.bn.netease.com/bb2af7020cf847310373f66fa64a87422cb7ccdb16f435aab7e2fa29ef597139340ee4a17208a112c84d684d1d356d609c06bd2fdaf7882275dfdf7508387151ed9c321795aa307be3feab5d9b41974aca471c93e140f56a5d6efa999ee0c5aa50f98d5046d4d457e16df3f40a4f8798fad6e4d1bdb24314.mp4
    Object mp4Hd_url; // null
    String mp4_url; // https://flv2.bn.netease.com/bb2af7020cf847310373f66fa64a87422cb7ccdb16f435aab7e2fa29ef597139340ee4a17208a112c84d684d1d356d609c06bd2fdaf7882275dfdf7508387151ed9c321795aa307be3feab5d9b41974aca471c93e140f56a5d6efa999ee0c5aa50f98d5046d4d457e16df3f40a4f8798fad6e4d1bdb24314.mp4
    int playersize; // 0
    String ptime; // 2018-03-09 17:11:18
    String replyBoard; // video_bbs
    int replyCount; // 0
    String replyid; // DBHR5JBA008535RB
    String source; // 网易
    List<Object> tags;
    String title; // 请问糗友们，这是我的责任吗？
    String topicid; // 1000
    String vid; // VDBHR5JBA
    String videotype; // 十秒你就笑
    String vurl; // http://v.163.com/paike/VCQVAE6KD/VDBHR5JBA.html

    Data({this.cover, this.description, this.hits, this.length, this.m3u8Hd_url, this.m3u8_url, this.mp4Hd_url, this.mp4_url, this.playersize, this.ptime, this.replyBoard, this.replyCount, this.replyid, this.source, this.tags, this.title, this.topicid, this.vid, this.videotype, this.vurl});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            cover: json['cover'], 
            description: json['description'], 
            hits: json['hits'], 
            length: json['length'], 
            m3u8Hd_url: json['m3u8Hd_url'] , 
            m3u8_url: json['m3u8_url'], 
            mp4Hd_url: json['mp4Hd_url'] , 
            mp4_url: json['mp4_url'], 
            playersize: json['playersize'], 
            ptime: json['ptime'], 
            replyBoard: json['replyBoard'], 
            replyCount: json['replyCount'], 
            replyid: json['replyid'], 
            source: json['source'], 
            tags: json['tags'] != null ? (json['tags'] as List).map((i) => i).toList() : null,
            title: json['title'], 
            topicid: json['topicid'], 
            vid: json['vid'], 
            videotype: json['videotype'], 
            vurl: json['vurl'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['cover'] = this.cover;
        data['description'] = this.description;
        data['hits'] = this.hits;
        data['length'] = this.length;
        data['m3u8_url'] = this.m3u8_url;
        data['mp4_url'] = this.mp4_url;
        data['playersize'] = this.playersize;
        data['ptime'] = this.ptime;
        data['replyBoard'] = this.replyBoard;
        data['replyCount'] = this.replyCount;
        data['replyid'] = this.replyid;
        data['source'] = this.source;
        data['title'] = this.title;
        data['topicid'] = this.topicid;
        data['vid'] = this.vid;
        data['videotype'] = this.videotype;
        data['vurl'] = this.vurl;
        if (this.m3u8Hd_url != null) {
            data['m3u8Hd_url'] = this.m3u8Hd_url;
        }
        if (this.mp4Hd_url != null) {
            data['mp4Hd_url'] = this.mp4Hd_url;
        }
        if (this.tags != null) {
            data['tags'] = this.tags.map((v) => v).toList();
        }
        return data;
    }
}