import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/screens/freelancer_wallet_settings/freelancer%20profile/widgets/about.dart';
import 'package:skupal/screens/freelancer_wallet_settings/freelancer%20profile/widgets/job_history/job_history.dart';
import 'package:skupal/screens/freelancer_wallet_settings/freelancer%20profile/widgets/reviews/reviews.dart';
import 'package:skupal/widgets/line_widget.dart';

import '../../../helper/appcolors.dart';

class FreelancerProfile extends ConsumerStatefulWidget {
  FreelancerProfile({Key? key}) : super(key: key);

  @override
  FreelancerProfileState createState() => FreelancerProfileState();
}

@override
class FreelancerProfileState extends ConsumerState<FreelancerProfile> {
  final changeColorProvider = StateProvider<bool>(((ref) => false));
  final currentIndexProvider = StateProvider<int>(((ref) => 0));

  @override
  Widget build(BuildContext context) {
    final isChangeColor = ref.watch(changeColorProvider);
    final _currentIndex = ref.watch(currentIndexProvider);
    return DefaultTabController(
      initialIndex: _currentIndex,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.Neutral1,
                size: 20,
              )),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Tabbar here
            Padding(
              padding: const EdgeInsets.only(),
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                // height: 50,
                child: TabBar(
                  physics: NeverScrollableScrollPhysics(),
                  indicatorColor: AppColor.Main_Color,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: AppColor.Neutral3,
                  isScrollable: false,
                  onTap: (value) {
                    ref.watch(currentIndexProvider.state).state = value;
                  },
                  tabs: [
                    Tab(
                      child: Text(
                        'About',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'CerebriSansPro-Regular',
                            color: _currentIndex == 0
                                ? AppColor.Main_Color
                                : AppColor.Neutral3),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Job History',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'CerebriSansPro-Regular',
                            color: _currentIndex == 1
                                ? AppColor.Main_Color
                                : AppColor.Neutral3),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Reviews',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'CerebriSansPro-Regular',
                            color: _currentIndex == 2
                                ? AppColor.Main_Color
                                : AppColor.Neutral3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Thin1mmLine(color: AppColor.Grey4),
//TabbarView here
            Expanded(
              child: Container(
                child: TabBarView(
                  children: [
                    FreelancerProfileAbout(),
                    FreelancerJobHistory(),
                    FreelancerProfileReview()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
