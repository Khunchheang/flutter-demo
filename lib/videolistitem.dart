import 'package:flutter/material.dart';
import 'package:flutter_demo/videoresponse.dart';

class VideoList extends StatelessWidget {
  final List<ItemsItem> videos;

  VideoList(this.videos);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: _getItemUI,
      padding: EdgeInsets.all(8.0),
    );
  }

  Widget _getItemUI(BuildContext context, int index) {
    return new Card(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.all(8.0),
            child: new Image.network(videos[index].snippet.thumbnails.medium.url, height: 210.0, fit: BoxFit.cover),
          ),
          new Container(
            margin: EdgeInsets.only(left:8.0,right: 8.0,bottom: 8.0),
            child: new Text(videos[index].snippet.title),
          )
        ],
      ),
    );
  }
}
