import 'package:chat_app/screens/camera_screen.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget {
  CameraPage({
    super.key,
  });
  final Function onImageSend = () {};

  @override
  Widget build(BuildContext context) {
    return CameraScreen(
      onImageSend: onImageSend,
    );
  }
}
