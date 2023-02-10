import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/components/custom_snackbar.dart';
import 'package:skupal/enums.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/screens/reg_1.dart';
import 'package:skupal/screens/verification_success.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:skupal/services/skupal_repo.dart';

final _isLoadingProvider = StateProvider(((ref) => false));
final _emailProvider = Provider(((ref) =>
    ref.watch(userSignUpFlowProvider.select((value) => value["email"] ?? ""))));
final _codeProvider = StateProvider(((ref) => ""));
final _startTimerProvider = StateProvider(((ref) => 60));
final _waitProvider = StateProvider(((ref) => false));

class VerifyEmail extends ConsumerWidget {
  VerifyEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _isLoading = ref.watch(_isLoadingProvider);
    var start = ref.watch(_startTimerProvider);
    var wait = ref.watch(_waitProvider);
    var email = ref.watch(_emailProvider);
    var code = ref.watch(_codeProvider);
    final otpController = OtpFieldController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: AppColor.Neutral1,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Verify Email',
          style: TextStyle(
              fontFamily: 'CerebriSansPro-Regular',
              fontSize: 16,
              color: AppColor.Neutral1,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 19,
            ),
            Center(
              child: Text(
                "  Let's make sure it's truly you. We've sent\n  a 4 digit code to the email you provided",
                style: TextStyle(
                    fontFamily: 'CerebriSansPro-Regular',
                    color: AppColor.Neutral3,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 69,
            ),
            Padding(
              padding: EdgeInsets.symmetric(),
              child: Row(
                children: [
                  Expanded(
                    child: OTPTextField(
                        controller: otpController,
                        length: 7,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        keyboardType: TextInputType.number,
                        otpFieldStyle: OtpFieldStyle(
                            focusBorderColor: AppColor.Main_Color),
                        fieldWidth: 35,
                        fieldStyle: FieldStyle.box,
                        outlineBorderRadius: 10,
                        style: TextStyle(fontSize: 15),
                        onChanged: (code) {
                          ref.read(_codeProvider.notifier).state = code;
                        },
                        onCompleted: (code) {
                          ref.read(_codeProvider.notifier).state = code;
                        }),
                  ),
                  // otpTextField(),
                ],
              ),
            ),
            code.isEmpty || code.length < 7
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: wait
                              ? null
                              : () {
                                  ref.read(_waitProvider.state).state = true;
                                  resendConfirmationCode(email, ref, context);
                                  startTimer(ref);
                                },
                          child: Text(
                            wait ? "" : "Resend Code ?",
                            style: TextStyle(
                                fontFamily: 'CerebriSansPro-Regular',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: wait
                                    ? AppColor.Neutral3
                                    : AppColor.Main_Color),
                          ),
                        ),
                        Text(
                          wait ? ' resending in' : "",
                          style: TextStyle(
                              fontFamily: 'CerebriSansPro-Regular',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          wait ? ' 00:${start}' : "",
                          style: TextStyle(
                              fontFamily: 'CerebriSansPro-Regular',
                              color: AppColor.State_Error,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          wait ? ' sec' : '',
                          style: TextStyle(
                              fontFamily: 'CerebriSansPro-Regular',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                  ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 20),
              child: GestureDetector(
                onTap: code.length < 7 || _isLoading
                    ? null
                    : () {
                        ref.read(_isLoadingProvider.state).state = true;
                        if (_isLoading) return;

                        verifyCode(email, code, ref, context);
                      },
                child: Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: Container(
                    height: 49,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: code.length < 7 || _isLoading
                          ? AppColor.Main_Color.withOpacity(0.5)
                          : AppColor.Main_Color,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Row(
                            children: [
                              _isLoading
                                  ? Container(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(''),
                              SizedBox(width: 10),
                              Text(
                                'Continue',
                                style: TextStyle(
                                    color: code.length < 7 || _isLoading
                                        ? AppColor.White_Color
                                        : AppColor.White_Color,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
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

  void startTimer(WidgetRef ref) {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (timer) {
      var start = ref.watch(_startTimerProvider);
      print("STart:$start");
      if (start > 0) {
        ref.read(_startTimerProvider.state).state--;
      } else {
        timer.cancel();
        ref.read(_startTimerProvider.state).state = 60;
        ref.read(_waitProvider.state).state = false;
      }
    });
  }

  verifyCode(
      String email, String code, WidgetRef ref, BuildContext context) async {
    print("Verifying Email... $email");

    try {
      ref.read(_isLoadingProvider.notifier).state = true;
      var response = await ref.read(skupalRepoProvider).verifyCode(email, code);
      print(response.message);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => VerificationSuccess()));
    } catch (error) {
      ref.read(_isLoadingProvider.notifier).state = false;

      showSnackBar(
          context: context,
          messageType: Message.error,
          snackText: 'Invalid code, click resend to resend code');
    }
  }

  resendConfirmationCode(
      String email, WidgetRef ref, BuildContext context) async {
    print("Resending Confirmation Code.");
    ref.read(_isLoadingProvider.state).state = true;
    try {
      ref.read(_isLoadingProvider.state).state = false;
      var response =
          await ref.read(skupalRepoProvider).sendVerificationCode(email);
      print(response.message);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Verification code sent to your email.')));
    } catch (error) {
      ref.read(_isLoadingProvider.state).state = false;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error Sending Verification Code.')));
    }
  }
}
