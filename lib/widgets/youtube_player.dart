import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Youtube extends StatelessWidget {
  String? url;
   Youtube({Key? key, this.url, double? aspectRatio, bool? showVideoProgressIndicator, MaterialColor? progressIndicatorColor, ProgressBarColors? progressColors,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String youtube  = url ?? "https://www.youtube.com/watch?v=BWdC7wqjlUQ";
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(youtube) ?? "BWdC7wqjlUQ",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
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


