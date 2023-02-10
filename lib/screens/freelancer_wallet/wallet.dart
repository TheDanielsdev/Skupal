import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/screens/freelancer_wallet/earnings_history.dart';
import 'package:skupal/screens/freelancer_wallet/wallet_withdraw.dart';

import '../../helper/appcolors.dart';

class Wallet extends ConsumerStatefulWidget {
  Wallet({Key? key}) : super(key: key);

  @override
  WalletState createState() => WalletState();
}

@override
class WalletState extends ConsumerState<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.symmetric(),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Row(
            children: [
              Image.asset('assets/Augustine.png'),
              SizedBox(
                width: 15,
              ),
              Text(
                'Louis',
                style: TextStyle(
                  color: AppColor.Neutral1,
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.save_alt_rounded,
                    size: 13,
                    color: AppColor.Main_Color,
                  )),
              SizedBox(
                width: 0,
              ),
              Text(
                'Get Statement',
                style: TextStyle(
                  color: AppColor.Main_Color,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
        _walletBalanceBox(),
        SizedBox(
          height: 26,
        ),
        _netIncomeAndexpectedEarnings(),
        SizedBox(
          height: 25,
        ),
        Container(
          height: 5,
          color: AppColor.Neutral5,
          width: MediaQuery.of(context).size.width,
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'History',
                      style: TextStyle(
                          color: AppColor.Neutral1,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'CerebriSansPro-Regular'),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EarningHistory()));
                      },
                      child: Text(
                        'View more',
                        style: TextStyle(
                            color: AppColor.Main_Color,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'CerebriSansPro-Regular'),
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColor.Grey6,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.arrow_upward_rounded,
                    color: AppColor.Grey3,
                  ),
                ),
                title: Text('Widthraw',
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColor.Grey2,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CerebriSansPro-Regular')),
                subtitle: Text('2022-04-20 10:20:40',
                    style: TextStyle(
                        fontSize: 10,
                        color: AppColor.Grey3,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CerebriSansPro-Regular')),
                trailing: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    15,
                    0,
                    0,
                  ),
                  child: Column(children: [
                    Text(
                      '-30,000.00 NGN',
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColor.State_Error,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'CerebriSansPro-Regular'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Failed',
                        style: TextStyle(
                            fontSize: 10,
                            color: AppColor.Grey3,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'CerebriSansPro-Regular'))
                  ]),
                ),
              ),
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColor.Grey6,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.arrow_upward_rounded,
                    color: AppColor.Grey3,
                  ),
                ),
                title: Text('Widthraw',
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColor.Grey2,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CerebriSansPro-Regular')),
                subtitle: Text('2022-04-20 10:20:40',
                    style: TextStyle(
                        fontSize: 10,
                        color: AppColor.Grey3,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CerebriSansPro-Regular')),
                trailing: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Column(children: [
                    Text(
                      '-30,000.00 NGN',
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColor.State_Error,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'CerebriSansPro-Regular'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Failed',
                        style: TextStyle(
                            fontSize: 10,
                            color: AppColor.Grey3,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'CerebriSansPro-Regular'))
                  ]),
                ),
              ),
              ListTile(
                leading: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColor.Grey6,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset('assets/piggy.png')),
                title: Text('Deposit',
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColor.Grey2,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CerebriSansPro-Regular')),
                subtitle: Text('2022-04-20 10:20:40',
                    style: TextStyle(
                        fontSize: 10,
                        color: AppColor.Grey3,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CerebriSansPro-Regular')),
                trailing: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Column(children: [
                    Text(
                      '+106,006.00 NGN',
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColor.Success,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'CerebriSansPro-Regular'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Failed',
                        style: TextStyle(
                            fontSize: 10,
                            color: AppColor.Grey3,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'CerebriSansPro-Regular'))
                  ]),
                ),
              ),
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColor.Grey6,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.arrow_upward_rounded,
                    color: AppColor.Grey3,
                  ),
                ),
                title: Text('Widthraw',
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColor.Grey2,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CerebriSansPro-Regular')),
                subtitle: Text('2022-04-20 10:20:40',
                    style: TextStyle(
                        fontSize: 10,
                        color: AppColor.Grey3,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CerebriSansPro-Regular')),
                trailing: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Column(children: [
                    Text(
                      '-30,000.00 NGN',
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColor.State_Error,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'CerebriSansPro-Regular'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Failed',
                        style: TextStyle(
                            fontSize: 10,
                            color: AppColor.Grey3,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'CerebriSansPro-Regular'))
                  ]),
                ),
              ),
              ListTile(
                leading: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColor.Grey6,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset('assets/piggy.png')),
                title: Text('Deposit',
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColor.Grey2,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CerebriSansPro-Regular')),
                subtitle: Text('2022-04-20 10:20:40',
                    style: TextStyle(
                        fontSize: 10,
                        color: AppColor.Grey3,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CerebriSansPro-Regular')),
                trailing: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Column(children: [
                    Text(
                      '+106,006.00 NGN',
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColor.Success,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'CerebriSansPro-Regular'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Failed',
                        style: TextStyle(
                            fontSize: 10,
                            color: AppColor.Grey3,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'CerebriSansPro-Regular'))
                  ]),
                ),
              ),
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColor.Grey6,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.arrow_upward_rounded,
                    color: AppColor.Grey3,
                  ),
                ),
                title: Text('Widthraw',
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColor.Grey2,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CerebriSansPro-Regular')),
                subtitle: Text('2022-04-20 10:20:40',
                    style: TextStyle(
                        fontSize: 10,
                        color: AppColor.Grey3,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CerebriSansPro-Regular')),
                trailing: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Column(children: [
                    Text(
                      '-30,000.00 NGN',
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColor.State_Error,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'CerebriSansPro-Regular'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Failed',
                        style: TextStyle(
                            fontSize: 10,
                            color: AppColor.Grey3,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'CerebriSansPro-Regular'))
                  ]),
                ),
              ),
            ],
          ),
        ),
      ]),
    )));
  }
}

