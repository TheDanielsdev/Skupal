import 'package:flutter/material.dart';
import 'package:skupal/helper/appcolors.dart';

class EmailSent extends StatelessWidget {
  final String email;
  EmailSent({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: Image.asset('assets/email_sent.png'),
            ),
            SizedBox(height: 27.46),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: Text(
                'Email Sent!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: Text(
                "      We've sent an email to $email \n                  since it matches our records!",
                style: TextStyle(
                  color: AppColor.Neutral3,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      child: TextButton(
                          onPressed: () {
                            //handle the onpressed
                          },
                          child: GestureDetector(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.Main_Color,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 0, bottom: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Center(
                                      child: Text(
                                        'Check your email',
                                        style: TextStyle(
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            color: AppColor.White_Color,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
