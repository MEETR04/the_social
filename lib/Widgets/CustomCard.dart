import 'package:flutter/material.dart';
import 'package:the_social/Pages/chatdetail.dart';

import '../Models/ChatModels.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key, required this.chatModel, required this.sourcechat});
  final ChatModel chatModel;
  final ChatModel sourcechat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    chatdetail(sourcechat: sourcechat, chatModel: chatModel)));
      },
      child: Container(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profilepic.png'),
            radius: 25,
          ),
          title: Text(chatModel.name),
          subtitle: Row(
            children: [
              Icon(
                Icons.done_all,
                size: 18,
              ),
              SizedBox(
                width: 5,
              ),
              Text(chatModel.currentmessage),
            ],
          ),
          trailing: Text(chatModel.time),
        ),
      ),
    );
  }
}
