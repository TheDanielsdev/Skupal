import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/widgets/line_widget.dart';
import 'package:skupal/widgets/most_recent.dart';

import 'package:skupal/widgets/recommended/recommended.dart';
import 'package:skupal/widgets/saved_jobs.dart';

class GigsWidget extends ConsumerStatefulWidget {
  GigsWidget({Key? key}) : super(key: key);

  @override
  GigsWidgetState createState() => GigsWidgetState();
}

class GigsWidgetState extends ConsumerState<GigsWidget> {
  final currentIndexProvider = StateProvider<int>(((ref) => 0));
  final changeColorProvider = StateProvider<bool>(((ref) => false));

  @override
  Widget build(BuildContext context) {
    final _currentIndex = ref.watch(currentIndexProvider);
    final _changeColor = ref.watch(changeColorProvider);
    return DefaultTabController(
      initialIndex: _currentIndex,
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Row(
                  children: [
                    SizedBox(
                      height: 17,
                    ),
                    Text(
                      "Jobs for you",
                      style: TextStyle(
                          fontFamily: 'CerebriSansPro-Regular',
                          fontWeight: FontWeight.w700,
                          fontSize: 15),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
              //TabbarView here
              SizedBox(
                height: 4,
              ),
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
                    ref.watch(currentIndexProvider.state).state = value;
                    ref.watch(changeColorProvider.state).state = true;
                  },
                  tabs: [
                    Tab(
                      child: Text(
                        'Recommended',
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
                        'Most Recent',
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
                    Tab(
                      child: Text(
                        'Saved Jobs',
                        style: TextStyle(
                          color: _currentIndex == 2
                              ? AppColor.Main_Color
                              : AppColor.Neutral3,
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          fontFamily: 'CerebriSansPro-Regular',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Thin1mmLine(color: AppColor.Neutral5),

              Expanded(
                child: Container(
                  child: TabBarView(
                    children: [
                      Recommended(),
                      MostRecent(),
                      SavedJobs(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
