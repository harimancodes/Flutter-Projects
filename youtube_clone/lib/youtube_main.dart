import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:youtube_clone/screens/home.dart';

class YoutubeMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _YoutubeState();
}

class _YoutubeState extends State<YoutubeMain> {
  int _currentIndex = 0;
  _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreen(),
      Text('Explore'),
      Text('Add'),
      Text('Subscripiton'),
      Text('Library'),
    ];
    return Scaffold(
      body: screens[_currentIndex],
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Row(
          children: [
            Image.asset(
              'images/logo.png',
              height: 22.0,
              width: 100.0,
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        currentIndex: _currentIndex,
        onTap: _onTapped,
        items: [
          BottomNavigationBarItem(
            title: Text(
              'Home',
              style: TextStyle(fontSize: 12),
            ),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text(
              'Explore',
              style: TextStyle(fontSize: 12),
            ),
            icon: Icon(Icons.explore),
          ),
          BottomNavigationBarItem(
            title: Container(),
            icon: Icon(
              Icons.add_circle_outline_outlined,
              size: 42,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              'Subscriptions',
              style: TextStyle(fontSize: 12),
            ),
            icon: Icon(Icons.subscriptions_outlined),
          ),
          BottomNavigationBarItem(
            title: Text(
              'Library',
              style: TextStyle(fontSize: 12),
            ),
            icon: Icon(Icons.video_collection),
          ),
        ],
      ),
    );
  }
}
