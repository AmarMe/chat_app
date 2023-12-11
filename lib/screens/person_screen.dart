import 'package:chat_app/CustomUI/ownmessage_card.dart';
import 'package:chat_app/CustomUI/replymessage_card.dart';
import 'package:chat_app/model/chatmodel.dart';
import 'package:chat_app/model/messagemodel.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class PersonScreen extends StatefulWidget {
  const PersonScreen(
      {super.key, required this.chatmodel, required this.sourcechat});
  final Chatmodel chatmodel;
  final Chatmodel sourcechat;

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  bool isEmojivisible = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();
  late IO.Socket socket;
  bool sendbutton = false;
  List<Messagemodel> messages = [];

  @override
  void initState() {
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isEmojivisible = false;
      }
    });
  }

  void connect() {
    socket = IO.io("http://192.168.1.13:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    socket.connect();
    socket.emit("signin", widget.sourcechat.id);
    socket.onConnect((data) {
      print("connected");
      socket.on("message", (msg) {
        print(msg);
        setmessage("destination", msg["message"]);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    print(socket.connected);
  }

  //send message one to one
  void sendmessage(String message, int? sourceid, int? targetid) {
    setmessage("source", message);
    socket.emit("message",
        {"message": message, "sourceid": sourceid, "targetid": targetid});
  }

  void setmessage(String type, String message) {
    Messagemodel messagemodel = Messagemodel(
        type: type, message: message, time: DateTime.now().toString());

    setState(() {
      messages.add(messagemodel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/whatsapp_background.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              // toolbarHeight: 65,
              titleSpacing: 0,
              leadingWidth: 80,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 26,
                    ),
                    CircleAvatar(
                      radius: 24,
                      child: Icon(
                        Icons.person,
                        size: 26,
                      ),
                      // backgroundColor: Colors.blueGrey,
                    )
                  ],
                ),
              ),

              //chat person name
              title: Container(
                margin: const EdgeInsets.all(4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chatmodel.name.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'last seen today at 12:09 PM',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),

              // videocall, phone icons, options dots

              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.videocam),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.call),
                ),
                PopupMenuButton<String>(onSelected: (value) {
                  print(value);
                }, itemBuilder: (BuildContext context) {
                  return const [
                    PopupMenuItem(
                      child: Text('View contact'),
                      value: 'View contact',
                    ),
                    PopupMenuItem(
                      child: Text('Media, links and docs'),
                      value: 'Media, links and docs',
                    ),
                    PopupMenuItem(
                      child: Text('whatsapp Web'),
                      value: 'whatsapp Web',
                    ),
                    PopupMenuItem(
                      child: Text('Mute notification'),
                      value: 'Mute notification',
                    ),
                    PopupMenuItem(
                      child: Text('wallpaper'),
                      value: 'wallpaper',
                    ),
                  ];
                })
              ],
            ),
          ),

          //chats and bottom textfield bar

          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Column(
                children: [
                  Expanded(
                    // height: MediaQuery.of(context).size.height - 180,
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemCount: messages.length + 1,
                      itemBuilder: (context, index) {
                        if (index == messages.length) {
                          return Container(height: 70);
                        }
                        if (messages[index].type == "source") {
                          return OwnMessageCard(
                              message: messages[index].message.toString(),
                              time: messages[index]
                                  .time
                                  .toString()
                                  .substring(11, 16));
                        } else {
                          return ReplyMessageCard(
                              message: messages[index].message.toString(),
                              time: messages[index]
                                  .time
                                  .toString()
                                  .substring(11, 16));
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Expanded(child: Container()),
                          // Container(
                          //   height: 70,
                          Row(
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width - 50,
                                  child: Card(
                                    margin: const EdgeInsets.only(
                                        left: 2, right: 2, bottom: 8),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(26)),
                                    child: TextFormField(
                                      controller: _controller,
                                      focusNode: focusNode,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 5,
                                      minLines: 1,
                                      onChanged: (value) {
                                        if (value.length > 0) {
                                          setState(() {
                                            sendbutton = true;
                                          });
                                        } else {
                                          setState(() {
                                            sendbutton = false;
                                          });
                                        }
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type a message",
                                        prefixIcon: IconButton(
                                            onPressed: () {
                                              if (!isEmojivisible) {
                                                focusNode.unfocus();
                                                focusNode.canRequestFocus =
                                                    false; //////////
                                              }
                                              setState(() {
                                                isEmojivisible =
                                                    !isEmojivisible;
                                              });
                                            },
                                            icon: const Icon(
                                                Icons.emoji_emotions)),
                                        suffixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (builder) =>
                                                          bottomsheet());
                                                },
                                                icon: const Icon(
                                                    Icons.attach_file)),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.camera_alt))
                                          ],
                                        ),
                                        contentPadding: const EdgeInsets.all(6),
                                      ),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 2, right: 2, bottom: 8),
                                child: CircleAvatar(
                                  radius: 21,
                                  child: IconButton(
                                      onPressed: () {
                                        if (sendbutton) {
                                          _scrollController.animateTo(
                                              _scrollController
                                                  .position.maxScrollExtent,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.easeOut);
                                          sendmessage(
                                            _controller.text,
                                            widget.sourcechat.id,
                                            widget.chatmodel.id,
                                          );
                                          _controller.clear();
                                          setState(() {
                                            sendbutton = false;
                                          });
                                        }
                                      },
                                      icon: sendbutton
                                          ? Icon(Icons.send)
                                          : Icon(Icons.mic)),
                                ),
                              )
                            ],
                          ),
                          // ),

                          //Emoji display widget which is written below

                          Offstage(
                            offstage: isEmojivisible,
                            child: SizedBox(
                              height: 250,
                              child: EmojiPicker(
                                onEmojiSelected: (category, emoji) {
                                  setState(() {
                                    _controller.text =
                                        _controller.text + emoji.emoji;
                                  });
                                },
                                onBackspacePressed: () {},
                                config: Config(
                                  columns: 7,
                                  emojiSizeMax: 32 *
                                      (foundation.defaultTargetPlatform ==
                                              TargetPlatform.android
                                          ? 1.30
                                          : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
                                  verticalSpacing: 0,
                                  horizontalSpacing: 0,
                                  gridPadding: EdgeInsets.zero,
                                  initCategory: Category.RECENT,
                                  bgColor: Color(0xFFF2F2F2),
                                  indicatorColor: Colors.blue,
                                  iconColor: Colors.grey,
                                  iconColorSelected: Colors.blue,
                                  backspaceColor: Colors.blue,
                                  skinToneDialogBgColor: Colors.white,
                                  skinToneIndicatorColor: Colors.grey,
                                  enableSkinTones: true,
                                  recentTabBehavior: RecentTabBehavior.RECENT,
                                  recentsLimit: 28,
                                  noRecents: const Text(
                                    'No Recents',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black26),
                                    textAlign: TextAlign.center,
                                  ), // Needs to be const Widget
                                  loadingIndicator: const SizedBox
                                      .shrink(), // Needs to be const Widget
                                  tabIndicatorAnimDuration: kTabScrollDuration,
                                  categoryIcons: const CategoryIcons(),
                                  buttonMode: ButtonMode.MATERIAL,
                                ),
                              ),
                            ),
                          ),
                          // )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              onWillPop: () {
                if (isEmojivisible) {
                  setState(() {
                    isEmojivisible = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  //Bottom sheet widget Attachfile icon
  Widget bottomsheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bottomsheetIcon(Icons.file_copy, Colors.indigo, "Documents"),
                  const SizedBox(
                    width: 40,
                  ),
                  bottomsheetIcon(Icons.camera, Colors.pink, "Camera"),
                  const SizedBox(
                    width: 40,
                  ),
                  bottomsheetIcon(Icons.photo, Colors.purple, "Gallery"),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bottomsheetIcon(Icons.headset, Colors.orange, "Audio"),
                  const SizedBox(
                    width: 40,
                  ),
                  bottomsheetIcon(Icons.location_pin, Colors.teal, "location"),
                  const SizedBox(
                    width: 40,
                  ),
                  bottomsheetIcon(Icons.person, Colors.blue, "Contact"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  //each bottomsheet icon widget
  Widget bottomsheetIcon(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(
              icon,
              size: 28,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
