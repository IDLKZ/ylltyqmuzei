import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:welcome/providers/music_manager.dart';



class AudioPlayer extends StatefulWidget {
   late String? url;
   AudioPlayer({Key? key, required this.url}) : super(key: key);

  @override
  _AudioPlayerState createState(){
    return _AudioPlayerState(url: this.url);
  }
}

class _AudioPlayerState extends State<AudioPlayer> {
   String? url;
  _AudioPlayerState({this.url});
  late final PageManager _pageManager;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          ValueListenableBuilder<ProgressBarState>(
            valueListenable: _pageManager.progressNotifier,
            builder: (_, value, __) {
              return ProgressBar(
                timeLabelTextStyle: TextStyle(fontSize:16,color: Colors.white),
                baseBarColor: Colors.grey,
                progressBarColor: Colors.redAccent,
                bufferedBarColor: Colors.white,
                thumbColor: Colors.redAccent,
                thumbGlowColor: Colors.redAccent,
                progress: value.current,
                buffered: value.buffered,
                total: value.total,
                onSeek: _pageManager.seek,
              );
            },
          ),
          ValueListenableBuilder<ButtonState>(
            valueListenable: _pageManager.buttonNotifier,
            builder: (_, value, __) {
              switch (value) {
                case ButtonState.loading:
                  return Container(
                    width: 32.0,
                    height: 32.0,
                    child: const CircularProgressIndicator(),
                  );
                case ButtonState.paused:
                  return CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.play_arrow,color: Colors.redAccent,),
                      iconSize: 32.0,
                      onPressed: _pageManager.play,
                    ),
                  );
                case ButtonState.playing:
                  return CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: IconButton(
                      icon: const Icon(Icons.pause,color: Colors.blueAccent,),
                      iconSize: 32.0,
                      onPressed: _pageManager.pause,
                    ),
                  );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageManager = new PageManager(musicUrl: this.url);
  }
  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
  }
}


