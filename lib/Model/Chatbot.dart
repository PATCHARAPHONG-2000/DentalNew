import 'package:dental_news/Model/Chatbot_body.dart';
import 'package:dental_news/utils/utils.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class Chatbot extends StatefulWidget {
  final String? title;

  const Chatbot({super.key, this.title});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    super.initState();
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          tr('app.chat'),
          style: GoogleFonts.k2d(),
        ),
        leading: IconButton(
          icon: Icon(LineIcons.chevronCircleLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(child: AppBody(messages: messages)),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 2,
              vertical: 5,
            ),
            color: Theme.of(context).primaryColor,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    _showMessageListBottomSheet(context);
                  },
                  icon: Icon(LineIcons.sortUpAscending),
                  color: color.white,
                  highlightColor: Colors.transparent, // สีเมื่อกด
                  splashColor: Colors.transparent, // สีเมื่อกดและค้างไว้
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.send),
                  hoverColor: Colors.transparent, // สีเมื่อเมาส์ hover
                  highlightColor: Colors.transparent, // สีเมื่อกด
                  splashColor: Colors.transparent, // สีเมื่อกดและค้างไว้
                  onPressed: () {
                    sendMessage(_controller.text);
                    _controller.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage(String text) async {
    if (text.isEmpty) return;
    setState(() {
      addMessage(
        Message(text: DialogText(text: [text])),
        true,
      );
    });

    dialogFlowtter.projectId = "bonychat-somq";

    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: text)),
    );

    if (response.message == null) return;
    setState(() {
      addMessage(response.message!);
    });
  }

  void addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({
      'message': message,
      'isUserMessage': isUserMessage,
    });
  }

  void _showMessageListBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: new Text('สวัสดี'),
                onTap: () {
                  sendMessage("สวัสดี");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: new Text('ฟัน'),
                onTap: () {
                  sendMessage("ฟัน");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: new Text('สบายดี'),
                onTap: () {
                  sendMessage("สบายดี");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: new Text('ทำอะไร'),
                onTap: () {
                  sendMessage("ทำอะไร");
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    dialogFlowtter.dispose();
    super.dispose();
  }
}

