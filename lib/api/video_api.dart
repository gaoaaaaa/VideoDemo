
import 'dart:math';

import 'package:demoapp/data_model/VideoModel.dart';
import 'package:demoapp/data_model/detail/recommendModel.dart';
import 'package:dio/dio.dart';

enum VideoType
{
boutique,
  joker,
  girl,
  sports,
}
class VideoApi
{
static String url_head="https://api.isoyu.com/api/Video/";
static String video_content_index="video_type/";
static String video_detail_index="video_detail/";

static Future  getVideoContent(VideoType videoType,int page)
async{
  Dio dio =new Dio();
  dio.options.responseType=ResponseType.json;
   Response response=await dio.get(url_head+video_content_index+"?type="+videoType.index.toString()+"&page="+page.toString());
   return response.data;
}
static Future<Map<VideoType,VideoModel>> getHomePage()
async{
  Map<VideoType,VideoModel> map=new Map();
for(var temp in VideoType.values)
{
  map[temp]=VideoModel.fromJson(await VideoApi.getVideoContent(temp, 0));
}
return map;

}
static Future<RecommendData>  getRecommend(int rand)
async{
  RecommendData data=new RecommendData();
  data.boutique=VideoModel.fromJson(await getVideoContent(VideoType.boutique, rand));
  data.joker=VideoModel.fromJson(await getVideoContent(VideoType.joker, rand));
  return data;
}
static Future  getVideoDetail(String vid)
async{
  Dio dio =new Dio();
  dio.options.responseType=ResponseType.json;
  Response response=await dio.get(url_head+video_detail_index+"?vid=$vid");
  return response.data;
}
}