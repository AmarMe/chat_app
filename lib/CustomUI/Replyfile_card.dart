import 'dart:io';

import 'package:flutter/material.dart';

class ReplyfileCard extends StatelessWidget {
  const ReplyfileCard(
      {super.key,
      required this.path,
      required this.message,
      required this.time});
  final String path;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.6,
          width: MediaQuery.of(context).size.width / 1.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Card(
            margin: EdgeInsets.all(2.8),
            color: Colors.white,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.network(
                    "http://192.168.43.54:5000/uploads/$path",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                message.length > 0
                    ? Container(
                        height: 40,
                        padding: EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          message,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              time.toString().substring(11, 16),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.done_all,
                              size: 14,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
