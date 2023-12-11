import 'package:chat_app/CustomUI/Button_card.dart';
import 'package:chat_app/model/chatmodel.dart';
import 'package:chat_app/screens/Homescreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Chatmodel sourcechat;

  List<Chatmodel> chats = [
    Chatmodel(
        name: "Mynum",
        icon: "person",
        isGroup: false,
        currentMessage: "Hi, there all",
        time: "4:00",
        id: 1),
    Chatmodel(
        name: "dev",
        icon: "person",
        isGroup: false,
        currentMessage: "Hi, there",
        time: "10:00",
        id: 2),
    Chatmodel(
        name: "ganesh",
        icon: "person",
        isGroup: false,
        currentMessage: "Hi, morning",
        time: "6:00",
        id: 3),
    Chatmodel(
        name: "Fam",
        icon: "person",
        isGroup: false,
        currentMessage: "Hi, morning to all",
        time: "11:00",
        id: 4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    sourcechat = chats.removeAt(index);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => HomeScreen(
                                  chats: chats,
                                  sourcechat: sourcechat,
                                )));
                  },
                  child: ButtonCard(
                    name: chats[index].name.toString(),
                    icon: Icons.person,
                  ),
                )));
  }
}
