import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helper/appcolors.dart';

class ChangePwd extends ConsumerStatefulWidget {
  ChangePwd({Key? key}) : super(key: key);

  @override
  ChangePwdState createState() => ChangePwdState();
}

@override
class ChangePwdState extends ConsumerState<ChangePwd> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();
  final oldpwdProvider = StateProvider(((ref) => false));
  final newpwdProvider = StateProvider(((ref) => false));
  final confirmpwdProvider = StateProvider(((ref) => false));
  Widget build(BuildContext context) {
    final _oldpwd = ref.watch(oldpwdProvider);
    final _newpwd = ref.watch(newpwdProvider);
    final _comfirmpwd = ref.watch(newpwdProvider);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Change Password',
            style: TextStyle(
                color: AppColor.Grey1,
                fontFamily: 'CerebriSansPro-Regular',
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text(
                'Save',
                style: TextStyle(
                    color: AppColor.Main_Color,
                    fontFamily: 'CerebriSansPro-Regular',
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.Neutral1,
              ))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 19,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              'Enter a new password',
              style: TextStyle(
                  color: AppColor.Grey3,
                  fontFamily: 'CerebriSansPro-Regular',
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 33,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.Grey7,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(30, 30),
                      topRight: Radius.elliptical(30, 30))),
              height: MediaQuery.of(context).size.height,
              child: Column(children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 23),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    expands: false,
                    controller: oldPasswordController,
                    textAlign: TextAlign.justify,
                    obscureText: _oldpwd ? false : true,
                    decoration: InputDecoration(
                      hintText: 'Old password',
                      hintStyle: TextStyle(
                          fontFamily: 'CerebriSansPro-Regular',
                          color: AppColor.Neutral3),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.White_Color,
                              style: BorderStyle.solid)),
                      focusColor: AppColor.Main_Color,
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            ref.read(oldpwdProvider.state).state = !_oldpwd;
                          },
                          icon: _oldpwd
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 23),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    expands: false,
                    controller: newPasswordController,
                    textAlign: TextAlign.justify,
                    obscureText: _newpwd ? false : true,
                    decoration: InputDecoration(
                      hintText: 'New password',
                      hintStyle: TextStyle(
                          fontFamily: 'CerebriSansPro-Regular',
                          color: AppColor.Neutral3),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.White_Color,
                              style: BorderStyle.solid)),
                      focusColor: AppColor.Main_Color,
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            ref.read(newpwdProvider.state).state = !_newpwd;
                          },
                          icon: _newpwd
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 23),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    expands: false,
                    controller: confirmPasswordController,
                    textAlign: TextAlign.justify,
                    obscureText: _comfirmpwd ? false : true,
                    decoration: InputDecoration(
                      hintText: 'Comfirm password',
                      hintStyle: TextStyle(
                          fontFamily: 'CerebriSansPro-Regular',
                          color: AppColor.Neutral3),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.White_Color,
                              style: BorderStyle.solid)),
                      focusColor: AppColor.Main_Color,
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            ref.read(confirmpwdProvider.state).state =
                                !_comfirmpwd;
                          },
                          icon: _comfirmpwd
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off)),
                    ),
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
