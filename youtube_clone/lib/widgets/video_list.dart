import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_clone/models/youtub_model.dart';
import 'package:youtube_clone/screens/video_detail.dart';

class VideoList extends StatelessWidget {
  final List<YoutubeModel> listData;

  const VideoList({Key key, this.listData});
  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    return ListView.separated(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          if (deviceOrientation == Orientation.portrait)
            return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => VideoDetail(
                        detail: listData[index],
                      ),
                    ),
                  );
                },
                child: _buildPortraitList(context, index));
          else if (deviceOrientation == Orientation.landscape)
            return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => VideoDetail(
                        detail: listData[index],
                      ),
                    ),
                  );
                },
                child: _buildLandscapeList(context, index));
        },
        separatorBuilder: (context, index) => Divider(
              height: 0.0,
            ),
        itemCount: listData.length);
  }

  Widget _buildPortraitList(BuildContext context, int index) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(listData[index].thumbnail),
                fit: BoxFit.cover),
          ),
        ),
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.all(5.0),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(listData[index].channelAvatar),
          ),
          title: Padding(
            padding: EdgeInsets.only(bottom: 4.0),
            child: Text(listData[index].title),
          ),
          subtitle: Text(
              '${listData[index].channelTitle} ${listData[index].viewCount} ${listData[index].publishedTime}'),
          trailing: Container(
              margin: EdgeInsets.only(bottom: 25.0),
              child: Icon(Icons.more_vert)),
        )
      ],
    );
  }

  Widget _buildLandscapeList(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .3,
            height: MediaQuery.of(context).size.height * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(listData[index].thumbnail),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListTile(
                        minVerticalPadding: 3,
                        dense: true,
                        contentPadding: EdgeInsets.only(
                          left: 10.0,
                        ),
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            listData[index].title,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            '${listData[index].channelTitle} ${listData[index].viewCount} ${listData[index].publishedTime}',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        trailing: Container(
                            margin: EdgeInsets.only(bottom: 40.0),
                            child: Icon(Icons.more_vert)),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(listData[index].channelAvatar),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
