import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> messages = [];
  bool _isOptionsVisible = false;

  void _clearChat() {
    setState(() {
      messages.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Chat Bot'),
        actions: [
          IconButton(
            onPressed: _clearChat,
            icon: Icon(LineIcons.trash),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return _buildMessage(messages[index]);
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, bottom: 50.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () => _ShowChatBot(context),
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    LineIcons.facebookMessenger,
                    color: Theme.of(context).hoverColor,
                    size: 55,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(ChatMessage message) {
    final messageTextWidget = Text(
      message.text,
      style: TextStyle(
        color: message.type == MessageType.User
            ? Theme.of(context).dividerColor
            : Theme.of(context).dividerColor,
      ),
      maxLines: null,
      overflow: TextOverflow.visible,
    );

    final messageWidget = Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: message.type == MessageType.User
            ? Theme.of(context).disabledColor
            : Theme.of(context).highlightColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: messageTextWidget,
    );

    return message.type == MessageType.User
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 8.0),
              messageWidget,
            ],
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              messageWidget,
              const SizedBox(height: 8.0),
            ],
          );
  }

  void _ShowChatBot(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.45,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Positioned(
                      top: 10,
                      right: 5.5,
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Theme.of(context).splashColor,
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => _handleOptionSelected('ทำไมใครๆก็จัดฟันกัน'),
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                      border: Border.all(
                        width: 1.0,
                        color: Theme.of(context).hoverColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'ทำไมใครๆก็จัดฟันกัน',
                        style: TextStyle(
                            color: Theme.of(context).splashColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => _handleOptionSelected('จัดฟันใช้ระยะเวลากี่ปี'),
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                      border: Border.all(
                        width: 1.0,
                        color: Theme.of(context).hoverColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'จัดฟันใช้ระยะเวลากี่ปี',
                        style: TextStyle(
                            color: Theme.of(context).splashColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => _handleOptionSelected(
                      'ถ้าอยากจัดฟันจะต้องมาพบกับหมอจัดฟันก่อน หรือว่าต้องไปเคลียร์ช่องปากก่อน'),
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                      border: Border.all(
                        width: 1.0,
                        color: Theme.of(context).hoverColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'ถ้าอยากจัดฟันจะต้อง',
                        style: TextStyle(
                            color: Theme.of(context).splashColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () =>
                      _handleOptionSelected('อายุเท่าไรถึงจะเริ่มจัดฟันได้'),
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                      border: Border.all(
                        width: 1.0,
                        color: Theme.of(context).hoverColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'อายุเท่าไรถึงจะเริ่มจัดฟันได้',
                        style: TextStyle(
                            color: Theme.of(context).splashColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => _handleOptionSelected(
                      'เราสามารถย้ายคลินิกจัดฟัน ได้มั้ย'),
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                      border: Border.all(
                        width: 1.0,
                        color: Theme.of(context).hoverColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'สามารถย้ายคลินิกจัดฟัน ได้มั้ย',
                        style: TextStyle(
                            color: Theme.of(context).splashColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => _handleOptionSelected(
                      'หากต้องมีการถอนฟัน ร่วมกับการจัดฟัน ต้องถอนเมื่อไร'),
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                      border: Border.all(
                        width: 1.0,
                        color: Theme.of(context).hoverColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'ถอนฟันพร้อมจัดฟันได้หรือป่าว',
                        style: TextStyle(
                            color: Theme.of(context).splashColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _handleOptionSelected(String option) {
    setState(() {
      messages.add(ChatMessage(text: option, type: MessageType.User));
    });

    // Simulate bot response based on selected option
    _simulateBotResponse(option);
  }

  void _simulateBotResponse(String userMessage) {
    String botResponse = '';

    if (userMessage.contains('ทำไมใครๆก็จัดฟันกัน')) {
      botResponse =
          'การจัดฟันเป็นกระบวนการทางทันตกรรมที่มุ่งเน้นในการปรับรูปร่างและการปรับตำแหน่งของฟันเพื่อให้มีการทำงานที่ดีและปลอดภัย';
    } else if (userMessage.contains('อายุเท่าไรถึงจะเริ่มจัดฟันได้')) {
      botResponse =
          'อายุที่เริ่มจัดฟันได้เริ่มตั้งแต่ 12-13 ปี หรือเมื่อฟันแท้ขึ้นครบ แต่ในบางกรณีควรมาปรึกษาคุณหมอจัดฟันก่อนค่ะ เช่น ในกรณีที่มีความผิดปกติมากๆอย่างเช่น ฟันซ้อน เก ยื่นมากผิดปกติ ซึ่งอาจมีสาเหตุมาจากความผิดปกติของโครงสร้างกระดูกขากรรไกร คุณหมออาจพิจารณาให้ใส่เครื่องมือพิเศษเพื่อช่วยกระตุ้น หรือยับยั้งการเจริญโตของกระดูกขากรรไกรก่อน';
    } else if (userMessage.contains('จัดฟันใช้ระยะเวลากี่ปี')) {
      botResponse =
          'ขึ้นอยู่กับความยากง่าย และการเลือกเครื่องมือจัดฟันค่ะ ส่วนใหญ่ใช้ระยะเวลาประมาณ 2-3 ปีค่ะ นอกจากในกรณีที่ไม่ต้องถอนฟัน และจัดแบบ Invisalign อาจใช้เวลาไม่ถึงปี';
    } else if (userMessage.contains('เราสามารถย้ายคลินิกจัดฟัน ได้มั้ย')) {
      botResponse =
          'สามารถทำได้ แต่ต้องเข้ามาให้คุณหมอพิจารณาดูก่อน ว่าจะสามารถทำต่อได้หรือไม่ หรือจะต้องถอดเครื่องมือเก่าออกทั้งหมดก่อน เนื่องจากเครื่องมือที่ใช้ และแผนการรักษาของคุณหมอจัดฟันแต่ละท่านอาจไม่เหมือนกัน ทั้งนี้ควรนำเอ๊กซเรย์ แบบฟันก่อนจัด และประวัติการรักษา หรือใบส่งตัวมาด้วยในวันที่จะเข้ามาปรึกษา';
    } else if (userMessage
        .contains('หากต้องมีการถอนฟัน ร่วมกับการจัดฟัน ต้องถอนเมื่อไร')) {
      botResponse =
          'ส่วนใหญ่แล้วจะแนะนำให้ถอนก่อน เนื่องจากฟันจะได้มีที่ในการเคลื่อนตัว ยกเว้นในกรณีที่คนไข้ไม่อยากให้เห็นช่องถอนฟันก่อนมีเครื่องมือจัดฟัน คุณหมออาจพิจารณาติดเครื่องมือให้ก่อนได้ ซึ่งการติดเครื่องมือไปสักระยะหนึ่ง เมื่อฟันเริ่มมีการขยับตัว จะทำให้ถอนได้ง่ายไม่เจ็บ ไม่บอบช้ำกับฟันข้างเคียง หรือเหงือกและกระดูก';
    } else if (userMessage.contains(
        'ถ้าอยากจัดฟันจะต้องมาพบกับหมอจัดฟันก่อน หรือว่าต้องไปเคลียร์ช่องปากก่อน')) {
      botResponse =
          'แนะนำให้พบคุณหมอจัดฟันก่อนค่ะ เพื่อไม่ให้เป็นการเสียค่าใช้จ่ายซ้ำซ้อน เนื่องจากบางเคสอาจต้องมีการถอนฟันร่วมด้วย หากมีแผนการรักษาจัดฟันแล้ว จะได้ไม่ต้องอุดฟันซี่ที่จะต้องถอนอยู่แล้ว หรือในบางกรณีที่มีฟันผุลึกมากจนจะต้องรักษารากฟัน คุณหมอจัดฟันอาจพิจารณาถอนฟันซี่ที่ไม่ดีออกไป แทนที่จะถอนฟันกรามน้อยตามปกติ';
    } else {
      botResponse = 'ขอโทษครับ ฉันไม่เข้าใจคำถามของคุณ';
    }

    setState(() {
      messages.add(ChatMessage(text: botResponse, type: MessageType.Bot));
    });
  }
}

class ChatMessage {
  final String text;
  final MessageType type;

  ChatMessage({required this.text, required this.type});
}

enum MessageType {
  User,
  Bot,
}