class _netIncomeAndexpectedEarnings extends StatelessWidget {
  const _netIncomeAndexpectedEarnings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Wrap(
        spacing: 42,
        runAlignment: WrapAlignment.center,
        runSpacing: 15,
        children: [
          Column(
            children: [
              Text('Net income',
                  style: TextStyle(
                      color: AppColor.Neutral3,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'CerebriSansPro-Regular')),
              SizedBox(
                height: 10,
              ),
              Text(
                '6,876,232.00 NGN',
                style: TextStyle(
                    color: AppColor.Neutral1,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'CerebriSansPro-Regular'),
              )
            ],
          ),
          Column(
            children: [
              Text('Expected earnings',
                  style: TextStyle(
                      color: AppColor.Neutral3,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'CerebriSansPro-Regular')),
              SizedBox(
                height: 10,
              ),
              Text(
                '6,876,232.00 NGN',
                style: TextStyle(
                    color: AppColor.Neutral1,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'CerebriSansPro-Regular'),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _walletBalanceBox extends StatelessWidget {
  const _walletBalanceBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
            color: AppColor.Main_Color,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Your wallet balance',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColor.White_Color,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'CerebriSansPro-Regular',
                  )),
              SizedBox(
                height: 20,
              ),
              Text('\$500,000.00',
                  style: TextStyle(
                      fontSize: 24,
                      color: AppColor.White_Color,
                      fontFamily: 'CerebriSansPro-Regular',
                      fontWeight: FontWeight.w600)),
              SizedBox(
                height: 16,
              ),
              Wrap(
                spacing: 20,
                runSpacing: 10,
                runAlignment: WrapAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => WalletWithdraw()));
                    },
                    child: Container(
                      width: 111,
                      height: 28,
                      decoration: BoxDecoration(
                          color: AppColor.White_Color,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/withraw.png',
                              width: 15,
                            ),
                            SizedBox(width: 10),
                            Text('Withdraw',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColor.Main_Color,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'CerebriSansPro-Regular'))
                          ]),
                    ),
                  ),
                  Container(
                    width: 111,
                    height: 28,
                    decoration: BoxDecoration(
                        color: AppColor.White_Color,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/loan_main.png',
                            width: 15,
                          ),
                          SizedBox(width: 10),
                          Text('Loan',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: AppColor.Main_Color,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'CerebriSansPro-Regular'))
                        ]),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
