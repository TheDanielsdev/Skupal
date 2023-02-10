import 'package:flutter/material.dart';

import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/models/jobs.dart';
import 'package:skupal/models/jobs_populate.dart';
import 'package:skupal/widgets/recommended/contract%20details/contract_details.dart';
import 'package:skupal/widgets/contract_mesages.dart';
import 'package:skupal/widgets/line_widget.dart';

class ContractInfo extends StatefulWidget {
  String avi;
  String name;
  String minAgo;
  String price;
  String title;
  String desc;
  String durationInDays;
  String numberOfFiles;
  String numberOfBids;

  ContractInfo({
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
  State<ContractInfo> createState() => _ContractInfoState();
}

class _ContractInfoState extends State<ContractInfo> {
  int _changeColor = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColor.Neutral1,
                size: 20,
              )),
          centerTitle: true,
          title: Text(
            'Contract Details',
            style: TextStyle(
              fontSize: 15,
              color: AppColor.Neutral1,
              fontFamily: 'CerebriSansPro-Regular',
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: AppColor.Neutral1,
                  size: 13,
                ))
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Container(
                width: double.infinity,
                // height: 50,
                child: TabBar(
                    physics: AlwaysScrollableScrollPhysics(),
                    indicatorColor: AppColor.Main_Color,
                    onTap: (value) {
                      _changeColor = value;
                    },
                    unselectedLabelColor: AppColor.Neutral3,
                    tabs: [
                      Tab(
                        child: Text(
                          'Details',
                          style: TextStyle(
                              fontFamily: 'CerebriSansPro-Regular',
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: _changeColor == 0
                                  ? AppColor.Main_Color
                                  : AppColor.Neutral3),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Messages',
                          style: TextStyle(
                              fontFamily: 'CerebriSansPro-Regular',
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: _changeColor == 1
                                  ? AppColor.Main_Color
                                  : AppColor.Neutral3),
                        ),
                      )
                    ]),
              ),
            ),
            Thin1mmLine(color: AppColor.Neutral5),
            Expanded(
              child: Container(
                child: TabBarView(
                  children: [
                    ContractDetails(
                        avi: widget.avi,
                        name: widget.name,
                        minAgo: widget.minAgo,
                        price: widget.price,
                        title: widget.title,
                        desc: widget.desc,
                        durationInDays: widget.durationInDays,
                        numberOfFiles: widget.numberOfFiles,
                        numberOfBids: widget.numberOfBids),
                    ContractMessages()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
