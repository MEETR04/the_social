import 'package:flutter/material.dart';
import 'package:the_social/Models/ChatModels.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({super.key, required this.name, required this.icon});
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color(0xFF075E54),
        radius: 30,
        child: Icon(icon,color: Colors.white,size: 29,),
      ),
      title: Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
    );
  }
}
