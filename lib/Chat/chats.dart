import 'package:flutter/material.dart';
import 'package:the_social/Pages/chatdetail.dart';

class chats extends StatelessWidget {
  const chats({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => chatdetail()),
        );
      },
      child: const ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/profilepic.png'),
          radius: 25,
        ),
        title: Text("Meet Rasania"),
        subtitle: Row(
          children: [
            Icon(
              Icons.check,
              size: 18,
            ),
            Text("Hello"),
          ],
        ),
        trailing: Text("12:25 am"),
      ),
    );
  }
}
