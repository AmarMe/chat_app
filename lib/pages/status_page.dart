import 'package:chat_app/CustomUI/Statuspagecards/otherstatus_card.dart';
import 'package:chat_app/CustomUI/Statuspagecards/ownstatus_card.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 48,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.grey[200],
              elevation: 8,
              child: Icon(
                Icons.edit,
                color: Colors.blueGrey,
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.teal[700],
            child: Icon(Icons.camera_alt),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            OwnStatusCard(),
            Statuslabels("Recent updates"),
            OtherStatus(
              name: "Jimmy",
              image: "2.jpeg",
              time: "12:09",
              isStatusviewed: true,
              statuscount: 10,
            ),
            OtherStatus(
              name: "Tommy",
              image: "3.jpeg",
              time: "12:09",
              isStatusviewed: true,
              statuscount: 5,
            ),
            OtherStatus(
              name: "Gummy",
              image: "4.jpeg",
              time: "12:09",
              isStatusviewed: true,
              statuscount: 3,
            ),
            SizedBox(
              height: 10,
            ),
            Statuslabels("Viewed updates"),
            SizedBox(
              height: 10,
            ),
            OtherStatus(
              name: "joe",
              image: "5.jpeg",
              time: "12:09",
              isStatusviewed: false,
              statuscount: 6,
            ),
            OtherStatus(
              name: "alex",
              image: "2.jpeg",
              time: "12:09",
              isStatusviewed: false,
              statuscount: 5,
            ),
            OtherStatus(
              name: "Jimmy",
              image: "2.jpeg",
              time: "12:09",
              isStatusviewed: false,
              statuscount: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget Statuslabels(String labelname) {
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300],
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 13),
      child: Text(
        labelname,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }
}
