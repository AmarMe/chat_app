// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:camera/camera.dart';
import 'package:chat_app/screens/cameraview_screen.dart';
import 'package:chat_app/screens/videoview_screen.dart';
import 'package:flutter/material.dart';

late List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key, required this.onImageSend});
  final Function onImageSend;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> cameravalue;
  bool isRecording = false;
  String videopath = "";
  bool flash = false;
  bool iscamerafront = true;
  double cameraTransform = 0;
  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(
      cameras[0],
      ResolutionPreset.medium,
    );
    cameravalue = _cameraController.initialize();
  }

  // To dispose the camera controller
  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameravalue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    width: size.width,
                    height: size.height,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Container(
                          width: 50, child: CameraPreview(_cameraController)),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),

          //Camera bottom bar buttons
          Positioned(
            bottom: 0.0,
            child: Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              flash = !flash;
                            });
                            flash
                                ? _cameraController
                                    .setFlashMode(FlashMode.torch)
                                : _cameraController.setFlashMode(FlashMode.off);
                          },
                          icon: Icon(
                            flash ? Icons.flash_on : Icons.flash_off,
                            color: Colors.white,
                            size: 28,
                          )),
                      GestureDetector(
                        onLongPress: () async {
                          await _cameraController.startVideoRecording();
                          setState(() {
                            isRecording = true;
                          });
                        },
                        onLongPressUp: () async {
                          final XFile xFile =
                              await _cameraController.stopVideoRecording();
                          setState(() {
                            isRecording = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      VideoView(videopath: xFile.path)));
                        },
                        onTap: () {
                          if (!isRecording) {
                            takephoto(context);
                          }
                        },
                        child: isRecording
                            ? const Icon(
                                Icons.radio_button_checked,
                                color: Colors.red,
                                size: 80,
                              )
                            : const Icon(
                                Icons.panorama_fisheye,
                                color: Colors.white,
                                size: 70,
                              ),
                      ),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              iscamerafront = !iscamerafront;
                              cameraTransform = cameraTransform + pi;
                            });
                            int camerapos = iscamerafront ? 0 : 1;
                            _cameraController = CameraController(
                              cameras[camerapos],
                              ResolutionPreset.medium,
                            );
                            cameravalue = _cameraController.initialize();
                          },
                          icon: Transform.rotate(
                            angle: cameraTransform,
                            child: const Icon(
                              Icons.flip_camera_ios,
                              color: Colors.white,
                              size: 28,
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //camera instruction
                  const Text('Hold for video, tap for photo',
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void takephoto(BuildContext context) async {
    XFile file = await _cameraController.takePicture();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CameraView(
                  path: file.path,
                  onImageSend: widget.onImageSend,
                )));
  }
}
