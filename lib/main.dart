import 'package:flutter/material.dart';
import 'package:flutter_demo/videolistitem.dart';
import 'package:flutter_demo/videoresponse.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColorDark: Color(0xFF9b0000),
        primaryColor: Color(0xFFd50000),
        accentColor: Color(0xFFf44336),
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
          child: FutureBuilder<VideoResponse>(
            future: fetchYoutubeVideo(""),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return VideoList(snapshot.data.items);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
              },
          )
      ),
    );
  }
}

Future<VideoResponse> fetchYoutubeVideo(String pageToken) async {
  final String url = "https://www.googleapis.com/youtube/v3/search?key=AIzaSyD6w87SYBHtHUq8y2eyTOHBdLXH28RNWvA&part=snippet&q=kuma+popular+song&chart=mostRecent&maxResults=50&pageToken=$pageToken";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return VideoResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception("Fail to load videos");
  }
}
