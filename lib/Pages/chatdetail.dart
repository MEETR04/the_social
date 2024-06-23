import 'dart:convert';
import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:the_social/Models/ChatModels.dart';
import 'package:the_social/Pages/Camera.dart';
import 'package:the_social/Pages/CameraView.dart';
import 'package:the_social/Pages/Homepage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:the_social/Pages/StatusPage.dart';
import 'package:the_social/Widgets/CameraScreen.dart';
import 'package:the_social/Widgets/OwnFileCard.dart';
import 'package:the_social/Widgets/ReplyFileCard.dart';
import '../Models/MessageModel.dart';
import '../Widgets/OwnMessageCard.dart';
import '../Widgets/ReplyMessageCard.dart';
import 'package:http/http.dart' as http;

class chatdetail extends StatefulWidget {
  const chatdetail(
      {super.key, required this.sourcechat, required this.chatModel});

  final ChatModel sourcechat;
  final ChatModel chatModel;

  @override
  State<chatdetail> createState() => _chatdetailState();
}

class _chatdetailState extends State<chatdetail> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController emojicontroller = TextEditingController();
  bool sendbutton = false;
  IO.Socket socket = IO.io("http://192.168.29.251:5000", <String, dynamic>{
    "transports": ["websocket"],
    "autoConnect": false,
  });
  List<MessageModel> messages = [];
  ScrollController scrollController = ScrollController();
  ImagePicker imagePicker = ImagePicker();
  XFile? file;
  int poptime = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  void connect() {
    socket.connect();
    socket.onConnect((data) {
      print("Connected");
      socket.emit("/signin", widget.sourcechat.id);
      socket.on("/message", (msg) {
        print(msg);
        setMessage("destination", msg["message"], msg["path"]);
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    print(socket.connected);
    socket.onConnectError((data) => print("Connect error : $data"));
    socket.onConnectTimeout((data) => print("Connection Timout error : $data"));
    socket.onDisconnect((data) => print("Server Disconnected: $data"));
  }

  void sendMessage(String message, int sourceID, int targetID, String path) {
    setMessage("source", message, path);
    socket.emit("/message", {
      "message": message,
      "sourceID": sourceID,
      "targetID": targetID,
      "path": path
    });
  }

  void setMessage(String type, String message, String path) {
    MessageModel messageModel =
        MessageModel(type: type, message: message, path: path);
    setState(() {
      messages.add(messageModel);
    });
  }

  void sendImage(String path, String message) async {
    print(
      "$path",
    );
    print("$message");
    for (int i = 0; i < poptime; i++) {
      Navigator.pop(context);
    }
    setState(() {
      poptime = 0;
    });
    var request = http.MultipartRequest(
        "POST", Uri.parse("http://192.168.29.251:5000/routes/addimage"));
    request.files.add(await http.MultipartFile.fromPath("img", path));
    request.headers.addAll({
      "Content-type": "multipart/form-data",
    });
    http.StreamedResponse response = await request.send();
    var httpResponse = await http.Response.fromStream(response);
    var data = json.decode(httpResponse.body);
    print(data['path']);
    print(response.statusCode);
    setMessage("source", message, path);
    socket.emit("/message", {
      "message": message,
      "sourceID": widget.sourcechat.id,
      "targetID": widget.chatModel.id,
      "path": data['path'],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        "assets/images/bgwhatsapp.png",
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color(0xFF075E54),
          leading: InkWell(
              onTap: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Homepage(
                          chatModel: [], sourcechat: widget.sourcechat)),
                );
              },
              child: const Icon(Icons.arrow_back)),
          leadingWidth: 30,
          title: Text(
            widget.chatModel.name,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.videocam_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call,
                size: 20,
              ),
            ),
            PopupMenuButton(onSelected: (value) {
              print(value);
            }, itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: "View Contact",
                  child: Text("View Contact"),
                ),
                const PopupMenuItem(
                  value: "Media, Links and docs",
                  child: Text("Media, Links and docs"),
                ),
                const PopupMenuItem(
                  value: "WhatsApp Web",
                  child: Text("WhatsApp Web"),
                ),
                const PopupMenuItem(
                  value: "Search",
                  child: Text("Search"),
                ),
                const PopupMenuItem(
                  value: "Mute Notifications",
                  child: Text("Mute Notifications"),
                ),
              ];
            })
          ],
        ),
        body: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: WillPopScope(
            onWillPop: () {
              if (show) {
                setState(() {
                  show = false;
                });
              } else {
                Navigator.pop(context);
              }
              return Future.value(show);
            },
            child: Column(
              children: [
                Expanded(
                  //height: MediaQuery.sizeOf(context).height - 170,
                  child: ListView.builder(
                      itemCount: messages.length + 1,
                      shrinkWrap: true,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        if (index == messages.length) {
                          return Container(
                            height: 70,
                          );
                        }
                        if (messages[index].type == "source") {
                          if (messages[index].path.length > 0) {
                            return OwnFileCard(
                              path: messages[index].path,
                              message: messages[index].message,
                            );
                          } else {
                            return OwnMessageCard(
                                message: messages[index].message);
                          }
                        } else {
                          if (messages[index].path.length > 0) {
                            return ReplyFileCard(
                              path: messages[index].path,
                              message: messages[index].message,
                            );
                          } else {
                            return ReplyMessageCard(
                                message: messages[index].message);
                          }
                        }
                      }),
                  // child: ListView(
                  //   children: [
                  //     OwnFileCard(),
                  //     ReplyFileCard(
                  //       path: '',
                  //     ),
                  //     OwnFileCard(),
                  //     ReplyFileCard(
                  //       path: '',
                  //     ),
                  //     OwnFileCard(),
                  //     ReplyFileCard(
                  //       path: '',
                  //     ),
                  //   ],
                  // ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.sizeOf(context).width - 55,
                                child: Card(
                                    margin: const EdgeInsets.only(
                                        left: 2, right: 2, bottom: 8),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: TextFormField(
                                      controller: emojicontroller,
                                      focusNode: focusNode,
                                      keyboardType: TextInputType.multiline,
                                      cursorColor: Colors.black54,
                                      textAlignVertical:
                                          TextAlignVertical.center,
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
                                          prefixIcon: InkWell(
                                              onTap: () {
                                                focusNode.unfocus();
                                                focusNode.canRequestFocus =
                                                    false;
                                                setState(() {
                                                  show = !show;
                                                });
                                              },
                                              child: const Icon(
                                                  Icons.tag_faces_outlined)),
                                          suffixIcon: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                  icon: const Icon(Icons
                                                      .attach_file_outlined),
                                                  onPressed: () {
                                                    showModalBottomSheet(
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .zero),
                                                        context: (context),
                                                        builder: (builder) =>
                                                            Attachicon());
                                                  }),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 12),
                                                child: IconButton(
                                                  icon: const Icon(
                                                      Icons.camera_alt_rounded),
                                                  onPressed: () {
                                                    setState(() {
                                                      poptime = 2;
                                                    });
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                StatusPage()));
                                                    CameraScreen(
                                                        onImageSend: sendImage);
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                          hintText: "Enter a Message",
                                          contentPadding:
                                              const EdgeInsets.all(5)),
                                    ))),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 3, bottom: 7),
                              child: CircleAvatar(
                                  backgroundColor: const Color(0xFF075E54),
                                  foregroundColor: Colors.white,
                                  radius: 23,
                                  child: IconButton(
                                      onPressed: () {
                                        scrollController.animateTo(
                                            scrollController
                                                .position.maxScrollExtent,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeOut);
                                        sendMessage(
                                          emojicontroller.text,
                                          widget.sourcechat.id,
                                          widget.chatModel.id,
                                          "",
                                        );
                                        emojicontroller.clear();
                                        setState(() {
                                          sendbutton = false;
                                        });
                                      },
                                      icon: sendbutton
                                          ? const Icon(
                                              Icons.send,
                                              color: Colors.white,
                                            )
                                          : const Icon(
                                              Icons.mic,
                                              color: Colors.white,
                                            ))),
                            )
                          ],
                        ),
                        show ? EmojiSelect() : Container()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }

  Widget EmojiSelect() {
    return EmojiPicker(
      config: const Config(
          height: 350,
          swapCategoryAndBottomBar: true,
          bottomActionBarConfig: BottomActionBarConfig(
            backgroundColor: Colors.white,
            buttonColor: Colors.grey,
            buttonIconColor: Colors.black,
          ),
          emojiViewConfig: EmojiViewConfig(columns: 7)),
      onEmojiSelected: (category, emoji) {
        setState(() {
          emojicontroller.text = emojicontroller.text + emoji.emoji;
        });
      },
    );
  }

  Widget Attachicon() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.3,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Attachinfo(Icons.insert_drive_file, Colors.blue, "Documents"),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          poptime = 3;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CameraScreen(onImageSend: (){})));
                        CameraScreen(onImageSend: sendImage);
                      },
                      child:
                          Attachinfo(Icons.camera_alt, Colors.red, "Camera")),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        poptime = 2;
                      });
                      file = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CameraView(
                                    imagepath: file!.path,
                                    onSend: sendImage,
                                  )));
                    },
                    child: Attachinfo(
                        Icons.insert_photo, Colors.purple, "Gallery"),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Attachinfo(Icons.headset, Colors.orange, "Audio"),
                  const SizedBox(
                    width: 10,
                  ),
                  Attachinfo(Icons.location_pin, Colors.pink, "Location"),
                  const SizedBox(
                    width: 10,
                  ),
                  Attachinfo(Icons.person, Colors.blue, "Contacts")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Attachinfo(IconData icon, Color color, String text) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Icon(
            icon,
            color: Colors.white,
            size: 29,
          ),
        ),
        Text(text),
      ],
    );
  }
}
