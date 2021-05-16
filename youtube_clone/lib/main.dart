import 'package:flutter/material.dart';
import 'package:youtube_clone/youtube_main.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Youtube UI',
      home: YoutubeMain(),
    );
  }
}
