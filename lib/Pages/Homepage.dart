import 'package:flutter/material.dart';
import 'package:the_social/Chat/chats.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

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
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
        bottom: TabBar(
          controller: _controller,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(icon: Icon(Icons.groups)),
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
        children: const [
          Center(
            child: Text(
              'This is Community Page',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                chats(),
                chats(),
                chats(),
                chats(),
                chats(),
                chats(),
                chats(),
                chats(),
                chats(),
                chats(),
                chats(),
                chats(),
                chats(),
                chats(),
                chats(),
              ],
            ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF075E54),
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }
}
