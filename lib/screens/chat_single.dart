import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import 'package:skupal/my_tests/msg_class.dart';

import '../helper/appcolors.dart';

class ChatSingle extends StatefulWidget {
  ChatSingle({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatSingle> createState() => _ChatSingleState();
}

class _ChatSingleState extends State<ChatSingle> {
  final myCont = TextEditingController();

  List<Message> messages = [
    Message(
        text: 'Hello',
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
        text: 'Cool',
        date: DateTime.now().subtract(Duration(minutes: 3, days: 4)),
        isSendByMe: false),
    Message(
        text: 'So the files ?',
        date: DateTime.now().subtract(Duration(minutes: 2, days: 4)),
        isSendByMe: false),
    Message(
        text: "Okay...",
        date: DateTime.now().subtract(Duration(minutes: 1, days: 4)),
        isSendByMe: true),
    Message(
        text: 'Waiting..',
        date: DateTime.now().subtract(Duration(minutes: 3, days: 3)),
        isSendByMe: false),
    Message(
        text: '...',
        date: DateTime.now().subtract(Duration(minutes: 2, days: 3)),
        isSendByMe: false),
    Message(
        text: "Hold on",
        date: DateTime.now().subtract(Duration(minutes: 1, days: 3)),
        isSendByMe: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
        ),
        centerTitle: true,
        title: Row(
          children: [
            Image.asset("widget.avi,", width: 35, height: 35),
            SizedBox(
              width: 13,
            ),
            Expanded(
              child: Text(
                "widget.name",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                size: 20,
              ))
        ],
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
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.zero),
                                  child: Card(
                                      color: AppColor.Main_Color,
                                      elevation: 8,
                                      child: Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Text(
                                          message.text,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                          ),
                                        ),
                                      )))
                              : Card(
                                  color: AppColor.Subtle,
                                  elevation: 8,
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text(
                                      message.text,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'CerebriSansPro-Regular',
                                          color: AppColor.Neutral1),
                                    ),
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
                          border: Border.all(color: AppColor.Main_Color),
                          borderRadius: BorderRadius.circular(28)),
                      child: TextField(
                        controller: myCont,
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                            prefixIcon: Container(
                                child: Image.asset(
                              'attachment.png',
                              width: 20,
                              height: 20,
                              filterQuality: FilterQuality.high,
                            )),
                            focusColor: AppColor.Main_Color,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28)),
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: 'Type message here'),
                        autofocus: true,
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  'smiley.png',
                  width: 20,
                  height: 20,
                  filterQuality: FilterQuality.high,
                ),
                SizedBox(
                  width: 9.54,
                ),
                IconButton(
                  onPressed: () {
                    final message = Message(
                      text: myCont.text,
                      date: DateTime.now(),
                      isSendByMe: true,
                    );
                    setState(() {
                      myCont.text.isEmpty ? null : messages.add(message);
                      myCont.clear();
                    });
                  },
                  icon: Icon(
                    Icons.send,
                    color: AppColor.Main_Color,
                    size: 20,
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
