import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/screens/dashboard_c.dart';

class WithdrawSuccess extends ConsumerWidget {
  WithdrawSuccess({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                child: Lottie.asset('anim/2972-done-ticks.json'),
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              'Succesful',
              style: TextStyle(
                  fontFamily: 'CerebriSansPro-Regular',
                  color: AppColor.Neutral1,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "Your funds are underway.",
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
                  height: 50,
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
                            'Done',
                            style: TextStyle(
                                color: AppColor.White_Color,
                                fontFamily: 'CerebriSansPro-Regular',
                                fontWeight: FontWeight.bold),
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
