import 'package:flutter/material.dart';

import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/models/jobs.dart';
import 'package:skupal/models/jobs_populate.dart';
import 'package:skupal/screens/submit_gig.dart';
import 'package:skupal/widgets/line_widget.dart';
import 'package:skupal/widgets/recommended/contract%20details/contract_data.dart';
import 'package:skupal/widgets/recommended/contract%20details/contract_image.dart';
import 'package:skupal/widgets/recommended/contract%20details/contract_item.dart';

class ContractDetails extends StatelessWidget {
  String avi;
  String name;
  String minAgo;
  String price;
  String title;
  String desc;
  String durationInDays;
  String numberOfFiles;
  String numberOfBids;

  ContractDetails({
    Key? key,
    required this.avi,
    required this.name,
    required this.minAgo,
    required this.price,
    required this.title,
    required this.desc,
    required this.durationInDays,
    required this.numberOfFiles,
    required this.numberOfBids,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 19,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'CerebriSansPro-Regular',
                            color: AppColor.Neutral1),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: Thin1mmLine(color: AppColor.Neutral5),
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: Row(
                        children: [
                          Text(
                            'Delivery date',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'CerebriSansPro-Regular',
                                color: AppColor.Neutral2),
                          ),
                          Spacer(),
                          Text(
                            '19 March, 13:56',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'CerebriSansPro-Regular',
                                color: AppColor.Neutral1),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: Row(
                        children: [
                          Text(
                            'Status',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'CerebriSansPro-Regular',
                                color: AppColor.Neutral2),
                          ),
                          Spacer(),
                          Chip(
                              backgroundColor:
                                  AppColor.State_Info.withOpacity(0.3),
                              label: Text(
                                'In Progress',
                                style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'CerebriSansPro-Regular',
                                    color: AppColor.State_Info),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 0,
                                offset: const Offset(
                                  0,
                                  12,
                                ))
                          ]),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Column(
                                    children: [
                                      Text(
                                        '00',
                                        style: TextStyle(
                                            color: AppColor.State_Error,
                                            fontSize: 13.98,
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'Days',
                                        style: TextStyle(
                                            color: AppColor.Neutral3,
                                            fontSize: 7.77,
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Column(
                                    children: [
                                      Text(
                                        '24',
                                        style: TextStyle(
                                            color: AppColor.State_Error,
                                            fontSize: 13.98,
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'Hours',
                                        style: TextStyle(
                                            color: AppColor.Neutral3,
                                            fontSize: 7.77,
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Column(
                                    children: [
                                      Text(
                                        '10',
                                        style: TextStyle(
                                            color: AppColor.State_Error,
                                            fontSize: 13.98,
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'Minutes',
                                        style: TextStyle(
                                            color: AppColor.Neutral3,
                                            fontSize: 7.77,
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Column(
                                    children: [
                                      Text(
                                        '02',
                                        style: TextStyle(
                                            color: AppColor.State_Error,
                                            fontSize: 13.98,
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'Seconds',
                                        style: TextStyle(
                                            color: AppColor.Neutral3,
                                            fontSize: 7.77,
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18.24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: Container(
                        height: 70,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 30,
                              left: 0,
                              child: Image.asset(
                                avi,
                                fit: BoxFit.cover,
                                width: 24,
                                height: 24,
                              ),
                            ),
                            Positioned(
                              top: 46,
                              left: 18,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                    color: AppColor.Success,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                            Positioned(
                              top: 35,
                              left: 30,
                              child: Text(
                                name,
                                style: TextStyle(
                                    color: AppColor.Neutral1,
                                    fontSize: 10,
                                    fontFamily: 'CerebriSansPro-Regular',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Positioned(
                              top: 35,
                              right: 0,
                              child: Text(
                                price,
                                style: TextStyle(
                                    color: AppColor.Neutral1,
                                    fontSize: 12,
                                    fontFamily: 'CerebriSansPro-Regular',
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 7,
              ),
              //Next container
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 244,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Files',
                            style: TextStyle(
                                color: AppColor.Neutral1,
                                fontSize: 12,
                                fontFamily: 'CerebriSansPro-Regular',
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '200+ files',
                            style: TextStyle(
                                color: AppColor.Main_Color,
                                fontSize: 10,
                                fontFamily: 'CerebriSansPro-Regular',
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ContactImage(image: 'assets/folio_mock1.png'),
                            ContactImage(image: 'assets/folio_mock2.png'),
                            ContactImage(image: 'assets/folio_mock1.png'),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ContactImage(image: 'assets/folio_mock2.png'),
                            ContactImage(image: 'assets/folio_mock1.png'),
                            ContactImage(image: 'assets/folio_mock2.png'),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 182,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Text(
                            "Client's rating",
                            style: TextStyle(
                                color: AppColor.Neutral1,
                                fontSize: 12,
                                fontFamily: 'CerebriSansPro-Regular',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'No reviews yet',
                            style: TextStyle(
                                color: AppColor.Neutral2,
                                fontSize: 10,
                                fontFamily: 'CerebriSansPro-Regular',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/stars.png',
                            width: 25,
                            height: 25,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_) => SubmitGig()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.Main_Color,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      'Submit project',
                                      style: TextStyle(
                                          color: AppColor.White_Color,
                                          fontSize: 14,
                                          fontFamily: 'CerebriSansPro-Regular',
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
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
