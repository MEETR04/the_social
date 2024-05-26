import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:the_social/Pages/Homepage.dart';

class chatdetail extends StatefulWidget {
  const chatdetail({super.key});

  @override
  State<chatdetail> createState() => _chatdetailState();
}

class _chatdetailState extends State<chatdetail> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController emojicontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

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
                MaterialPageRoute(builder: (context) => const Homepage()),
              );
            },
            child: const Icon(Icons.arrow_back)),
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
          PopupMenuButton(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: "View Contact",
                child: Text("View Contact"),
              ),
              const PopupMenuItem(
                value: "Media, Links and docs",
                child: Text("Media, Links and docs"),
              ),
              const PopupMenuItem(
                value: "WhatsApp Web",
                child: Text("WhatsApp Web"),
              ),
              const PopupMenuItem(
                value: "Search",
                child: Text("Search"),
              ),
              const PopupMenuItem(
                value: "Mute Notifications",
                child: Text("Mute Notifications"),
              ),
            ];
          })
        ],
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: WillPopScope(
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.sizeOf(context).width - 55,
                            child: Card(
                                margin: const EdgeInsets.only(
                                    left: 2, right: 2, bottom: 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: TextFormField(
                                  controller: emojicontroller,
                                  focusNode: focusNode,
                                  keyboardType: TextInputType.multiline,
                                  cursorColor: Colors.black54,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: InkWell(
                                          onTap: () {
                                            focusNode.unfocus();
                                            focusNode.canRequestFocus = false;
                                            setState(() {
                                              show = !show;
                                            });
                                          },
                                          child: const Icon(
                                              Icons.tag_faces_outlined)),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              icon: const Icon(
                                                  Icons.attach_file_outlined),
                                              onPressed: () {
                                                showModalBottomSheet(
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.zero
                                                  ),
                                                    context: (context),
                                                    builder: (builder) =>
                                                        Attachicon());
                                              }),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(right: 12),
                                            child: Icon(
                                              Icons.camera_alt_rounded,
                                            ),
                                          )
                                        ],
                                      ),
                                      hintText: "Enter a Message",
                                      contentPadding: const EdgeInsets.all(5)),
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
                    show ? EmojiSelect() : Container()
                  ],
                ),
              )
            ],
          ),
          onWillPop: () {
            if (show) {
              setState(() {
                show = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(show);
          },
        ),
      ),
    );
  }

  Widget EmojiSelect() {
    return EmojiPicker(
      config: const Config(
          height: 350,
          swapCategoryAndBottomBar: true,
          bottomActionBarConfig: BottomActionBarConfig(
            backgroundColor: Colors.white,
            buttonColor: Colors.grey,
            buttonIconColor: Colors.black,
          ),
          emojiViewConfig: EmojiViewConfig(columns: 7)),
      onEmojiSelected: (category, emoji) {
        setState(() {
          emojicontroller.text = emojicontroller.text + emoji.emoji;
        });
      },
    );
  }

  Widget Attachicon() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.3,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0)
      ),
      child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     Attachinfo(Icons.insert_drive_file, Colors.blue, "Documents"),
                      const SizedBox(width: 10,),
                      Attachinfo(Icons.camera_alt, Colors.red, "Camera"),
                      const SizedBox(width: 10,),
                      Attachinfo(Icons.insert_photo, Colors.purple, "Gallery")
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Attachinfo(Icons.headset, Colors.orange, "Audio"),
                      const SizedBox(width: 10,),
                      Attachinfo(Icons.location_pin, Colors.pink, "Location"),
                      const SizedBox(width: 10,),
                      Attachinfo(Icons.person, Colors.blue, "Contacts")


                    ],
                  ),
                ],
              ),
            ),
      ),
    );
  }
  Widget Attachinfo(IconData icon, Color color, String text){
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Icon(icon,color: Colors.white,size: 29,),
        ),
        Text(text),
      ],
    );
  }
}
