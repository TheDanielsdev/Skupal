import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/screens/payment_details.dart';
import 'package:skupal/screens/personal_info/day.dart';
import 'package:skupal/screens/personal_info/months.dart';
import 'package:skupal/screens/personal_info/months_data.dart';
import 'package:skupal/screens/personal_info/years.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

import '../reg_1.dart';

class LetUsMeetYou extends ConsumerStatefulWidget {
  LetUsMeetYou({Key? key}) : super(key: key);

  @override
  LetUsMeetYouState createState() => LetUsMeetYouState();
}

class LetUsMeetYouState extends ConsumerState<LetUsMeetYou> {
  final countryPickerProvider = Provider((ref) => FlCountryCodePicker());
  CountryCode? countryCode;
  DateTime? dateTime;
  final _firstNameProvider = StateProvider((ref) => "");
  final _lastNameProvider = StateProvider((ref) => "");
  final _displayNameProvider = StateProvider((ref) => "");
  final _phoneNumberProvider = StateProvider((ref) => "");
  final _isLoadingProvider = StateProvider((ref) => false);
  final _formKeyProvider = Provider((ref) => GlobalKey<FormState>());

  @override
  Widget build(
    BuildContext context,
  ) {
    final fName = ref.watch(_firstNameProvider);
    final lName = ref.watch(_lastNameProvider);
    final userName = ref.watch(_displayNameProvider);
    final phone = ref.watch(_phoneNumberProvider);
    final load = ref.watch(_isLoadingProvider);
    final formKey = ref.watch(_formKeyProvider);
    final countryPicker = ref.watch(countryPickerProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
            )),
        title: Text(
          "  Let's get to meet you",
          style: TextStyle(
              fontFamily: 'CerebriSansPro-Regular',
              fontWeight: FontWeight.w700,
              fontSize: 24),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  "Tell us about yourself",
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      color: AppColor.Neutral3,
                      fontWeight: FontWeight.w300,
                      fontSize: 14),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                expands: false,
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                  hintText: 'FirstName',
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
                  ref.read(_firstNameProvider.state).state = value.trim();
                },
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Field cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 17,
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                expands: false,
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                  hintText: 'LastName',
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
                  ref.read(_lastNameProvider.state).state = value.trim();
                },
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Field cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 17,
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                expands: false,
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                  hintText: 'DisplayName',
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
                  ref.read(_displayNameProvider.state).state = value.trim();
                },
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Field cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 17,
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                expands: false,
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        _showDatePicker();
                      },
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        color: AppColor.Neutral3,
                      )),
                  hintText:
                      dateTime != null ? dateTime!.toString() : 'Date Of Birth',
                  hintStyle: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      color: dateTime != null
                          ? AppColor.Neutral1
                          : AppColor.Neutral3,
                      fontSize: 12,
                      fontWeight:
                          dateTime != null ? FontWeight.w600 : FontWeight.w400),
                  focusColor: AppColor.Main_Color,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                expands: false,
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      //Come back here later
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: countryCode != null
                              ? countryCode!.flagImage
                              : null,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final code = await countryPicker.showPicker(
                                context: context);
                            setState(() => countryCode = code!);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                                color: AppColor.Main_Color,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              countryCode != null
                                  ? countryCode!.dialCode
                                  : "+234",
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  color: AppColor.White_Color,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  hintText: 'Phone number',
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
                  ref.read(_phoneNumberProvider.state).state = value.trim();
                },
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Field cannot be empty';
                  }
                  return null;
                },
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: load
                      ? null
                      : () {
                          formKey.currentState!.validate();
                          _cacheUserData(fName, lName, userName, phone,
                              dateTime.toString(), ref, context);
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(builder: (_) => PaymentDetails()));
                        },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: load
                          ? AppColor.Main_Color.withOpacity(0.5)
                          : AppColor.Main_Color,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                load
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
                                  'Continue',
                                  style: TextStyle(
                                      fontFamily: 'CerebriSansPro-Regular',
                                      color: load
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
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDatePicker() async {
    final DateTime? pik = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        initialDate: DateTime.now().add(Duration(hours: 1)),
        lastDate: DateTime(2022));
    setState(() {
      dateTime = pik;
    });
  }

  // _showDatePicker() {
  // return showDatePicker(
  //         context: context,
  //         initialDate: DateTime.now(),
  //         firstDate: DateTime(1982),
  //         lastDate: DateTime(2022))
  //       .then((value) {
  //     setState(() {
  //       dateTime = value!;
  //     });
  //   });
  // }

  _cacheUserData(String fName, String lName, String userName, String phone,
      String dob, WidgetRef ref, BuildContext context) {
    ref.read(userSignUpFlowProvider.state).state["fName"] = fName;
    ref.read(userSignUpFlowProvider.state).state["lName"] = lName;
    ref.read(userSignUpFlowProvider.state).state["userName"] = userName;
    ref.read(userSignUpFlowProvider.state).state["phone"] =
        countryCode!.dialCode + phone;
    ref.read(userSignUpFlowProvider.state).state["dob"] = dob;
    if (fName.isEmpty ||
        lName.isEmpty ||
        userName.isEmpty ||
        phone == "" ||
        dob == "") return;
    ref.read(_isLoadingProvider.state).state = true;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => PaymentDetails()));
    print(fName);
    print(lName);
    print(userName);
    print(dob);
    print('${countryCode!.dialCode}${phone}');
  }

  Future<void> _showModal(BuildContext context) {
    final month = Month_data.getMonths();
    return showModalBottomSheet<void>(
      context: context,
      enableDrag: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (BuildContext context) {
        return Container(
          color: Color(0xFF737373),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        child: ListWheelScrollView.useDelegate(
                          onSelectedItemChanged: (value) {
                            print(value);
                          },
                          itemExtent: 50,
                          perspective: 0.005,
                          diameterRatio: 1.2,
                          physics: FixedExtentScrollPhysics(),
                          childDelegate: ListWheelChildBuilderDelegate(
                              childCount: 32,
                              builder: ((context, index) {
                                return Day(days: index);
                              })),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 70,
                        child: ListWheelScrollView.useDelegate(
                          onSelectedItemChanged: (value) {
                            print(value);
                          },
                          itemExtent: 50,
                          perspective: 0.005,
                          diameterRatio: 1.2,
                          physics: FixedExtentScrollPhysics(),
                          childDelegate: ListWheelChildBuilderDelegate(
                              childCount: month.length,
                              builder: ((context, index) {
                                return Months(months: month[index].month);
                              })),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 70,
                        child: ListWheelScrollView.useDelegate(
                          onSelectedItemChanged: (value) {
                            print(value);
                          },
                          itemExtent: 50,
                          perspective: 0.005,
                          diameterRatio: 1.2,
                          physics: FixedExtentScrollPhysics(),
                          childDelegate: ListWheelChildBuilderDelegate(
                              childCount: 50,
                              builder: ((context, index) {
                                return Year(
                                  years: index,
                                );
                              })),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
