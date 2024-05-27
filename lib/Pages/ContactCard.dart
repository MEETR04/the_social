import 'package:flutter/material.dart';
import 'package:the_social/Models/ChatModels.dart';

class Contactcard extends StatelessWidget {
  const Contactcard({super.key, required this.contact});
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 30,
          child: Icon(Icons.person,color: Colors.white,size: 29,),
        ),
        title: Text(contact.name,style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text(contact.status,),
      ),
    );
  }
}
