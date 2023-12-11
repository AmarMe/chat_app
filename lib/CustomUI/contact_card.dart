import 'package:chat_app/model/chatmodel.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contact});
  final Chatmodel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 54,
        child: Stack(
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

            contact.isSelect
                ? const Positioned(
                    bottom: 4,
                    right: 3,
                    child: CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 12,
                      child: Icon(
                        Icons.check,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      title: Text(
        contact.name.toString(),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        contact.status.toString(),
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
