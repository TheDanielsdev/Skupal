import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:skupal/components/custom_snackbar.dart';
import 'package:skupal/enums.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/screens/dashboard_c.dart';
import 'package:skupal/screens/login.dart';
import 'package:skupal/screens/personal_info/lets_get_to_meet_you.dart';
import 'package:skupal/screens/verify_email.dart';
import 'package:skupal/services/skupal_repo.dart';
import 'package:skupal/extensions/custom_extension.dart';

final userSignUpFlowProvider = StateProvider(((ref) => Map<String, dynamic>()));

final _isVisibleProvider = StateProvider(((ref) => false));
final _isVisibleProvider2 = StateProvider(((ref) => false));
final _isLoadingProvider = StateProvider(((ref) => false));
final _emailProvider = StateProvider(((ref) => ""));
final _passwordProvider = StateProvider(((ref) => ""));
final _confirmPasswordProvider = StateProvider(((ref) => ""));
final _isNineCharacterProvider = StateProvider(((ref) => false));
final _hasOneNumberProvider = StateProvider(((ref) => false));

class Reg1 extends ConsumerWidget {
  Reg1({
    Key? key,
  }) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var email = ref.watch(_emailProvider);
    var password = ref.watch(_passwordProvider);
    var confirmPassword = ref.watch(_confirmPasswordProvider);

    var _isLoading = ref.watch(_isLoadingProvider);
    var _isVisible = ref.watch(_isVisibleProvider);
    var _isVisible2 = ref.watch(_isVisibleProvider2);
    var isNineCharacter = ref.watch(_isNineCharacterProvider);
    var hasOneNumber = ref.watch(_hasOneNumberProvider);

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: BoxDecoration(color: AppColor.Main_Color),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Image.asset(
                      'assets/Earn. Invest. Borrow.png',
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                    child: Text(
                      'Join 200+ students like you \non Skupal.',
                      style: TextStyle(
                          fontFamily: 'CerebriSansPro-Regular',
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 29,
                  ),
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
                        suffixIcon: emailController.text.isEmpty
                            ? Text('')
                            : IconButton(
                                onPressed: () {
                                  emailController.clear();
                                },
                                icon: Icon(Icons.clear)),
                        hintText: 'email',
                        hintStyle: TextStyle(
                            fontFamily: 'CerebriSansPro-Regular',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.Neutral2),
                        focusColor: AppColor.Main_Color,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onChanged: (value) {
                        ref.read(_emailProvider.state).state = value.trim();
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

                  //pwd area
                  SizedBox(
                    height: 17,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
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
                            color: AppColor.Neutral2),
                        suffixIcon: IconButton(
                            onPressed: () {
                              ref.read(_isVisibleProvider.state).state =
                                  !_isVisible;
                            },
                            icon: _isVisible
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusColor: AppColor.Main_Color,
                      ),
                      onChanged: (dynamic value) {
                        ref.read(_passwordProvider.state).state = value.trim();

                        //calling the password checker function here
                        passWordCheck(value, ref);
                      },
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'Field cannot be empty';
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: 17),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      expands: false,
                      controller: confirmPasswordController,
                      textAlign: TextAlign.justify,
                      obscureText: _isVisible2 ? false : true,
                      decoration: InputDecoration(
                        hintText: 're-enter Password',
                        hintStyle: TextStyle(
                            fontFamily: 'CerebriSansPro-Regular',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.Neutral3),
                        focusColor: AppColor.Main_Color,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        suffixIcon: IconButton(
                            onPressed: () {
                              ref.read(_isVisibleProvider2.state).state =
                                  !_isVisible2;
                            },
                            icon: _isVisible2
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off)),
                      ),
                      onChanged: (value) {
                        ref.read(_confirmPasswordProvider.notifier).state =
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

                  Spacer(),
                  //button
                  GestureDetector(
                    onTap: _isLoading
                        ? null
                        : () {
                            formKey.currentState!.validate();
                            // ref.read(_isLoadingProvider.state).state = true;
                            if (password != confirmPassword) {
                              showSnackBar(
                                  context: context,
                                  messageType: Message.error,
                                  snackText: "Passwords do not match!");
                            } else {
                              registerUser(emailController.text.trim(),
                                  passwordController.text.trim(), ref, context);
                            }
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
                              Center(
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
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'Get started on Skupal',
                                      style: TextStyle(
                                          fontFamily: 'CerebriSansPro-Regular',
                                          color: _isLoading
                                              ? Colors.grey[50]
                                              : AppColor.White_Color,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
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

                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(),
                            child: Text(
                              'Already a member ? ',
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.Main_Color),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: GestureDetector(
                            onTap: () {
                              //navigate to login screen
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => LoginScreen()));
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.Main_Color),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

//Creating the password checker function here, to check Entropy of Password
  passWordCheck(dynamic value, WidgetRef ref) {
    final numericRegexProvider = StateProvider(((ref) => RegExp(r'[0-9]')));
    var _numericRegex = ref.watch(numericRegexProvider);

    if (value.length < 9) {
      ref.watch(_isNineCharacterProvider.state).state = false;
    } else {
      ref.watch(_isNineCharacterProvider.state).state = true;
    }

    ref.read(_hasOneNumberProvider.state).state = false;
    if (_numericRegex.hasMatch(value)) {
      ref.read(_hasOneNumberProvider.state).state = true;
    }
  }

  registerUser(String email, String password, WidgetRef ref,
      BuildContext context) async {
    if (email.isEmpty || password.isEmpty) return;
    print(email + password);

    print("Creating User...");
    ref.read(_isLoadingProvider.notifier).state = true;
    ref
        .read(skupalRepoProvider)
        .createUser(
          email,
          password,
        )
        .then((result) {
      ref.read(_isLoadingProvider.notifier).state = true;
      ref.read(userSignUpFlowProvider.notifier).state["email"] = email;
      print(email + password);
      showSnackBar(
          context: context,
          messageType: Message.success,
          snackText: result.message!);

      //Open Email Verification Page
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => VerifyEmail()),
          (Route<dynamic> route) => false);
    }).onError((error, stackTrace) {
      print(error.toString());
      showSnackBar(
          context: context,
          messageType: Message.error,
          snackText: 'An error ocurred, try again');
      ref.read(_isLoadingProvider.notifier).state = false;
    });
  }
}
