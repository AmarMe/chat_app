import 'package:chat_app/model/chatmodel.dart';
import 'package:chat_app/screens/person_screen.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Chatmodel chatmodel;
  final Chatmodel sourcechat;
  const CustomCard(
      {super.key, required this.chatmodel, required this.sourcechat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PersonScreen(
                      chatmodel: chatmodel,
                      sourcechat: sourcechat,
                    )));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Icon(
                chatmodel.isGroup.toString() == 'true'
                    ? Icons.groups
                    : Icons.person,
                size: 36,
              ),
            ),
            title: Text(
              chatmodel.name.toString(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 4,
                ),
                Text(chatmodel.currentMessage.toString()),
              ],
            ),
            trailing: Text(chatmodel.time.toString()),
          ),
          Padding(
            padding: EdgeInsets.only(left: 70, right: 10),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
