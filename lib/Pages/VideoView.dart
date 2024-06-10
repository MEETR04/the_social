import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key, required this.videoPath});

  final String videoPath;

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  void initializeVideoPlayer() {
    videoPlayerController = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        actions: const [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.crop,
                color: Colors.white,
              )),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.emoji_emotions_outlined,
                color: Colors.white,
              )),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.title,
                color: Colors.white,
              )),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              )),
        ],
      ),
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Stack(
          children: [
            SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height - 180,
                child: Transform.rotate(
                  angle: pi / 2,
                  child: videoPlayerController.value.isInitialized
                      ? AspectRatio(
                    aspectRatio: videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(videoPlayerController),
                  )
                      : Container(),
                )),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    minLines: 1,
                    maxLines: 6,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Add Caption...",
                        prefixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.add_photo_alternate_rounded,
                              color: Colors.white,
                              size: 35,
                            )),
                        suffixIcon: CircleAvatar(
                          backgroundColor: Color(0xFF075E54),
                          child: IconButton(
                            onPressed: null,
                            icon: Icon(Icons.send, color: Colors.white),
                          ),
                        ),
                        hintStyle:
                        TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      videoPlayerController.value.isPlaying
                          ? videoPlayerController.pause()
                          : videoPlayerController.play();
                    });
                  },
                  child: videoPlayerController.value.isPlaying
                      ? const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black38,
                      child: Icon(
                        Icons.pause,
                        color: Colors.white,
                        size: 40,
                      ))
                      : CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black38,
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 40,
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
