import 'package:demoapp/data_model/detail/VideoDetailModel.dart';
import 'package:demoapp/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
class VideoStack extends StatefulWidget {
  VideoDetailModel detailModel;
  VideoStack(this.detailModel);

  @override
  _VideoStackState createState() => _VideoStackState();
}

class _VideoStackState extends State<VideoStack> {
  VideoPlayerController videoPlayerController;
  bool progressOffStage=false;
  bool videoControllerOffStage=false;
  IconData playIcon;


@override
  void initState() {
    playIcon=Icons.play_circle_outline;
    // TODO: implement initState
  videoPlayerController=new VideoPlayerController.network(widget.detailModel.data.mp4_url)..initialize().then((value){
    videoPlayerController.addListener((){
      if(videoPlayerController.value.position==videoPlayerController.value.duration)
      {
        videoPlayerController
          ..seekTo(Duration(seconds: 0))
          ..pause()
        ;
        if(videoControllerOffStage==true)
          {
            videoControllerOffStage=false;
            setState(() {

            });
          }
      }
    });
//
    if(videoPlayerController.value.duration==videoPlayerController.value.position)
    {
      videoPlayerController.seekTo(Duration(seconds: 0));
    }
    print(videoPlayerController.value.duration.toString());
    setState(() {
    });
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

   return Consumer<ThemeProvider>(
     builder: (context,provider,child,){
       var baseTheme=provider.baseTheme;
       _controller()
       {
         videoPlayerController.value.isPlaying?videoPlayerController.pause().then((value){
           videoControllerOffStage=false;
           playIcon=Icons.play_circle_outline;
           setState(() {

           });
         }):videoPlayerController.play().then((value){
           videoControllerOffStage=true;
           playIcon=Icons.pause;
           setState(() {

           });
         });
       }

       videoController(Color iconColor)
       {
         return Container(
           child: Column(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Expanded(
                 child: Offstage(
                   offstage: videoControllerOffStage,
                   child: Align(
                     alignment: Alignment.bottomCenter,
                     child: IconButton(
                       iconSize: 50,
                       icon: Icon(playIcon,color: baseTheme.video_icon_color,),
                       onPressed: (){
                         _controller();
                       },
                     ),
                   ),
                 ),
               ),
               Expanded(
                 child: Offstage(
                   offstage: progressOffStage,
                   child: Align(
                       alignment: Alignment.bottomCenter,
                       child: VideoProgressIndicator(
                         videoPlayerController,
                         allowScrubbing: true,
                         colors:VideoProgressColors(
                             playedColor: baseTheme.video_progress_played_color,
                             backgroundColor: baseTheme.video_progress_background_color
                         ) ,

                       )),
                 ),
               ),
             ],
           ),
         );
       }
       return Container(
         decoration: BoxDecoration(
             border: Border.all(width: 2,color: Colors.lightBlue)
         ),
         child: Column(
           children: <Widget>[
             AspectRatio(
               aspectRatio: 9/14,
//     height: 600,
               child: Stack(
                 children: <Widget>[
                   GestureDetector(
                       onDoubleTap: (){
                         _controller();
                       },
                       onTap: (){
                         videoControllerOffStage==true?videoControllerOffStage=false:videoControllerOffStage=true;
                         setState(() {

                         });
                       },
                       child: VideoPlayer(videoPlayerController)
                   ),
                   videoController(Colors.black),
                 ],
               ),
             ),
             Container(
                 height: 50,
                 child: Icon(Icons.drag_handle))
           ],
         ),
       );
     },
   );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    videoPlayerController.dispose();
    super.dispose();
  }
}
