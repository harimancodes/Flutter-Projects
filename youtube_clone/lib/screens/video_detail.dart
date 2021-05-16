import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/models/youtub_model.dart';
import 'package:youtube_clone/widgets/video_list.dart';

class VideoDetail extends StatefulWidget {
  final YoutubeModel detail;

  VideoDetail({Key key, this.detail});
  @override
  State<StatefulWidget> createState() => VideoDetailState();
}

class VideoDetailState extends State<VideoDetail> {
  @override
  Widget build(BuildContext context) {
    final orientaion = MediaQuery.of(context).orientation;
    final List<Widget> _layouts = [
      _videoInfo(),
      _channelInfo(),
      _upNext(),
      VideoList(
        listData: youtubeData,
      ),
    ];
    if (orientaion == Orientation.landscape) _layouts.clear();

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Column(
          children: [
            _buildVideoPlayer(context),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: _layouts,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlayer(BuildContext context) {
    return Container(
      // margin: MediaQuery.of(context).orientation == Orientation.portrait
      //     ? EdgeInsets.only(top: 30)
      //     : null,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height * .283
          : MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.detail.thumbnail),
        ),
      ),
    );
  }

  Widget _videoInfo() {
    return Container(
      child: Column(
        children: [
          ListTile(
            dense: false,
            title: Text(widget.detail.title),
            subtitle: Text(widget.detail.viewCount),
            trailing: Icon(Icons.more_vert),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildButtonColumn(Icons.thumb_up, widget.detail.likeCount),
                _buildButtonColumn(
                    Icons.thumb_down, widget.detail.dislikeCount),
                _buildButtonColumn(Icons.share, 'Share'),
                _buildButtonColumn(Icons.cloud_download, 'Download'),
                _buildButtonColumn(Icons.playlist_add, 'Save'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonColumn(IconData icon, String text) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Icon(
            icon,
            color: Colors.grey[700],
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _channelInfo() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(widget.detail.channelAvatar),
              ),
              title: Text(widget.detail.channelTitle),
              subtitle: Text('15,000 subscribers'),
              trailing: FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.play_circle_fill),
                label: Text('SUBSCRIBE'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _upNext() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Up next'),
          Switch(
            onChanged: (v) {},
            value: true,
          )
        ],
      ),
    );
  }
}
