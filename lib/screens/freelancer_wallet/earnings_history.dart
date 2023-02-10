import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helper/appcolors.dart';

class EarningHistory extends ConsumerStatefulWidget {
  EarningHistory({Key? key}) : super(key: key);

  @override
  EarningHistoryState createState() => EarningHistoryState();
}

@override
class EarningHistoryState extends ConsumerState<EarningHistory> {
  final listProvider = StateProvider<List>(((ref) => [
        "02-03-2020",
        "02-03-2020",
        "02-03-2020",
        "02-03-2020",
        "02-03-2020",
        "02-03-2020"
      ]));

  @override
  Widget build(BuildContext context) {
    final _list = ref.watch(listProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Earning History',
          style: TextStyle(
            color: AppColor.Neutral1,
            fontWeight: FontWeight.w700,
            fontSize: 15,
            fontFamily: 'CerebriSansPro-Regular',
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColor.Neutral1,
              size: 20,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Text(
                  'Showing history from Oct, 2021 - Jan, 2022',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      color: AppColor.Neutral2,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Earnings_Withdrawn_Cons(),
              SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Wrap(children: [
                  Text(
                    'Filter',
                    style: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        color: AppColor.Neutral1,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                  Container(
                      height: 60,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: _list.map((dates) {
                          return box(dates, AppColor.Grey6);
                        }).toList(),
                      )),
                ]),
              ),
              SizedBox(
                height: 25,
              ),
              _transactions(),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: GestureDetector(
                  onTap: () {},
                  child: _button(),
                ),
              ),
            ],
          ),
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
        padding: const EdgeInsets.only(left: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Row(
              children: [
                Icon(
                  Icons.file_download_outlined,
                  color: AppColor.White_Color,
                  size: 13,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Get statement',
                  style: TextStyle(
                      color: AppColor.White_Color,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ],
            )),
            SizedBox(
              width: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class _transactions extends StatelessWidget {
  const _transactions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(),
          child: Column(
            children: [
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
      ),
    );
  }
}

Widget box(String title, Color backgroundcolor) {
  return Container(
      margin: EdgeInsets.all(10),
      width: 100,
      decoration: BoxDecoration(
          color: backgroundcolor, borderRadius: BorderRadius.circular(20)),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.calendar_month,
            color: AppColor.Neutral3,
            size: 9,
          ),
          Text(title,
              style: TextStyle(
                color: AppColor.Neutral3,
                fontWeight: FontWeight.w500,
                fontSize: 9,
                fontFamily: 'CerebriSansPro-Regular',
              ))
        ],
      ));
}

class Earnings_Withdrawn_Cons extends StatelessWidget {
  const Earnings_Withdrawn_Cons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runAlignment: WrapAlignment.center,
      runSpacing: 10,
      children: [
        Container(
          height: 70,
          width: 158,
          decoration: BoxDecoration(
            color: AppColor.Neutral6,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(children: [
              Row(
                children: [
                  Text('Earnings',
                      style: TextStyle(
                          color: AppColor.Neutral3,
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
                  Spacer(),
                  Image.asset('assets/earnings.png')
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text('300,000 NGN',
                  style: TextStyle(
                      color: AppColor.Neutral1,
                      fontSize: 14,
                      fontWeight: FontWeight.w600))
            ]),
          ),
        ),
        Container(
          height: 70,
          width: 158,
          decoration: BoxDecoration(
            color: AppColor.Neutral6,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(children: [
              Row(
                children: [
                  Text('Withdrawn',
                      style: TextStyle(
                          color: AppColor.Neutral3,
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
                  Spacer(),
                  Image.asset('assets/withdrawn.png')
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text('300,000 NGN',
                  style: TextStyle(
                      color: AppColor.Neutral1,
                      fontSize: 14,
                      fontWeight: FontWeight.w600))
            ]),
          ),
        ),
      ],
    );
  }
}
