import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/screens/email_sent.dart';
import 'package:skupal/services/skupal_repo.dart';
import 'package:skupal/extensions/custom_extension.dart';

class ForgetPwd extends ConsumerStatefulWidget {
  ForgetPwd({Key? key}) : super(key: key);

  @override
  ForgetPwdState createState() => ForgetPwdState();
}

class ForgetPwdState extends ConsumerState<ForgetPwd> {
  final _emailController =
      StateProvider.autoDispose((ref) => TextEditingController());
  final _isLoadingProvider = StateProvider<bool>((ref) => false);
  final _emailProvider = StateProvider<String>((ref) => "");
  final _formkey = Provider((ref) => GlobalKey<FormState>());

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(_emailController);
    final loading = ref.watch(_isLoadingProvider);
    final emailInput = ref.watch(_emailProvider);
    final formkey = ref.watch(_formkey);

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
          title: Text('Forgot Password',
              style: TextStyle(
                fontFamily: 'CerebriSansPro-Regular',
                color: AppColor.Neutral1,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              )),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              child: Form(
                key: formkey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),

                      Text('Enter your email, We will send you a reset\n password link to your email if it matches',
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: AppColor.Neutral3))
                          .center(),

                      SizedBox(
                        height: 30,
                      ),

                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        expands: false,
                        controller: controller,
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              fontFamily: 'CerebriSansPro-Regular',
                              color: AppColor.Neutral3,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                          focusColor: AppColor.Main_Color,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onChanged: (value) {
                          ref.read(_emailProvider.notifier).state =
                              value.trim();
                        },
                        validator: (text) {
                          if (text!.isEmpty) {
                            return 'Email field cannot be empty';
                          }
                          return null;
                        },
                      ),

                      SizedBox(
                        height: 33,
                      ),
                      //button
                      GestureDetector(
                        onTap: loading
                            ? null
                            : () {
                                formkey.currentState!.validate();

                                forgotPasswd(emailInput, ref, context);
                              },
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: loading
                                ? AppColor.Main_Color.withOpacity(0.5)
                                : AppColor.Main_Color,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                loading
                                    ? Container(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Container(
                                        width: 0,
                                      ),
                                SizedBox(width: 10),
                                Text(
                                  'Reset Password',
                                  style: TextStyle(
                                      fontFamily: 'CerebriSansPro-Regular',
                                      fontSize: 14,
                                      color: loading
                                          ? Colors.grey[50]
                                          : AppColor.White_Color,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }

  final logger = Logger();
  forgotPasswd(String email, WidgetRef ref, BuildContext context) async {
    if (email.isEmpty) return;
    print("Sending new password to $email");
    ref.read(_isLoadingProvider.notifier).state = true;

    try {
      // ref.read(_isLoadingProvider.state).state = true;
      var response = await ref.read(skupalRepoProvider).forgotPassword(email);
      print(response.message);
      ref.read(_isLoadingProvider.notifier).state = true;

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Padding(
            padding: const EdgeInsets.all(7),
            child: Text(
              'New password sent to ${email}',
            ),
          )));
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => EmailSent(email: email)));
    } catch (error) {
      ref.read(_isLoadingProvider.notifier).state = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Padding(
              padding: EdgeInsets.all(7),
              child: Text('An error occurred, re-enter email and try again'))));
    }
  }
}
