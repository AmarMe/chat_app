import 'package:flutter/material.dart';

class OwnStatusCard extends StatelessWidget {
  const OwnStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/1.png"),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
                backgroundColor: Colors.teal[700],
                radius: 11,
                child: Icon(
                  Icons.add,
                  size: 18,
                )),
          )
        ],
      ),
      title: Text(
        'My status',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
      ),
      subtitle: Text(
        'Tap to add status update',
        style: TextStyle(fontSize: 13, color: Colors.grey[900]),
      ),
    );
  }
}
