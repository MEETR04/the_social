import 'package:flutter/material.dart';
import 'package:the_social/Widgets/AvtarCard.dart';
import 'package:the_social/Widgets/ButtonCard.dart';
import 'package:the_social/Models/ChatModels.dart';
import 'package:the_social/Pages/ContactCard.dart';

class NewGroup extends StatefulWidget {
  const NewGroup({super.key});

  @override
  State<NewGroup> createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
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
    ChatModel(
        name: "Meet Shah",
        status: "hello2",
        icon: '',
        isgroup: false,
        currentmessage: '',
        time: '',
        select: false, id: 5),
    ChatModel(
        name: "Meet Shah",
        status: "hello2",
        icon: '',
        isgroup: false,
        currentmessage: '',
        time: '',
        select: false, id: 6),
    ChatModel(
        name: "Meet Shah",
        status: "hello2",
        icon: '',
        isgroup: false,
        currentmessage: '',
        time: '',
        select: false, id: 7),
    ChatModel(
        name: "Meet Shah",
        status: "hello5",
        icon: '',
        isgroup: false,
        currentmessage: '',
        time: '',
        select: false, id: 8),
  ];
  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
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
              "New Group",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Add participants",
              style: TextStyle(color: Colors.white, fontSize: 15),
            )
          ],
        ),
        actions: const [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
        ],
      ),
      body: Stack(children: [
        ListView.builder(
            itemCount: contacts.length + 1,
            itemBuilder: (context, index) {
              if(index == 0){
                return Container(height: groups.length > 0 ? 90 : 10,);
              }
              return InkWell(
                  onTap: () {
                    if (contacts[index - 1].select == false) {
                      setState(() {
                        contacts[index -1].select = true;
                        groups.add(contacts[index-1]);
                      });
                    } else {
                      setState(() {
                        contacts[index-1].select = false;
                        groups.remove(contacts[index-1]);
                      });
                    }
                  },
                  child: Contactcard(contact: contacts[index-1]));
            }),
        groups.length > 0
            ? Column(
                children: [
                  Container(
                    height: 80,
                    //color: Colors.white,
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 2.0)),
                        color: Colors.white),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          if (contacts[index].select == true) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    contacts[index].select = false;
                                    groups.remove(contacts[index]);
                                  });
                                },
                                child: AvtarCard(contact: contacts[index]));
                          } else {
                            return Container();
                          }
                        }),
                  ),
                ],
              )
            : Container(),
      ]),
    );
  }
}
