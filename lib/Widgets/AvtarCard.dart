import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_social/Models/ChatModels.dart';

class AvtarCard extends StatelessWidget {
  const AvtarCard({super.key, required this.contact});
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
      child: Column(
        children: [
          Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueGrey[200],
                  radius: 25,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 12,
                      child: Icon(
                        Icons.clear,
                        color: Colors.black,
                        size: 15,
                      ),
                    )
                )
              ]),
          Text(contact.name,style: TextStyle(fontSize: 12),)
        ],
      ),
    );
  }
}
