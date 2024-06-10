class ChatModel {
  String name;
  String icon;
  bool isgroup;
  String time;
  String currentmessage;
  String status;
  bool select = false;
  int id;
  ChatModel({
    required this.name,
    required this.icon,
    required this.isgroup,
    required this.currentmessage,
    required this.time,
    required this.status,
    required this.select,
    required this.id,
  });
}
