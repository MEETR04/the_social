import 'package:flutter/material.dart';
import 'package:the_social/Pages/chatdetail.dart';
import 'package:the_social/Widgets/CustomCard.dart';

import '../Models/ChatModels.dart';
import '../Pages/SelectContact.dart';

class chats extends StatefulWidget {
  chats({super.key, required this.chatModel, required this.sourcechat});
  List<ChatModel> chatModel;
  final ChatModel sourcechat;

  @override
  State<chats> createState() => _chatsState();
}

class _chatsState extends State<chats> {
  List<ChatModel> chats = [
    ChatModel(
        name: "Meet",
        icon: "Icons.person",
        isgroup: false,
        currentmessage: "currentmessage",
        time: "20:20",
        status: "hello",
        select: false,
        id: 1),
    ChatModel(
        name: "meet",
        icon: "Icons.person",
        isgroup: false,
        currentmessage: "currentmessage",
        time: "20:20",
        status: "hello",
        select: false,
        id: 2),
    ChatModel(
        name: "meeeeet",
        icon: "Icons.person",
        isgroup: false,
        currentmessage: "currentmessage",
        time: "20:20",
        status: "hello",
        select: false,
        id: 3),
    ChatModel(
        name: "mtee",
        icon: "Icons.person",
        isgroup: false,
        currentmessage: "currentmessage",
        time: "20:20",
        status: "hello",
        select: false,
        id: 4),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: const Color(0xFF075E54),
        child: IconButton(
          icon: const Icon(Icons.message),
          color: Colors.white,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Selectcontact()));
          },
        ),
      ),
      body: ListView.builder(
              itemCount: widget.chatModel.length,
              itemBuilder: (context, index) => CustomCard(
                    chatModel: widget.chatModel[index],
                    sourcechat: widget.sourcechat,
                  ))
    );
  }
}
