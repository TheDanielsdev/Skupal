import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/screens/dashboard_c.dart';
import 'package:skupal/screens/personal_info/lets_get_to_meet_you.dart';

class VerificationSuccess extends StatefulWidget {
  VerificationSuccess({
    Key? key,
  }) : super(key: key);

  @override
  State<VerificationSuccess> createState() => _VerificationSuccessState();
}

class _VerificationSuccessState extends State<VerificationSuccess>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          children: [
            Spacer(),
            Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Lottie.asset('anim/2972-done-ticks.json',
                      filterQuality: FilterQuality.high)),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              'Email Verified',
              style: TextStyle(
                  fontFamily: 'CerebriSansPro-Regular',
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              "We’ve sent an email to abc@xyz.com\n       since it matches our records!",
              style: TextStyle(
                color: AppColor.Neutral3,
                fontWeight: FontWeight.w300,
                fontSize: 15,
                fontFamily: 'CerebriSansPro-Regular',
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => DashboardC()));
                },
                child: Container(
                  height: 49,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.Main_Color,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(
                                color: AppColor.White_Color,
                                fontFamily: 'CerebriSansPro-Regular',
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
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
    );
  }
}
