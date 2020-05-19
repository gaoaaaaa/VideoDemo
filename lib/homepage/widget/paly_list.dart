import 'package:flutter/material.dart';
class PlayList extends StatefulWidget {
  Color backgroundColor;
  Color contentColor;

  PlayList(this.backgroundColor, this.contentColor);

  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: widget.backgroundColor,
      child: ListView(
        children: List.generate(20, (index){
          return Text("未来的播放列表",style: TextStyle(fontSize: 10,color: widget.contentColor),);
        }),
      ),
    );
  }
}
