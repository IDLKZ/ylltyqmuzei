import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:welcome/constants/constants.dart';
import 'package:welcome/providers/music_manager.dart';



class AudioPlayer extends StatefulWidget {
   late String? url;
   Color? color;
   Color? progressBar;
   AudioPlayer({Key? key, required this.url, this.color = Colors.transparent, this.progressBar = Colors.white}) : super(key: key);

  @override
  _AudioPlayerState createState(){
    return _AudioPlayerState(url: url, color: color, progressBar: progressBar);
  }
}

class _AudioPlayerState extends State<AudioPlayer> {
   String? url;
   Color? color = Colors.transparent;
   Color? progressBar = Colors.white;
  _AudioPlayerState({this.url, this.color = Colors.transparent, this.progressBar = Colors.white});
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
                timeLabelTextStyle: const TextStyle(fontSize:16,color: Constants.kMainColor),
                baseBarColor: Colors.grey,
                progressBarColor: progressBar,
                bufferedBarColor: Constants.kMainColor,
                thumbColor: progressBar,
                thumbGlowColor: progressBar,
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
                  return GestureDetector(
                    onTap: _pageManager.play,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: const AssetImage('assets/images/play-btn.png'),
                      backgroundColor: color,
                      // child: IconButton(
                      //   icon: const Icon(Icons.play_arrow,color: Constants.kMainColor,),
                      //   iconSize: 44.0,
                      //   onPressed: _pageManager.play,
                      // ),
                    ),
                  );
                case ButtonState.playing:
                  return GestureDetector(
                    onTap: _pageManager.pause,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: const AssetImage('assets/images/pause-btn.png'),
                      backgroundColor: color,
                      // child: IconButton(
                      //   icon: const Icon(Icons.play_arrow,color: Constants.kMainColor,),
                      //   iconSize: 44.0,
                      //   onPressed: _pageManager.play,
                      // ),
                    ),
                  );
                  return CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: IconButton(
                      icon: const Icon(Icons.pause,color: Constants.kMainColor,),
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
    _pageManager = PageManager(musicUrl: url);
  }
  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
  }
}


