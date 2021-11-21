import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Youtube extends StatefulWidget {
  String? url;
   Youtube({Key? key,this.url});

  @override
  _YoutubeState createState() => _YoutubeState(url: this.url);
}

class _YoutubeState extends State<Youtube> {
  String? url;
  _YoutubeState({Key? key, this.url, double? aspectRatio, bool? showVideoProgressIndicator, MaterialColor? progressIndicatorColor, ProgressBarColors? progressColors,});
  late YoutubePlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String youtube  = url ?? "https://www.youtube.com/watch?v=BWdC7wqjlUQ";
     _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(youtube) ?? "BWdC7wqjlUQ",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Container(
        child:  YoutubePlayer(
          aspectRatio: 1/1,
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),)
    );
  }

}



