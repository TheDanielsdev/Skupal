import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/models/jobs.dart';
import 'package:skupal/models/jobs_populate.dart';
import 'package:skupal/screens/bid_summary.dart';
import 'package:skupal/widgets/line_widget.dart';

class SubmitBid extends StatefulWidget {
  SubmitBid({
    Key? key,
  }) : super(key: key);

  @override
  State<SubmitBid> createState() => _SubmitBidState();
}

class _SubmitBidState extends State<SubmitBid> {
  String dropdownvalue = '0 Days';

  // List of items in our dropdown menu

  var items = [
    '0 Days',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  String? radioValue;
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    bool isReadMore = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          'Submit Bid',
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColor.Neutral1,
              fontFamily: 'CerebriSansPro-Regular'),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              child: Row(children: [
                Icon(
                  Icons.flag_outlined,
                  color: AppColor.Main_Color,
                  size: 15,
                ),
                SizedBox(width: 6.44),
                Container(
                    child: Text(
                  'Report',
                  style: TextStyle(
                      color: AppColor.Main_Color,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'CerebriSansPro-Regular'),
                ))
              ]),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Row(
                children: [
                  ClipOval(
                    child: Container(
                      width: 24,
                      height: 24,
                      child: Image.asset('widget.avi',
                          width: 24, height: 24, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                      child: Text(
                    'widget.name',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CerebriSansPro-Regular'),
                  )),
                  SizedBox(
                    width: 6,
                  ),
                  Icon(Icons.circle, size: 4, color: AppColor.Circle_dot),
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                      child: Text(
                    'widget.minAgo',
                    style: TextStyle(
                        color: AppColor.Neutral3,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CerebriSansPro-Regular'),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Container(
                  child: Text(
                'widget.title',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'CerebriSansPro-Regular'),
              )),
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Text(
                'widget.desc',
                // ignore: dead_code
                maxLines: isReadMore ? null : 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColor.Neutral2,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'CerebriSansPro-Regular'),
              ),
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    isReadMore = !isReadMore;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: Text(
                    isReadMore ? 'Less' : 'More',
                    style: TextStyle(
                        color: AppColor.Main_Color,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CerebriSansPro-Regular'),
                  ),
                )),
            SizedBox(
              height: 17,
            ),
            Thin1mmLine(color: AppColor.Neutral5),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          ' widget.price',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'CerebriSansPro-Regular'),
                        ),
                        Text(
                          'Project Budget',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'CerebriSansPro-Regular'),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          ' widget.durationInDays',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'CerebriSansPro-Regular'),
                        ),
                        Text(
                          'Duration',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'CerebriSansPro-Regular'),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          'Milestone',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'CerebriSansPro-Regular'),
                        ),
                        Text(
                          'Payment Schedule',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'CerebriSansPro-Regular'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Thin1mmLine(color: AppColor.Neutral5),
            SizedBox(
              height: 17,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: AppColor.Neutral5)),
                width: double.infinity,
                height: 174,
                child: TextFormField(
                    textAlign: TextAlign.start,
                    expands: true,
                    minLines: null,
                    maxLines: null,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 17, vertical: 14),
                        border: InputBorder.none,
                        hintText: 'why should this client hire you?',
                        hintStyle: TextStyle(
                            color: AppColor.Neutral4,
                            fontFamily: 'CerebriSansPro-Regular',
                            fontSize: 12,
                            fontWeight: FontWeight.w400))),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Text(
                '"Your cover letter should be a maximum of 1000 character"',
                style: TextStyle(
                    color: AppColor.Neutral2,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    fontSize: 10),
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: DottedBorder(
                dashPattern: [4],
                radius: Radius.circular(10),
                color: AppColor.Main_Color,
                child: InkWell(
                  onTap: () {
                    //handle file upload
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    width: double.infinity,
                    height: 42,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: "Tap to ",
                                  style: TextStyle(
                                      color: AppColor.Neutral3,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'CerebriSansPro-Regular',
                                      fontSize: 10),
                                  children: [
                                TextSpan(
                                    text: "upload a file",
                                    style: TextStyle(
                                        color: AppColor.Main_Color,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'CerebriSansPro-Regular',
                                        fontSize: 10))
                              ]))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(color: AppColor.Subtle),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'How are you proposing?',
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.Neutral2),
                            ),
                          ),
                          Spacer(),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: Container(
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppColor.White_Color,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColor.Neutral5,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'NGN 50,000',
                                    style: TextStyle(
                                        fontFamily: 'CerebriSansPro-Regular',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.Neutral2),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text('How long will it take?',
                                style: TextStyle(
                                    fontFamily: 'CerebriSansPro-Regular',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.Neutral2)),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Container(
                              width: 85,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.Neutral1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: DropdownButton(
                                  underline: Container(
                                    width: 0,
                                  ),

                                  // Initial Value

                                  value: dropdownvalue,

                                  // Down Arrow Icon

                                  icon: const Icon(Icons.keyboard_arrow_down),

                                  // Array list of items

                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items,
                                          style: TextStyle(
                                              fontFamily:
                                                  'CerebriSansPro-Regular',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.Neutral2)),
                                    );
                                  }).toList(),

                                  // After selecting the desired option,it will

                                  // change button value to selected value

                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                      print(dropdownvalue);
                                    });
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text('Payment Schedule',
                                style: TextStyle(
                                    fontFamily: 'CerebriSansPro-Regular',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.Neutral2)),
                          ),
                          Spacer(),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
                                children: [
                                  Radio(
                                      value: 'One time',
                                      groupValue: radioValue,
                                      onChanged: (dynamic value) {
                                        setState(() {
                                          radioValue = value;
                                          print(radioValue);
                                        });
                                      }),
                                  Text('One time',
                                      style: TextStyle(
                                          fontFamily: 'CerebriSansPro-Regular',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.Neutral2)),
                                  Radio(
                                      value: 'Milestone',
                                      groupValue: radioValue,
                                      onChanged: (dynamic value) {
                                        setState(() {
                                          radioValue = value;
                                          print(radioValue);
                                        });
                                      }),
                                  Text('Milestone',
                                      style: TextStyle(
                                          fontFamily: 'CerebriSansPro-Regular',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.Neutral2))
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                //TODO: hande navigaton to bid summary page.
                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //     builder: (_) => BidSummary(
                //         avi: widget.avi,
                //         name: widget.name,
                //         minAgo: widget.minAgo,
                //         price: widget.price,
                //         title: widget.title,
                //         desc: widget.desc,
                //         durationInDays: widget.durationInDays,
                //         numberOfFiles: widget.numberOfFiles,
                //         numberOfBids: widget.numberOfBids)));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
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
                      children: const [
                        Center(
                          child: Text(
                            'Submit bid',
                            style: TextStyle(
                                color: AppColor.White_Color,
                                fontFamily: 'CerebriSansPro-Regular',
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
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
    );
  }
}
