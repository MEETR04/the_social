class ChatModel {
  String name;
  String icon;
  bool isgroup;
  String time;
  String currentmessage;
  String status;
  bool select = false;
  ChatModel({
    required this.name,
    required this.icon,
    required this.isgroup,
    required this.currentmessage,
    required this.time,
    required this.status,
    required this.select,
  });
}
