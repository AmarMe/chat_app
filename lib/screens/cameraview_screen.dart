import 'dart:io';

import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key, required this.path, required this.onImageSend});
  final String path;
  final Function onImageSend;
  static TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.crop_rotate,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.emoji_emotions_outlined,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.title,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
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
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
            ),

            //add caption text field
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                color: Colors.black38,
                child: TextFormField(
                  controller: _controller,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  maxLines: 5,
                  minLines: 1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                        size: 35,
                      ),
                      hintText: 'Add captions...',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 18),
                      suffixIcon: InkWell(
                        onTap: () {
                          onImageSend(path, _controller.text.trim());
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.teal,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
