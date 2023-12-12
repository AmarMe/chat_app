import 'package:flutter/material.dart';

class OtherStatus extends StatelessWidget {
  const OtherStatus(
      {super.key, required this.name, required this.image, required this.time});
  final String name;
  final String image;
  final String time;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 27,
        backgroundImage: AssetImage("assets/$image"),
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
      subtitle: Text('Today at $time'),
    );
  }
}
