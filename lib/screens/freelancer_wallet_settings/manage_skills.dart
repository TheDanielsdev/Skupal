import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/helper/appcolors.dart';

class ManageSkills extends ConsumerStatefulWidget {
  ManageSkills({Key? key}) : super(key: key);

  @override
  ManageSkillsState createState() => ManageSkillsState();
}

class ManageSkillsState extends ConsumerState<ManageSkills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.Neutral1,
          ),
        ),
        title: Text(
          'Manage Skills',
          style: TextStyle(
              color: AppColor.Neutral1,
              fontFamily: 'CerebriSansPro-Regular',
              fontSize: 15,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Center(
              child: Text(
                'Done',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'CerebriSansPro-Regular',
                    color: AppColor.Main_Color,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                'Lets match you with jobs that meets your skills',
                style: TextStyle(
                    color: AppColor.Neutral3,
                    fontFamily: 'CerebriSansPro-Regular',
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                expands: false,
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                  hintText: 'Select skill',
                  hintStyle: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.Neutral3),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColor.Subtle, style: BorderStyle.solid)),
                  focusColor: AppColor.Main_Color,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                expands: false,
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                  hintText: 'Expert level',
                  hintStyle: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.Neutral3),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColor.Subtle, style: BorderStyle.solid)),
                  focusColor: AppColor.Main_Color,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.Main_Color,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 0, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Text(
                        'Add',
                        style: TextStyle(
                            fontFamily: 'CerebriSansPro-Regular',
                            color: AppColor.White_Color,
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
          ],
        ),
      ),
    );
  }
}
