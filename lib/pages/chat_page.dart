import 'package:chat_app/CustomUI/custom_card.dart';
import 'package:chat_app/model/chatmodel.dart';
import 'package:chat_app/screens/selectcontact_screen.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage(
      {super.key, required this.chatmodel, required this.sourcechat});
  final List<Chatmodel> chatmodel;
  final Chatmodel sourcechat;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // List<Chatmodel> chats = [
  //   Chatmodel(
  //     name: "My friends",
  //     icon: "groups",
  //     isGroup: true,
  //     currentMessage: "Hi, there all",
  //     time: "4:00",
  //   ),
  //   Chatmodel(
  //     name: "dev",
  //     icon: "person",
  //     isGroup: false,
  //     currentMessage: "Hi, there",
  //     time: "10:00",
  //   ),
  //   Chatmodel(
  //     name: "ganesh",
  //     icon: "person",
  //     isGroup: false,
  //     currentMessage: "Hi, morning",
  //     time: "6:00",
  //   ),
  //   Chatmodel(
  //     name: "Family",
  //     icon: "groups",
  //     isGroup: true,
  //     currentMessage: "Hi, morning to all",
  //     time: "11:00",
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SelectContact()));
          },
          child: Icon(Icons.chat),
        ),
        body: ListView.builder(
          itemCount: widget.chatmodel.length,
          itemBuilder: (context, index) => CustomCard(
            chatmodel: widget.chatmodel[index],
            sourcechat: widget.sourcechat,
          ),
        ));
  }
}
