import 'package:chat_app/CustomUI/Button_card.dart';
import 'package:chat_app/CustomUI/contact_card.dart';
import 'package:chat_app/model/chatmodel.dart';
import 'package:chat_app/screens/creategroup_screen.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<Chatmodel> contacts = [
    Chatmodel(name: 'Kanna', status: 'Backend developer'),
    Chatmodel(name: 'dev', status: 'frontend developer'),
    Chatmodel(name: 'jhon', status: 'full stack developer'),
    Chatmodel(name: 'harsh', status: 'system developer'),
    Chatmodel(name: 'sam', status: 'software developer'),
    Chatmodel(name: 'Kanna', status: 'Backend developer'),
    Chatmodel(name: 'dev', status: 'frontend developer'),
    Chatmodel(name: 'jhon', status: 'full stack developer'),
    Chatmodel(name: 'harsh', status: 'system developer'),
    Chatmodel(name: 'sam', status: 'software developer'),
    Chatmodel(name: 'Kanna', status: 'Backend developer'),
    Chatmodel(name: 'dev', status: 'frontend developer'),
    Chatmodel(name: 'jhon', status: 'full stack developer'),
    Chatmodel(name: 'harsh', status: 'system developer'),
    Chatmodel(name: 'sam', status: 'software developer'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Contact',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '234 contacts',
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 26,
                )),
            PopupMenuButton<String>(onSelected: (value) {
              print(value);
            }, itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(
                  child: Text('Invite a friend'),
                  value: 'Invite a friend',
                ),
                PopupMenuItem(
                  child: Text('Contacts'),
                  value: 'Contacts',
                ),
                PopupMenuItem(
                  child: Text('Refresh'),
                  value: 'Refresh',
                ),
                PopupMenuItem(
                  child: Text('Help'),
                  value: 'Help',
                ),
              ];
            })
          ],
        ),
        body: ListView.builder(
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateGroup()));
                    },
                    child: ButtonCard(name: 'New group', icon: Icons.groups));
              } else if (index == 1) {
                return ButtonCard(
                  name: 'New contact',
                  icon: Icons.person,
                );
              }
              return ContactCard(contact: contacts[index - 2]);
            }));
  }
}
