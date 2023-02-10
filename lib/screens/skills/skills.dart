import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/screens/get_social.dart';
import 'package:skupal/screens/reg_1.dart';
import 'package:skupal/screens/skills/skill_chip.dart';
import 'package:skupal/services/skupal_repo.dart';
import 'package:random_string/random_string.dart';
import 'package:skupal/widgets/description/description.dart';
import 'package:skupal/extensions/custom_extension.dart';

final userSkillList = StateProvider((ref) => []);

class Skills extends ConsumerStatefulWidget {
  Skills({Key? key}) : super(key: key);

  @override
  SkillsState createState() => SkillsState();
}

class SkillsState extends ConsumerState<Skills> {
  final skillControllerProv =
      StateProvider.autoDispose((ref) => TextEditingController());
  final _isLoadingProvider = StateProvider<bool>((ref) => false);
  final _formkey = Provider((ref) => GlobalKey<FormState>());
  int random = 0;

  String _dropdownvalue = 'Beginner';
  var _items = ['Beginner', 'Intermediate', 'Expert'];

  @override
  Widget build(BuildContext context) {
    final skillController = ref.watch(skillControllerProv);
    final skillsCont = ref.watch(userSkillList);
    final loading = ref.watch(_isLoadingProvider);
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
        title: Text('Manage Skills',
            style: TextStyle(
                fontFamily: 'CerebriSansPro-Regular',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColor.Neutral1)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                if (skillsCont.isEmpty) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Enter Skill(s)")));
                  return;
                } else {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => GetSocial()));
                }
              },
              child: Container(
                alignment: Alignment.center,
                child: Text('Done',
                    style: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColor.Main_Color)),
              ),
            ),
          )
        ],
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
                  Center(
                    child: Text(
                        "Let's match you with jobs that meet your skills",
                        style: TextStyle(
                            fontFamily: 'CerebriSansPro-Regular',
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: AppColor.Neutral3)),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    expands: false,
                    controller: skillController,
                    textAlign: TextAlign.justify,
                    decoration: InputDecoration(
                      hintText: 'Enter skill',
                      hintStyle: TextStyle(
                          fontFamily: 'CerebriSansPro-Regular',
                          color: AppColor.Neutral3,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      focusColor: AppColor.Main_Color,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Field cannot be empty';
                      }
                      return null;
                    },
                  ),

                  SizedBox(
                    height: 33,
                  ),
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.Neutral3),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton(
                      underline: Container(
                        width: 0,
                      ),

                      // Initial Value

                      value: _dropdownvalue,

                      // Down Arrow Icon

                      icon: const Icon(Icons.keyboard_arrow_down),
                      alignment: AlignmentDirectional.center,

                      // Array list of items

                      items: _items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Text(items,
                                style: TextStyle(
                                    fontFamily: 'CerebriSansPro-Regular',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.Neutral2)),
                          ),
                        );
                      }).toList(),

                      onChanged: (String? newValue) {
                        setState(() {
                          _dropdownvalue = newValue!;
                        });
                      },
                    ),
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

                            cacheUserData(skillController.text, _dropdownvalue);
                          },
                    child: Container(
                      height: 50,
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
                              'Add',
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
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text('Skills: ',
                        style: TextStyle(
                            fontFamily: 'CerebriSansPro-Regular',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColor.Neutral1)),
                  ),
                  SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 80,
                        childAspectRatio: 3 / 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 0),
                    itemCount: skillsCont.length,
                    itemBuilder: (_, i) {
                      return MyChip(
                        name: skillsCont[i],
                        deleteChip: () => deleteChipFn(i, context),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void deleteChipFn(int i, BuildContext context) {
    ref.watch(userSkillList).remove(i);
    print('tapp ${i}');
  }

  cacheUserData(String skillName, String expertise) {
    if (skillName.isEmpty) return;
    ref.read(_isLoadingProvider.notifier).state = true;

    ref
        .watch(userSkillList.notifier)
        .state
        .add(ref.read(skillControllerProv).text);
    var skillId = randomAlphaNumeric(24);
    print(skillName);
    print(expertise);
    print(skillId);

    ref.read(userSignUpFlowProvider.notifier).state["skills"] =
        ref.read(userSkillList);
    ref.read(_isLoadingProvider.notifier).state = false;
    ref.read(skillControllerProv.notifier).state.clear();
  }
}
