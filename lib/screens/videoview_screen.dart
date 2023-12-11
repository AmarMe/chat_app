import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  VideoView({super.key, required this.videopath});
  // final File videoFile;
  final String videopath;

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  VideoPlayerController? _controller;
  bool startedPlaying = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.file(File(widget.path));

  //   // ..initialize().then((_) {
  //   //   // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //   //   setState(() {});
  //   // });
  // }

  @override
  void initState() {
    super.initState();
    // setState(() {
    //   _controller = VideoPlayerController.file(widget.videoFile);
    // });
    // _controller!.initialize();
    // _controller!.play();
    // _controller!.setVolume(2);
    // _controller!.setLooping(true);
    _controller = VideoPlayerController.file(File(widget.videopath))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        _controller!.setVolume(6);
        // _controller!.setLooping(true);
        // _controller!.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  // Future<bool> started() async {
  //   await _controller.initialize();
  //   await _controller.play();
  //   startedPlaying = true;
  //   return true;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.crop_rotate,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.emoji_emotions_outlined,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.title,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                size: 27,
              )),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            //       SizedBox(
            //         height: MediaQuery.of(context).size.height,
            //         width: MediaQuery.of(context).size.width,
            //         child: VideoPlayer(_controller!),
            //       ),

            // FutureBuilder(
            //     future: _initvideoplayer(),
            //     builder: (context, state) {
            //       if (state.connectionState == ConnectionState.waiting) {
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       } else {
            //         return VideoPlayer(_controller);
            //       }
            //     }),

            // Center(
            //   child: FutureBuilder<bool>(
            //     future: started(),
            //     builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            //       if (snapshot.data ?? false) {
            //         return AspectRatio(
            //           aspectRatio: _controller.value.aspectRatio,
            //           child: VideoPlayer(_controller),
            //         );
            //       } else {
            //         return const Text('waiting for video to load');
            //       }
            //     },
            //   ),
            // ),

            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: _controller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    )
                  : Container(),
            ),

            //add caption text field
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                color: Colors.black38,
                child: TextFormField(
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  maxLines: 5,
                  minLines: 1,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                        size: 35,
                      ),
                      hintText: 'Add captions...',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 18),
                      suffixIcon: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.teal,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 25,
                        ),
                      )),
                ),
              ),
            ),

            // play or pause button
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _controller!.value.isPlaying
                        ? _controller!.pause()
                        : _controller!.play();
                  });
                },
                child: _controller!.value.isPlaying
                    ? const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black38,
                        child: Icon(
                          Icons.pause,
                          size: 50,
                          color: Colors.white,
                        ))
                    : const CircleAvatar(
                        backgroundColor: Colors.black38,
                        radius: 30,
                        child: Icon(
                          Icons.play_arrow,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
