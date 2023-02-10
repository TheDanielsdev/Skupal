import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helper/appcolors.dart';

class DisputeChat extends ConsumerStatefulWidget {
  String title;
  DisputeChat({Key? key, required this.title}) : super(key: key);

  @override
  DisputeChatState createState() => DisputeChatState();
}

@override
class DisputeChatState extends ConsumerState<DisputeChat> {
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
                color: AppColor.Neutral1,
                size: 12,
              )),
          title: Row(
            children: [
              Container(
                  width: 25,
                  height: 25,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: Image.asset(
                    'assets/esther adewale.png',
                    width: 25,
                    height: 25,
                  )),
              SizedBox(
                width: 11,
              ),
              Text(
                'Tayo',
                style: TextStyle(
                    fontFamily: 'CerebriSansPro-Regular',
                    color: AppColor.Neutral1,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert_outlined,
                  color: AppColor.Neutral1,
                  size: 12,
                ))
          ],
        ),
        body: Stack(children: [
          // Positioned(
          //   top: 0,
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: 25,
          //     color: Colors.red,
          //   ),
          // ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 35,
              color: AppColor.White_Color,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.link,
                          color: AppColor.Neutral4,
                          size: 12,
                        )),
                    SizedBox(
                      width: 12.93,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                          alignment: Alignment.center,
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            textCapitalization: TextCapitalization.words,
                            expands: false,
                            textAlign: TextAlign.justify,
                            decoration: InputDecoration(
                              hintText: 'Please resend the files',
                              hintStyle: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.Neutral1),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.Subtle,
                                      style: BorderStyle.solid)),
                              focusColor: AppColor.Main_Color,
                              border: OutlineInputBorder(),
                            ),
                          )),
                    ),
                    Spacer(),
                    Image.asset(
                      'smiley.png',
                      fit: BoxFit.cover,
                      width: 12,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send_rounded,
                          color: AppColor.Main_Color,
                          size: 12,
                        ))
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}
