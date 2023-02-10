import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/models/animated_bar_controller.dart';
import 'package:skupal/screens/onboarding.dart';
import 'package:skupal/screens/onboarding/onboarding_main.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => OnBoardingMain(stories: stories))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    // Future.delayed(Duration(seconds: 2), () {
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (context) => Onboarding()));
    // });
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            color: AppColor.Main_Color,
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [],
              ),
              Positioned(
                  top: 0, child: Image.asset('assets/Skupalogoicon.png')),
              Positioned(
                  bottom: 0,
                  right: 1,
                  child: Image.asset('assets/Skupalogoicon (2).png')),
              Padding(
                padding: const EdgeInsets.only(bottom: 190, top: 70),
                child: Center(
                  child: Image.asset(
                    'assets/middle logo.png',
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 50),
                child: Center(
                    child: Text(
                  'Skupal',
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 30,
                      color: AppColor.White_Color,
                      fontWeight: FontWeight.w700),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 150),
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColor.White_Color,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
