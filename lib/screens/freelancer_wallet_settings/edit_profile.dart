import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helper/appcolors.dart';

class EditProfile extends ConsumerStatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  EditProfileState createState() => EditProfileState();
}

@override
class EditProfileState extends ConsumerState<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Subtle,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColor.Neutral1,
              size: 20,
            )),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: AppColor.Neutral1,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            fontFamily: 'CerebriSansPro-Regular',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: AppColor.Subtle,
                ),
                alignment: Alignment(0, 0),
                child: Stack(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/Augustine.png',
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 7,
                      left: 7.5,
                      child: GestureDetector(
                        onTap: () {
                          //handle actions
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: AppColor.Main_Color,
                              borderRadius: BorderRadius.circular(50)),
                          child: Image.asset(
                            'assets/cam.png',
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment(0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Austine',
                    style: TextStyle(
                      color: AppColor.Neutral1,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      fontFamily: 'CerebriSansPro-Regular',
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    'assets/verified.png',
                    width: 12,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: AppColor.White_Color,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.elliptical(30, 30),
                        topLeft: Radius.elliptical(30, 30))),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 8, 0, 0),
                                  child: Text(
                                    'Personal Information',
                                    style: TextStyle(
                                      color: AppColor.Neutral1,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      fontFamily: 'CerebriSansPro-Regular',
                                    ),
                                  ),
                                ),
                                _firstName(),
                                _lastName(),
                                _displayName(),
                                _discriptiion(),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                ),
                                GestureDetector(child: _button()),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _button extends StatelessWidget {
  const _button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    fontSize: 14,
                    color: AppColor.White_Color,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              width: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class _firstName extends StatelessWidget {
  const _firstName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(7, 13, 0, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          textCapitalization: TextCapitalization.words,
          expands: false,
          textAlign: TextAlign.justify,
          decoration: InputDecoration(
            hintText: 'First Name',
            hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'CerebriSansPro-Regular',
                color: AppColor.Neutral3),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColor.Subtle, style: BorderStyle.solid)),
            focusColor: AppColor.Main_Color,
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }
}

class _lastName extends StatelessWidget {
  const _lastName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(7, 17, 0, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          textCapitalization: TextCapitalization.words,
          expands: false,
          textAlign: TextAlign.justify,
          decoration: InputDecoration(
            hintText: 'Last Name',
            hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'CerebriSansPro-Regular',
                color: AppColor.Neutral3),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColor.Subtle, style: BorderStyle.solid)),
            focusColor: AppColor.Main_Color,
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }
}

class _displayName extends StatelessWidget {
  const _displayName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(7, 13, 0, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          textCapitalization: TextCapitalization.words,
          expands: false,
          textAlign: TextAlign.justify,
          decoration: InputDecoration(
            hintText: 'Display Name',
            hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'CerebriSansPro-Regular',
                color: AppColor.Neutral3),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColor.Subtle, style: BorderStyle.solid)),
            focusColor: AppColor.Main_Color,
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }
}

class _discriptiion extends StatelessWidget {
  const _discriptiion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(7, 13, 0, 0),
      child: Container(
        height: 149,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          textCapitalization: TextCapitalization.words,
          expands: true,
          minLines: null,
          maxLines: null,
          textAlign: TextAlign.justify,
          decoration: InputDecoration(
            hintText: 'Discription',
            hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'CerebriSansPro-Regular',
                color: AppColor.Neutral3),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColor.Subtle, style: BorderStyle.solid)),
            focusColor: AppColor.Main_Color,
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
