import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/models/jobs.dart';
import 'package:skupal/models/jobs_populate.dart';
import 'package:skupal/screens/chat_single.dart';
import 'package:skupal/screens/contract_info.dart';

class BidSummary extends StatelessWidget {
  String avi;
  String name;
  String minAgo;
  String price;
  String title;
  String desc;
  String durationInDays;
  String numberOfFiles;
  String numberOfBids;

  BidSummary({
    Key? key,
    required this.avi,
    required this.name,
    required this.minAgo,
    required this.price,
    required this.title,
    required this.desc,
    required this.durationInDays,
    required this.numberOfFiles,
    required this.numberOfBids,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      // Use [SystemUiOverlayStyle.light] for white status bar
      // or [SystemUiOverlayStyle.dark] for black status bar

      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  size: 20,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Image.asset(
                'assets/congrats.png',
                fit: BoxFit.contain,
                width: double.infinity,
                height: 210.79,
                filterQuality: FilterQuality.high,
              )),
              SizedBox(
                height: 28.21,
              ),
              Text(
                'Congratulations!',
                style: TextStyle(
                    fontFamily: 'CerebriSansPro-Regular',
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Your bid on #JIDS89778\n      has been accepted',
                style: TextStyle(
                  color: AppColor.Neutral3,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: InkWell(
                  onTap: () {
                    //navigate to chat page
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (_) => ChatSingle(
                    //             avi: avi,
                    //             name: name,
                    //             minAgo: minAgo,
                    //             price: price,
                    //             title: title,
                    //             desc: desc,
                    //             durationInDays: durationInDays,
                    //             numberOfFiles: numberOfFiles,
                    //             numberOfBids: numberOfBids)));
                  },
                  child: Text(
                    'Send client a message',
                    style: TextStyle(
                      color: AppColor.Main_Color,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'CerebriSansPro-Regular',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => ContractInfo(
                          avi: avi,
                          name: name,
                          minAgo: minAgo,
                          price: price,
                          title: title,
                          desc: desc,
                          durationInDays: durationInDays,
                          numberOfFiles: numberOfFiles,
                          numberOfBids: numberOfBids)));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.Main_Color,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'View contract',
                              style: TextStyle(
                                fontFamily: 'CerebriSansPro-Regular',
                                color: AppColor.White_Color,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //     statusBarBrightness: Brightness.dark));
  }
}
