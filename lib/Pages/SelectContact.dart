import 'package:flutter/material.dart';
import 'package:the_social/Pages/ContactCard.dart';
class Selectcontact extends StatefulWidget {
  const Selectcontact({super.key});

  @override
  State<Selectcontact> createState() => _SelectcontactState();
}

class _SelectcontactState extends State<Selectcontact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF075E54),
        title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Contact",style: TextStyle(color: Colors.white),),
            Text("256 contacts",style: TextStyle(color: Colors.white,fontSize: 15),)
          ],
        ),
        actions: [
          const IconButton(onPressed: null, icon: Icon(Icons.search,color: Colors.white,)),
          PopupMenuButton(onSelected :(value){
            print(value);
          },itemBuilder: (BuildContext context) {
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
      body: Expanded(
          flex: 1,
          child: ListView(
            children: const [
              Contactcard(),
            ],
          ),
        ),
    );
  }
}
