import 'package:chat_app/model/chatmodel.dart';
import 'package:flutter/material.dart';

class SelectedAvatar extends StatelessWidget {
  const SelectedAvatar({super.key, required this.contact});
  final Chatmodel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 24,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
                backgroundColor: Colors.blueGrey[200],
              ),

              //tick mark

              const Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 12,
                  child: Icon(
                    Icons.clear,
                    size: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            contact.name.toString(),
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
