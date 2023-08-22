import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SongPlayer extends StatefulWidget {
  late String artWorkUrl;
  late String trackName;
  late String artistName;
  late String previewUrl;
  SongPlayer(
      {required this.artWorkUrl,
        required this.artistName,
        required this.previewUrl,
        required this.trackName,
        super.key});

  @override
  State<SongPlayer> createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
  AudioPlayer songPlayer = AudioPlayer();
  Duration fullDuration = const Duration(seconds: 0);
  Duration currentDuration = const Duration(seconds: 0);

  int elapsed = 0;

  getSongDetails() {
    songPlayer.onDurationChanged.listen((Duration fDuration) {
      setState(() {
        fullDuration = fDuration;
      });
    });
    songPlayer.onPositionChanged.listen((Duration cDuration) {
      setState(() {
        print("this is the current duration $cDuration");
        currentDuration = cDuration;
      });
    });
    songPlayer.onPlayerStateChanged.listen((state) {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getSongDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Image.network(
                  widget.artWorkUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                widget.trackName,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.artistName,
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  children: [
                    Text(
                      currentDuration.inSeconds.toString(),
                      style: const TextStyle(fontSize: 30),
                    ),
                    Expanded(
                      child: Slider(
                          value: (currentDuration.inSeconds <
                              fullDuration.inSeconds)
                              ? (currentDuration.inSeconds / fullDuration.inSeconds)
                              : 0,
                          onChanged: (value) {}),
                    ),
                    Text(fullDuration.inSeconds.toString()),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.no_accounts)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.skip_previous)),
                  IconButton(
                      iconSize: 60,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        songPlayer.play(UrlSource(widget.previewUrl));
                      },
                      icon: const Icon(
                        Icons.play_arrow,
                        // size: 80,
                      )),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.skip_next)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.repeat)),
                ],
              ),
            ],
          ),
        ));
  }
}
