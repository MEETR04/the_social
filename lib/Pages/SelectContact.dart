import 'package:flutter/material.dart';
import 'package:the_social/Widgets/ButtonCard.dart';
import 'package:the_social/Models/ChatModels.dart';
import 'package:the_social/Pages/ContactCard.dart';
import 'package:the_social/Pages/Homepage.dart';
import 'package:the_social/Pages/NewGroup.dart';

class Selectcontact extends StatefulWidget {
  const Selectcontact({super.key});

  @override
  State<Selectcontact> createState() => _SelectcontactState();
}

class _SelectcontactState extends State<Selectcontact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(
          name: "Meet Rasania",
          status: "hello",
          icon: '',
          isgroup: false,
          currentmessage: '',
          time: '',
          select: false, id: 1),
      ChatModel(
          name: "Meet Patel",
          status: "hello1",
          icon: '',
          isgroup: false,
          currentmessage: '',
          time: '',
          select: false, id: 2),
      ChatModel(
          name: "Meet Shah",
          status: "hello2",
          icon: '',
          isgroup: false,
          currentmessage: '',
          time: '',
          select: false, id: 3),
      ChatModel(
          name: "Meet Shah",
          status: "hello2",
          icon: '',
          isgroup: false,
          currentmessage: '',
          time: '',
          select: false, id: 4),
    ];
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xFF075E54),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Contact",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "256 contacts",
                style: TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
          actions: [
            const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
            PopupMenuButton(onSelected: (value) {
              print(value);
            }, itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: "Invite a friend",
                  child: Text("Invite a friend"),
                ),
                const PopupMenuItem(
                  value: "Contacts",
                  child: Text("Contacts"),
                ),
                const PopupMenuItem(
                  value: "Refresh",
                  child: Text("Refresh"),
                ),
                const PopupMenuItem(
                  value: "Help",
                  child: Text("Help"),
                ),
              ];
            })
          ],
        ),
        body: ListView.builder(
          itemCount: contacts.length +2 ,
            itemBuilder: (context, index)
        {
          if(index==0){
            return  Padding(
              padding: EdgeInsets.only(top: 10),
              child: InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const NewGroup()));
              },
                  child: ButtonCard(name: "New Group", icon: Icons.groups)),
            );
          }else if (index == 1){
            return const Padding(
              padding: EdgeInsets.only(top: 10),
              child: ButtonCard(name: "New Contact", icon: Icons.person_add_rounded),
            );
          }
          return Contactcard(contact: contacts[index - 2]);
        }
        ));
  }
}
