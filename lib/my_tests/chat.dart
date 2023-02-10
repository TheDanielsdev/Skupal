import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:skupal/my_tests/msg_class.dart';

class MyChat extends StatefulWidget {
  MyChat({Key? key}) : super(key: key);

  @override
  State<MyChat> createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  final myCont = TextEditingController();

  List<Message> messages = [
    Message(
        text: 'Hey babe',
        date: DateTime.now().subtract(Duration(minutes: 3, days: 5)),
        isSendByMe: false),
    Message(
        text: 'How are you ?',
        date: DateTime.now().subtract(Duration(minutes: 2, days: 5)),
        isSendByMe: false),
    Message(
        text: "Cool",
        date: DateTime.now().subtract(Duration(minutes: 1, days: 5)),
        isSendByMe: true),
    Message(
        text: 'Hey babe',
        date: DateTime.now().subtract(Duration(minutes: 3, days: 4)),
        isSendByMe: false),
    Message(
        text: 'How are you ?',
        date: DateTime.now().subtract(Duration(minutes: 2, days: 4)),
        isSendByMe: false),
    Message(
        text: "I'm good",
        date: DateTime.now().subtract(Duration(minutes: 1, days: 4)),
        isSendByMe: true),
    Message(
        text: 'Hey babe',
        date: DateTime.now().subtract(Duration(minutes: 3, days: 3)),
        isSendByMe: false),
    Message(
        text: 'How are you ?',
        date: DateTime.now().subtract(Duration(minutes: 2, days: 3)),
        isSendByMe: false),
    Message(
        text: "I'm good",
        date: DateTime.now().subtract(Duration(minutes: 1, days: 3)),
        isSendByMe: true),
    Message(
        text: 'Hey babe',
        date: DateTime.now().subtract(Duration(minutes: 3, days: 2)),
        isSendByMe: false),
    Message(
        text: 'How are you ?',
        date: DateTime.now().subtract(Duration(minutes: 2, days: 2)),
        isSendByMe: false),
    Message(
        text: "I'm good",
        date: DateTime.now().subtract(Duration(minutes: 1, days: 2)),
        isSendByMe: true),
    Message(
        text: 'Hey babe',
        date: DateTime.now().subtract(Duration(minutes: 3, days: 1)),
        isSendByMe: false),
    Message(
        text: 'How are you ?',
        date: DateTime.now().subtract(Duration(minutes: 2, days: 1)),
        isSendByMe: false),
    Message(
        text: "I'm good",
        date: DateTime.now().subtract(Duration(minutes: 1, days: 1)),
        isSendByMe: true),
    Message(
        text: 'Hey babe',
        date: DateTime.now().subtract(Duration(minutes: 3)),
        isSendByMe: false),
    Message(
        text: 'How are you ?',
        date: DateTime.now().subtract(Duration(minutes: 2)),
        isSendByMe: false),
    Message(
        text: "I'm good",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSendByMe: true)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(children: [
          Icon(Icons.arrow_back),
          Image.asset('augustine.png', width: 24, height: 24)
        ]),
        backgroundColor: Colors.orange,
        title: Text('FaVourite'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Expanded(
                child: GroupedListView<Message, DateTime>(
                    reverse: true,
                    order: GroupedListOrder.DESC,
                    useStickyGroupSeparators: true,
                    floatingHeader: true,
                    elements: messages,
                    groupBy: (message) => DateTime(message.date.year,
                        message.date.month, message.date.day),
                    groupHeaderBuilder: (Message message) => SizedBox(
                          height: 40,
                          child: Center(
                            child: Card(
                              color: Colors.black,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                    DateFormat.yMMMd().format(message.date)),
                              ),
                            ),
                          ),
                        ),
                    itemBuilder: (context, Message message) => Align(
                          alignment: message.isSendByMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: message.isSendByMe
                              ? ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                      bottomRight: Radius.circular(50)),
                                  child: Card(
                                      color: Colors.orange,
                                      elevation: 8,
                                      child: Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Text(message.text),
                                      )))
                              : Card(
                                  elevation: 8,
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text(message.text),
                                  ),
                                ),
                        ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange),
                          borderRadius: BorderRadius.circular(28)),
                      child: TextField(
                        controller: myCont,
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                            focusColor: Colors.orange,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28)),
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: 'Type message here'),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    final message = Message(
                      text: myCont.text,
                      date: DateTime.now(),
                      isSendByMe: true,
                    );
                    setState(() {
                      messages.add(message);
                      myCont.clear();
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
