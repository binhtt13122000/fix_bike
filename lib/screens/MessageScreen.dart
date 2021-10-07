import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/screens/Home.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:fix_bike/models/Message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<Message> listMessage = [
    new Message(
        messageText: 'Bạn có thể đến nhanh giúp',
        urlImage: iconLogin,
        isSend: false),
    new Message(
        messageText: 'Ok bạn nha',
        urlImage:
            "https://www.publicdomainpictures.net/pictures/320000/velka/background-image.png",
        isSend: true),
    new Message(
        messageText: 'Cảm ơn bạn',
        urlImage:
            "https://www.publicdomainpictures.net/pictures/320000/velka/background-image.png",
        isSend: false),
  ];

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StatusAppController controller = Get.put(StatusAppController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: Text(
          'Nguyễn Văn A',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFFF9AA33)),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: listMessage.length,
            shrinkWrap: true,
            padding: EdgeInsets.all(10.0),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                  mainAxisAlignment: listMessage[index].isSender
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    if (!listMessage[index].isSender)
                      CircleAvatar(
                        radius: 16,
                        backgroundImage: AssetImage(imageUser1),
                      ),
                    TextMessage(message: listMessage[index]),
                  ]);
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFFF9AA33),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Nhập tin nhắn ở đây...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      controller.setStatus(4);
                      Get.to(Home());
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.black,
                      size: 18,
                    ),
                    backgroundColor: Color(0xFFF9AA33),
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      child: Container(
        margin: EdgeInsets.only(left: 14, right: 14, top: 20, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: (!message.isSender ? Colors.grey.shade200 : Color(0xFFF9AA33)),
        ),
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
        child: Text(
          message.messageText,
          softWrap: true,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          textAlign: !message.isSender ? TextAlign.left : TextAlign.right,
        ),
      ),
    );
  }
}
