import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/screens/jobs_single.dart';

class RecoContainer extends StatelessWidget {
  String avi;
  String name;
  String minAgo;
  String price;
  String title;
  String desc;
  String durationInDays;
  String numberOfFiles;
  String numberOfBids;
  RecoContainer({
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
    return Slidable(
      startActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (value) {
              //
            },
            backgroundColor: AppColor.State_Error,
            icon: Icons.thumb_down_alt_outlined,
          ),
        ],
      ),
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
            onPressed: (value) {
              //
            },
            backgroundColor: AppColor.Main_Color,
            icon: Icons.edit_note_outlined),
      ]),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => JobsSingle(
                  avi: avi,
                  name: name,
                  desc: desc,
                  durationInDays: durationInDays,
                  minAgo: minAgo,
                  numberOfBids: numberOfBids,
                  numberOfFiles: numberOfFiles,
                  price: price,
                  title: title)));
        },
        child: Container(
          height: 155,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Container(
                      width: 24,
                      height: 24,
                      child: Image.asset(
                        avi,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'CerebriSansPro-Regular'),
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Icon(
                    Icons.circle,
                    size: 4,
                    color: AppColor.Circle_dot,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                    child: Text(
                      minAgo,
                      style: TextStyle(
                          color: AppColor.Neutral3,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'CerebriSansPro-Regular'),
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: Text(
                      price,
                      style: TextStyle(
                          color: AppColor.Main_Color,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'CerebriSansPro-Regular'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'CerebriSansPro-Regular'),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                child: Expanded(
                  child: Text(
                    desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: AppColor.Neutral2,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CerebriSansPro-Regular'),
                  ),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/mins.png',
                        width: 15,
                        height: 15,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                      SizedBox(
                        width: 7.5,
                      ),
                      Container(
                        child: Text(
                          durationInDays,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'CerebriSansPro-Regular'),
                        ),
                      ),
                      SizedBox(
                        width: 16.92,
                      ),
                      Image.asset(
                        'assets/attachment.png',
                        width: 15,
                        height: 15,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                      SizedBox(
                        width: 7.5,
                      ),
                      Container(
                        child: Text(
                          numberOfFiles,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'CerebriSansPro-Regular'),
                        ),
                      ),
                      SizedBox(
                        width: 16.92,
                      ),
                      Image.asset(
                        'assets/bids.png',
                        width: 15,
                        height: 15,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                      SizedBox(
                        width: 7.5,
                      ),
                      Container(
                        child: Text(
                          numberOfBids,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'CerebriSansPro-Regular'),
                        ),
                      ),
                    ],
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
