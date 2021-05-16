class YoutubeModel {
  final String title;
  final String description;
  final String thumbnail;
  final String publishedTime;
  final String channelTitle;
  final String channelAvatar;
  final String viewCount;
  final String likeCount;
  final String dislikeCount;
  YoutubeModel(
      {this.title,
      this.description,
      this.channelAvatar,
      this.channelTitle,
      this.dislikeCount,
      this.likeCount,
      this.publishedTime,
      this.thumbnail,
      this.viewCount});
}

List<YoutubeModel> youtubeData = [
  YoutubeModel(
      title:
          "Flutter Crash Course for Beginners 2021 - Build a Flutter App with Google's Flutter & Dart",
      likeCount: '28K',
      dislikeCount: '426',
      channelAvatar:
          'https://yt3.ggpht.com/ytc/AAUvwnhuAGr98acrEv0S1Q3Ikz0giWPmHmM1J3h6pANWCg=s48-c-k-c0x00ffffff-no-rj',
      channelTitle: 'Academind',
      description:
          'Free Flutter Introduction for Beginners: Get Started with Flutter and learn how to build an iOS and Android app with Flutter!',
      publishedTime: '10 Jul 2019',
      thumbnail: 'https://img.youtube.com/vi/x0uinJvhNxI/maxresdefault.jpg',
      viewCount: '1,302,993'),
  YoutubeModel(
      title:
          'FilterCopy | Every Dog Lover | Ft. Barkha Singh and Viraj Ghelani',
      likeCount: '197K',
      dislikeCount: '4.3K',
      channelAvatar:
          'https://yt3.ggpht.com/ytc/AAUvwngnxSQTOBBNf-lTyDniAK7p11Ev4UgactKLUYVfjQ=s48-c-k-c0x00ffffff-no-rj',
      channelTitle: 'FilterCopy',
      description:
          'This video was made in collaboration with our sister app, Loco. Loco is India\'s first live quiz ',
      publishedTime: '6 Apr 2018',
      thumbnail: "https://img.youtube.com/vi/y2OiVBFKuSI/maxresdefault.jpg",
      viewCount: '7,208,491'),
  YoutubeModel(
      title: "Arrangement Kalyanam | Karikku | Comedy",
      likeCount: '738K',
      dislikeCount: '196',
      channelAvatar:
          'https://yt3.ggpht.com/ytc/AAUvwnjipJKbPXIbI0KeW_o49gCuiHLaJZVdHrPn1WWeBw=s48-c-k-c0x00ffffff-no-rj',
      channelTitle: 'Karikku',
      description:
          'Free Flutter Introduction for Beginners: Get Started with Flutter and learn how to build an iOS and Android app with Flutter!',
      publishedTime: '21 Oct 2019',
      thumbnail: 'https://img.youtube.com/vi/jfztJQKy_Zw/maxresdefault.jpg',
      viewCount: '27,910,657'),
  YoutubeModel(
      title:
          "Flutter Crash Course for Beginners - Build a Flutter App with Google's Flutter & Dart",
      likeCount: '28K',
      dislikeCount: '426',
      channelAvatar:
          'https://yt3.ggpht.com/ytc/AAUvwnhuAGr98acrEv0S1Q3Ikz0giWPmHmM1J3h6pANWCg=s48-c-k-c0x00ffffff-no-rj',
      channelTitle: ' Academind',
      description:
          'Free Flutter Introduction for Beginners: Get Started with Flutter and learn how to build an iOS and Android app with Flutter!',
      publishedTime: '10 Jul 2019',
      thumbnail: 'https://img.youtube.com/vi/x0uinJvhNxI/maxresdefault.jpg',
      viewCount: '1,302,993'),
];
