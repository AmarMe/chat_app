import 'package:chat_app/CustomUI/contact_card.dart';
import 'package:chat_app/CustomUI/selectedAvatar_card.dart';
import 'package:chat_app/model/chatmodel.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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
  List<Chatmodel> groups = [];

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
                'New Group',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Add participants',
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
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: groups.length > 0 ? 90 : 10,
                    );
                  }
                  return InkWell(
                      onTap: () {
                        if (contacts[index - 1].isSelect == false) {
                          setState(() {
                            contacts[index - 1].isSelect = true;
                            groups.add(contacts[index - 1]);
                          });
                        } else {
                          setState(() {
                            contacts[index - 1].isSelect = false;
                            groups.remove(contacts[index - 1]);
                          });
                        }
                      },
                      child: ContactCard(contact: contacts[index - 1]));
                }),

            //display to show selected contacts
            groups.length > 0
                ? Column(
                    children: [
                      Container(
                        height: 75,
                        color: Colors.white,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: contacts.length,
                            itemBuilder: (context, index) {
                              if (contacts[index].isSelect == true) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      groups.remove(contacts[index]);
                                      contacts[index].isSelect = false;
                                    });
                                  },
                                  child: SelectedAvatar(
                                    contact: contacts[index],
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }),
                      ),
                      // const Divider(
                      //   thickness: 1,
                      // ),
                    ],
                  )
                : Container()
          ],
        ));
  }
}
