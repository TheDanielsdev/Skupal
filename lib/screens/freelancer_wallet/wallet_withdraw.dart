import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/screens/freelancer_wallet/select_bank.dart';

import '../../helper/appcolors.dart';

class WalletWithdraw extends ConsumerStatefulWidget {
  WalletWithdraw({Key? key}) : super(key: key);

  @override
  WalletWithdrawState createState() => WalletWithdrawState();
}

@override
class WalletWithdrawState extends ConsumerState<WalletWithdraw> {
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
            size: 20,
          ),
        ),
        title: Text(
          'Withdraw balance',
          style: TextStyle(
            color: AppColor.Neutral1,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            fontFamily: 'CerebriSansPro-Regular',
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Con1(),
              SizedBox(
                height: 35,
              ),
              Text('Recent',
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: AppColor.Neutral1)),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  Image.asset(
                    'assets/pint.png',
                    width: 45,
                    height: 45,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/kuda_mic.png',
                    width: 45,
                    height: 45,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/uba_mic.png',
                    width: 45,
                    height: 45,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/flutter_wave.png',
                    width: 45,
                    height: 45,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ]),
              ),
              SizedBox(
                height: 30,
              ),
              TextF1(),
              SizedBox(height: 25),
              TextF2(),
              SizedBox(height: 25),
              Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Arrival(),
                    SizedBox(height: 15),
                    Fee(),
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: GestureDetector(
                        onTap: () {
                          //to show bottom sheet, will come and handle later
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 500,
                                decoration: BoxDecoration(
                                    color: AppColor.White_Color,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20))),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Text('Modal BottomSheet'),
                                      ElevatedButton(
                                        child: const Text('Close BottomSheet'),
                                        onPressed: () => Navigator.pop(context),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Withdraw_button(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Arrival extends StatelessWidget {
  const Arrival({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Expected funds arrival time',
            style: TextStyle(
              fontSize: 10,
              color: AppColor.Grey3,
              fontWeight: FontWeight.w400,
              fontFamily: 'CerebriSansPro-Regular',
            )),
        Spacer(),
        Text('1min',
            style: TextStyle(
              fontSize: 10,
              color: AppColor.Grey3,
              fontWeight: FontWeight.w400,
              fontFamily: 'CerebriSansPro-Regular',
            ))
      ],
    );
  }
}

class Fee extends StatelessWidget {
  const Fee({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Fee',
            style: TextStyle(
              fontSize: 10,
              color: AppColor.Grey3,
              fontWeight: FontWeight.w400,
              fontFamily: 'CerebriSansPro-Regular',
            )),
        Spacer(),
        Text('1min',
            style: TextStyle(
              fontSize: 10,
              color: AppColor.Grey3,
              fontWeight: FontWeight.w400,
              fontFamily: 'CerebriSansPro-Regular',
            ))
      ],
    );
  }
}

class Withdraw_button extends StatelessWidget {
  const Withdraw_button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.Main_Color.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
              child: Text(
                'Withdraw',
                style: TextStyle(
                    color: AppColor.White_Color, fontWeight: FontWeight.bold),
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

class Con1 extends StatelessWidget {
  const Con1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.Main_Color, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Your wallet balance',
                  style: TextStyle(
                      color: AppColor.Main_Color5,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 12)),
              SizedBox(
                height: 5,
              ),
              Text('\$500,000.00',
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      color: AppColor.White_Color,
                      fontWeight: FontWeight.w600,
                      fontSize: 24))
            ]),
      ),
    );
  }
}

class TextF1 extends StatelessWidget {
  const TextF1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Wrap(
              spacing: 10,
              children: [
                Text(
                  'NGN',
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      color: AppColor.Neutral3,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
                Text(
                  'MAX',
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      color: AppColor.Main_Color,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                )
              ],
            ),
          ),
          hintText: 'Enter Amount',
          hintStyle: TextStyle(
              fontSize: 12,
              fontFamily: 'CerebriSansPro-Regular',
              color: AppColor.Neutral3),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColor.Grey6, style: BorderStyle.solid)),
        ),
      ),
    );
  }
}

class TextF2 extends StatelessWidget {
  const TextF2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => SelectBank()));
                },
                icon: Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColor.Neutral3,
                ))),
        hintText: 'Select payment method',
        hintStyle: TextStyle(
            fontSize: 12,
            fontFamily: 'CerebriSansPro-Regular',
            color: AppColor.Neutral3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColor.Grey6, style: BorderStyle.solid)),
      ),
    );
  }
}
