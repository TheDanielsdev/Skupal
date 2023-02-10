import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/models/jobs.dart';
import 'package:skupal/models/jobs_populate.dart';
import 'package:skupal/screens/contract_info.dart';
import 'package:skupal/screens/dashboard_c.dart';

class Delivered extends StatelessWidget {
  Delivered({
    Key? key,
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
                  color: AppColor.Neutral1,
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
                fit: BoxFit.cover,
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
                    color: AppColor.Neutral1,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                ' Your project has been\n submitted for approval',
                style: TextStyle(
                  color: AppColor.Neutral3,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
              Spacer(),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => DashboardC()));
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
                              'Go to my Dashboard',
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
