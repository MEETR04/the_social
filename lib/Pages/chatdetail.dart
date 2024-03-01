import 'package:flutter/material.dart';
import 'package:the_social/Pages/Homepage.dart';

class chatdetail extends StatefulWidget {
  const chatdetail({super.key});

  @override
  State<chatdetail> createState() => _chatdetailState();
}

class _chatdetailState extends State<chatdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        leading: InkWell(
            onTap: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
              );
            },
            child: Icon(Icons.arrow_back)),
        leadingWidth: 30,
        title: const Text(
          "Meet Rasania",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.videocam_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.sizeOf(context).width - 55,
                      child: Card(
                          margin: const EdgeInsets.only(
                              left: 2, right: 2, bottom: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            cursorColor: Colors.black54,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.tag_faces_outlined),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.attach_file_outlined),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 12),
                                      child: Icon(
                                        Icons.camera_alt_rounded,
                                      ),
                                    )
                                  ],
                                ),
                                hintText: "Enter a Message",
                                contentPadding: EdgeInsets.all(5)),
                          ))),
                  const Padding(
                    padding: EdgeInsets.only(left: 3, bottom: 7),
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF075E54),
                      foregroundColor: Colors.white,
                      radius: 23,
                      child: Icon(Icons.mic),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
