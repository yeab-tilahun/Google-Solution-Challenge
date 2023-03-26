import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeSummaryPage extends StatefulWidget {
  final String videoUrl;

  YouTubeSummaryPage({required this.videoUrl});

  @override
  _YouTubeSummaryPageState createState() => _YouTubeSummaryPageState();
}

class _YouTubeSummaryPageState extends State<YouTubeSummaryPage> {
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(96, 125, 139, 1),
        title: Text('YouTube Summary'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              // showOptions(context);
            },
            child: Container(
              width: 50,
              height: 50,
              child: CircleAvatar(
                backgroundImage: AssetImage('asset/sidePortriat.jpg'),
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            child: YoutubePlayer(
              controller: _youtubePlayerController,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.amber,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Video Summary:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Text(
                'Insert summary text here',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
