import 'package:flutter/widgets.dart';
import 'package:youtube_clone/models/youtub_model.dart';
import 'package:youtube_clone/widgets/video_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VideoList(
      listData: youtubeData,
    );
  }
}
