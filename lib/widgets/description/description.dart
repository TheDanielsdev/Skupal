import 'package:flutter/material.dart';

import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/models/jobs.dart';
import 'package:skupal/models/jobs_populate.dart';
import 'package:skupal/screens/submit_bid/submit_bid.dart';
import 'package:skupal/widgets/description/chip_data.dart';
import 'package:skupal/widgets/description/description_tag.dart';
import 'package:skupal/widgets/line_widget.dart';
import 'package:skupal/widgets/recommended/reco_data.dart';

final items = Chip_Item.getChipData();

class Description extends StatelessWidget {
  String avi;
  String name;
  String minAgo;
  String price;
  String title;
  String desc;
  String durationInDays;
  String numberOfFiles;
  String numberOfBids;
  Description({
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
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 0)),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Row(children: [
                Icon(
                  Icons.pin_drop_outlined,
                  color: AppColor.Neutral4,
                  size: 14,
                ),
                SizedBox(
                  width: 8.81,
                ),
                Container(
                  child: Text(
                    'Lagos',
                    style: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        fontWeight: FontWeight.w600,
                        fontSize: 10),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Icon(
                  Icons.circle,
                  color: AppColor.Circle_dot,
                  size: 4,
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  child: Text(
                    minAgo,
                    style: TextStyle(
                        color: AppColor.Neutral3,
                        fontFamily: 'CerebriSansPro-Regular',
                        fontWeight: FontWeight.w400,
                        fontSize: 10),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Text(
                desc,
                style: TextStyle(
                    fontFamily: 'CerebriSansPro-Regular',
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
            ),
            SizedBox(
              height: 15,
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
                          price,
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
                          durationInDays,
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
                    Column(
                      children: [
                        Text(
                          numberOfBids,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'CerebriSansPro-Regular'),
                        ),
                        Text(
                          'Bids',
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
            SizedBox(height: 15),
            Thin1mmLine(color: AppColor.Neutral5),
            SizedBox(height: 15),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Text(
                  'Attachments',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'CerebriSansPro-Regular'),
                )),
            Spacer(),
            Padding(padding: EdgeInsets.only(top: 0)),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (_) => SubmitBid(
                //         avi: avi,
                //         name: name,
                //         minAgo: minAgo,
                //         price: price,
                //         title: title,
                //         desc: desc,
                //         durationInDays: durationInDays,
                //         numberOfFiles: numberOfFiles,
                //         numberOfBids: numberOfBids)));
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
                            'Bid for this job',
                            style: TextStyle(
                                color: AppColor.White_Color,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'CerebriSansPro-Regular'),
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
