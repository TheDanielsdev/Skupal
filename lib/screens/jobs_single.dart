import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/models/jobs.dart';
import 'package:skupal/models/jobs_populate.dart';
import 'package:skupal/widgets/about_client.dart';
import 'package:skupal/widgets/description/description.dart';
import 'package:skupal/widgets/job_history.dart';

import '../widgets/line_widget.dart';

class JobsSingle extends StatelessWidget {
  String avi;
  String name;
  String minAgo;
  String price;
  String title;
  String desc;
  String durationInDays;
  String numberOfFiles;
  String numberOfBids;

  JobsSingle(
      {Key? key,
      required this.avi,
      required this.name,
      required this.desc,
      required this.durationInDays,
      required this.minAgo,
      required this.numberOfBids,
      required this.numberOfFiles,
      required this.price,
      required this.title})
      : super(key: key);

  @override
  final currentIndexProvider = StateProvider<int>(((ref) => 0));
  final changeColorProider = StateProvider<bool>(((ref) => false));
  var _currentIndex = 0;

  Widget build(BuildContext context) {
    final actualWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
        initialIndex: _currentIndex,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 15,
              ),
            ),
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Stack(
                    children: [
                      ClipOval(
                        child: Container(
                          width: 35,
                          height: 35,
                          child: Image.asset(
                            avi,
                            height: 35,
                            width: 35,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 5,
                          right: 0,
                          child: Container(
                            child: Image.asset(
                              'assets/verified.png',
                              width: 10,
                              height: 10,
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 9,
                ),
                Container(
                  child: Expanded(
                    child: Text(
                      name,
                      maxLines: 1,
                      textWidthBasis: TextWidthBasis.parent,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'CerebriSansPro-Regular'),
                    ),
                  ),
                )
              ],
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      size: 16.67,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon:
                          Icon(Icons.share, color: AppColor.Neutral1, size: 16))
                ]),
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                alignment: Alignment.center,
                // height: 50,
                child: TabBar(
                  physics: AlwaysScrollableScrollPhysics(),
                  indicatorColor: AppColor.Main_Color,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  onTap: (value) {
                    _currentIndex = value;
                  },
                  tabs: [
                    Tab(
                      child: Text(
                        'Description',
                        style: TextStyle(
                            fontFamily: 'CerebriSansPro-Regular',
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: _currentIndex == 0
                                ? AppColor.Main_Color
                                : AppColor.Neutral3),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'About Client',
                        style: TextStyle(
                          color: _currentIndex == 1
                              ? AppColor.Main_Color
                              : AppColor.Neutral3,
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          fontFamily: 'CerebriSansPro-Regular',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Thin1mmLine(color: AppColor.Neutral5),
              Expanded(
                child: Container(
                  child: TabBarView(
                    children: [
                      Description(
                          avi: avi,
                          name: name,
                          minAgo: minAgo,
                          price: price,
                          title: title,
                          desc: desc,
                          durationInDays: durationInDays,
                          numberOfFiles: numberOfFiles,
                          numberOfBids: numberOfBids),
                      AboutClient(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
