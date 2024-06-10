import 'package:flutter/material.dart';
import 'package:the_social/Pages/Homepage.dart';
import 'package:the_social/Widgets/ButtonCard.dart';

import '../Models/ChatModels.dart';

class LoginInScreen extends StatefulWidget {
  const LoginInScreen({super.key});

  @override
  State<LoginInScreen> createState() => _LoginInScreenState();
}

class _LoginInScreenState extends State<LoginInScreen> {
  late ChatModel sourcechat;
  List<ChatModel> chatmodels = [
    ChatModel(
        name: "Meet Rasania",
        icon: "img.png",
        isgroup: false,
        currentmessage: "hi",
        time: "20:20",
        status: "king",
        select: false,
        id: 1),
    ChatModel(
        name: "Hetal Rasania",
        icon: "img.png",
        isgroup: false,
        currentmessage: "hi",
        time: "20:20",
        status: "king",
        select: false,
        id: 2),
    ChatModel(
        name: "Vaibhavi Rasania",
        icon: "img.png",
        isgroup: false,
        currentmessage: "hi",
        time: "20:20",
        status: "king",
        select: false,
        id: 3),
    ChatModel(
        name: "kalpesh Rasania",
        icon: "img.png",
        isgroup: false,
        currentmessage: "hi",
        time: "20:20",
        status: "king",
        select: false,
        id: 4)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatmodels.length,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                sourcechat = chatmodels.removeAt(index);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Homepage(
                              chatModel: chatmodels,
                              sourcechat: sourcechat,
                            )));
              },
              child: ButtonCard(
                  name: chatmodels[index].name, icon: Icons.person))),
    );
  }
}
