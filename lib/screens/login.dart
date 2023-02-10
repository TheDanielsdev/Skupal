import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:skupal/components/custom_snackbar.dart';
import 'package:skupal/enums.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/models/login_user.dart';
import 'package:skupal/screens/dashboard_c.dart';
import 'package:skupal/screens/forget_pwd.dart';
import 'package:skupal/screens/reg_1.dart';
import 'package:skupal/services/skupal_repo.dart';
import 'package:skupal/extensions/custom_extension.dart';
import 'package:dio/dio.dart';

final _isVisibleProvider = StateProvider(((ref) => false));
final _isLoadingProvider = StateProvider(((ref) => false));
final _emailProvider = StateProvider(((ref) => ""));
final _passwordProvider = StateProvider(((ref) => ""));

class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var email = ref.watch(_emailProvider);
    var password = ref.watch(_passwordProvider);

    var _isLoading = ref.watch(_isLoadingProvider);
    var _isVisible = ref.watch(_isVisibleProvider);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '  Welcome back',
            style: TextStyle(
                fontFamily: 'CerebriSansPro-Regular',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: AppColor.Neutral1),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            //thus
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                      child: Text(' Enter your email and password to sign in',
                          style: TextStyle(
                              fontFamily: 'CerebriSansPro-Regular',
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: AppColor.Neutral3))),
                ),
                SizedBox(
                  height: 30,
                ),

                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                          child: TextFormField(
                            textCapitalization: TextCapitalization.words,
                            expands: false,
                            controller: emailController,
                            textAlign: TextAlign.justify,
                            decoration: InputDecoration(
                              hintText: 'email',
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
                                return 'Field cannot be empty';
                              } else if (!text.isEmailValid) {
                                return 'Enter valid email';
                              }
                              return null;
                            },
                          ),
                        ),
                        //password area
                        SizedBox(height: 17),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textCapitalization: TextCapitalization.words,
                            expands: false,
                            controller: passwordController,
                            textAlign: TextAlign.justify,
                            obscureText: _isVisible ? false : true,
                            decoration: InputDecoration(
                              hintText: 'enter Password',
                              hintStyle: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.Neutral3),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    ref.read(_isVisibleProvider.state).state =
                                        !_isVisible;
                                  },
                                  icon: _isVisible
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off)),
                              focusColor: AppColor.Main_Color,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {
                              ref.read(_passwordProvider.notifier).state =
                                  value.trim();
                            },
                            validator: (text) {
                              if (text!.isEmpty) {
                                return 'Field cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: 31),
                //button
                GestureDetector(
                  onTap: _isLoading
                      ? null
                      : () {
                          formKey.currentState!.validate();

                          loginUser(email, password, ref, context);
                        },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _isLoading
                            ? AppColor.Main_Color.withOpacity(0.5)
                            : AppColor.Main_Color,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              'Log in',
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  fontSize: 14,
                                  color: _isLoading
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
                ),

                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: GestureDetector(
                            onTap: () {
                              //handle Nivigation to the forget pwd page
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => ForgetPwd()));
                            },
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.Main_Color),
                            )),
                      ),
                      GestureDetector(
                          onTap: () {
                            //handle navigation to the register/signup page
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => Reg1()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.Main_Color),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),

            // Expanded(
            //   child: Container(
            //     child: Positioned(
            //       bottom: 0,
            //       left: 0,
            //       right: 0,
            //       child: Row(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           children: [
            //             Image.asset(
            //               'assets/PowerClip_x0020_Contents1.png',
            //             ),
            //             Image.asset(
            //               'assets/PowerClip_x0020_Contents2.png',
            //             ),
            //             Image.asset(
            //               'assets/PowerClip_x0020_Contents3.png',
            //             ),
            //             Image.asset(
            //               'assets/PowerClip_x0020_Contents4.png',
            //             ),
            //             Image.asset(
            //               'assets/PowerClip_x0020_Contents5.png',
            //             ),
            //             Image.asset(
            //               'assets/PowerClip_x0020_Contents6.png',
            //             ),
            //           ]),
            //     ),
            //   ),
            // ),
          ]),
        ),
      ),
    );
  }

  final logger = Logger();

  loginUser(String email, String password, WidgetRef ref,
      BuildContext context) async {
    if (email.isEmpty || password.isEmpty) return;
    ref.read(_isLoadingProvider.notifier).state = true;

    ref
        .watch(
            loginProvider.call({"email": email, "password": password}).future)
        .then((authResponse) async {
      final authToken = authResponse.auth_token?.trim() ?? "";
      print("login result:  ${authResponse.toJson()}");
      print(authResponse.auth_token);
      ref.read(authTokenProvider.notifier).state = authToken;
      ref.read(_isLoadingProvider.notifier).state = true;

      showSnackBar(
          context: context,
          messageType: Message.success,
          snackText: authResponse.message!);

      // Open Dashboard Page
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => DashboardC()),
          (Route<dynamic> route) => false);
    }).catchError((e) {
// non-200 error goes here.
      switch (e.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (e as DioError).response;
          switch (res!.statusCode) {
            case HttpStatus.unauthorized:
              showSnackBar(
                  context: context,
                  messageType: Message.error,
                  snackText: 'Invlaid email or password');

              ref.read(_isLoadingProvider.notifier).state = false;
              break;
            case HttpStatus.internalServerError:
              showSnackBar(
                  context: context,
                  messageType: Message.error,
                  snackText: "Server Error, we're working on it");
              ref.read(_isLoadingProvider.notifier).state = false;
          }
          break;
        default:
          break;
      }
      ref.read(_isLoadingProvider.notifier).state = false;
    });
  }
}
