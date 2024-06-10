import 'package:flutter/material.dart';
import 'package:the_social/Chat/chats.dart';
import 'package:the_social/Models/ChatModels.dart';
import 'package:the_social/Pages/SelectContact.dart';
import 'package:the_social/Pages/camera.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key, required this.chatModel,required this.sourcechat}) : super(key: key);
  final List<ChatModel> chatModel;
  final ChatModel sourcechat;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        title: const Text(
          "WhatsApp Clone",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraPage()));
            },
            icon: const Icon(Icons.camera_alt_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          PopupMenuButton(onSelected :(value){
            print(value);
          },itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: "New Group",
                child: Text("New Group"),
              ),
              const PopupMenuItem(
                value: "New Broadcast",
                child: Text("New Broadcast"),
              ),
              const PopupMenuItem(
                value: "WhatsApp Web",
                child: Text("WhatsApp Web"),
              ),
              const PopupMenuItem(
                value: "Starred Messages",
                child: Text("Starred Messages"),
              ),
              const PopupMenuItem(
                value: "Settings",
                child: Text("Settings"),
              ),
            ];
          })
        ],
        bottom: TabBar(
          controller: _controller,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(icon: Icon(Icons.camera_alt_rounded)),
            Tab(
              text: 'Chats',
            ),
            Tab(text: 'Updates'),
            Tab(text: 'Calls'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children:  [
          CameraPage(),
          chats(
            chatModel: widget.chatModel,
            sourcechat: widget.sourcechat,
          ),
          Center(
            child: Text(
              'This is Updates Page',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Center(
            child: Text(
              'This is Calls Page',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
        ],
      ),

    );
  }
}
