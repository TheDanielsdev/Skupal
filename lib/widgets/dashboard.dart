import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:skupal/components/custom_snackbar.dart';
import 'package:skupal/enums.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/models/profile_completeness.dart';
import 'package:skupal/models/user.dart';
import 'package:skupal/my_tests/settings.dart';
import 'package:skupal/screens/freelancer_wallet_settings/appearance/model/theme_provider.dart';
import 'package:skupal/screens/freelancer_wallet_settings/freelancer%20profile/freelancer_profile.dart';
import 'package:skupal/screens/freelancer_wallet_settings/profile_settings.dart';
import 'package:skupal/screens/freelancer_wallet_settings/settings.dart';
import 'package:skupal/screens/notification_screens/notification_center.dart';
import 'package:skupal/services/skupal_repo.dart';
import 'package:skupal/widgets/active_jobs.dart';
import 'package:skupal/widgets/cancelled_jobs.dart';
import 'package:skupal/widgets/in_review.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart' as pvd;
import 'package:skupal/extensions/custom_extension.dart';
import 'dart:io' show Platform;

final _currentUserProvider = StateProvider<User?>((ref) => null);
final _profCompProvider = StateProvider<ProfileCompletion?>((ref) => null);

final logger = Logger();

class DashBoardWidget extends ConsumerWidget {
  DashBoardWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actualWidth = MediaQuery.of(context).size.width;
    final currentUser = ref.watch(_currentUserProvider);
    final profComp = ref.watch(_profCompProvider);

    ref.watch(userProvider.future).then((value) {
      ref.read(_currentUserProvider.notifier).state = value.data;
    }).catchError((error) {
      switch (error.runtimeType) {
        case DioError:
          {
            // Here's the sample to get the failed response error code and message
            final res = (error as DioError).response;
            logger.e("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
          }
          break;
        default:
          break;
      }
      showSnackBar(
          context: context,
          messageType: Message.warning,
          snackText: "Error Loading Profile!");
    });

    ref.watch(pofileCompletion.future).then((value) {
      ref.read(_profCompProvider.notifier).state =
          value.data! as ProfileCompletion?;
    }).catchError((error) {
      switch (error.runtimeType) {
        case DioError:
          {
            final res = (error as DioError).response;
            logger.e("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
          }
          break;
        default:
          break;
      }
      showSnackBar(
          context: context,
          messageType: Message.warning,
          snackText: "Can't get profile completion");
    });

    TabController _tabController;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 272,
            decoration: BoxDecoration(color: AppColor.Main_Color),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 21),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ProfileSettings()));
                                },
                                child: ClipOval(
                                  clipBehavior: Clip.none,
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    child: Image.asset(
                                      'assets/Augustine.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                )),
                          ),
                          SizedBox(width: 12),
                          // Platform.isAndroid ? Text('IoS') : Text(''),
                          Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: LayoutBuilder(
                              builder: (_, size) {
                                return Text(
                                  'Hi, ${currentUser?.firstName ?? "User"}',
                                  overflow: size.maxWidth < 275
                                      ? TextOverflow.ellipsis
                                      : TextOverflow.visible,
                                  style: TextStyle(
                                      fontFamily: 'CerebriSansPro-Regular',
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.White_Color,
                                      fontSize: 14),
                                );
                              },
                            ),
                          ),
                          Spacer(),
                          Image.asset('assets/verified.png',
                              width: 16, color: AppColor.White_Color),
                          SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (_) => NotificationCenter()));
                              },
                              child: Image.asset('assets/bell.png',
                                  width: 16, color: AppColor.White_Color),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Center(
                        child: Stack(
                          children: [
                            Positioned(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  'Your Earnings',
                                  style: TextStyle(
                                      fontFamily: 'CerebriSansPro-Regular',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                      color: AppColor.White_Color),
                                ).center(),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text(
                                "${currentUser?.totalEarnings.valueToString() ?? '\$ 10,000.00'}",
                                style: TextStyle(
                                    fontFamily: 'CerebriSansPro-Regular',
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.White_Color,
                                    fontSize: 24),
                              ).center(),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 26,
                    ),

                    //here
                    Center(
                      child: Wrap(
                        spacing: 14,
                        runSpacing: 10,
                        runAlignment: WrapAlignment.center,
                        children: [
                          //Invest button
                          LayoutBuilder(builder: (_, size) {
                            return Container(
                                width: size.maxWidth < 378 ? 209 : 105,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: AppColor.White_Color,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                margin:
                                    EdgeInsets.only(top: 0, left: 0, right: 0),
                                child: Text(
                                  'Invest',
                                  style: TextStyle(
                                      fontFamily: 'CerebriSansPro-Regular',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.Main_Color),
                                ).center());
                          }),

                          //withraw button
                          Container(
                              width: 209,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: AppColor.White_Color,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              margin:
                                  EdgeInsets.only(top: 0, left: 0, right: 0),
                              child: Text(
                                'Withdraw funds',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'CerebriSansPro-Regular',
                                    color: AppColor.Main_Color),
                              ).center()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //second container begins here
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 23,
              ),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 31)),
                  _badgeArea(),
                  SizedBox(
                    height: 23,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      height: 64,
                      decoration: BoxDecoration(
                        color: AppColor.White_Color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Profile completeness',
                                    style: TextStyle(
                                      fontFamily: 'CerebriSansPro-Regular',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 11,
                              ),
                              LinearPercentIndicator(
                                width: 175,
                                lineHeight: 7,
                                animation: true,
                                animationDuration: 2000,
                                percent: profComp?.data ?? 0.0,
                                progressColor: AppColor.Main_Color,
                                barRadius: Radius.circular(10),
                                trailing: Text(
                                  "${profComp?.data.valueToString() ?? '0%'}",
                                  style: TextStyle(
                                      fontFamily: 'CerebriSansPro-Regular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            child: Image.asset(
                              'assets/todo.png',
                              width: 20.03,
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //tabbar
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.White_Color),
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: TabBar(
                            indicatorColor: AppColor.Main_Color,
                            indicatorSize: TabBarIndicatorSize.label,
                            unselectedLabelColor: AppColor.Neutral3,
                            isScrollable: true,
                            onTap: (value) {},
                            tabs: [
                              Tab(
                                child: Text(
                                  'Active jobs',
                                  style: TextStyle(
                                      fontFamily: 'CerebriSansPro-Regular',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.Neutral3),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'In review',
                                  style: TextStyle(
                                      fontFamily: 'CerebriSansPro-Regular',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.Neutral3),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Cancelled Jobs',
                                  style: TextStyle(
                                      fontFamily: 'CerebriSansPro-Regular',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.Neutral3),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //tabbarView
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.White_Color),
                            boxShadow: [BoxShadow()],
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: TabBarView(
                          children: [
                            ActiveJobs(),
                            InReview(),
                            CancelledJobs(),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          //everything should be in this container above
        ],
      ),
    );
  }

  // Future<UserResult> getCurrentUser(WidgetRef ref, BuildContext context) async {
  //   var user = await ref.watch(userProvider.future);
  //   return user;
  // }
}

class _badgeArea extends StatelessWidget {
  const _badgeArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 36,
      runSpacing: 20,
      runAlignment: WrapAlignment.center,
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CircularPercentIndicator(
              animation: true,
              animationDuration: 2000,
              animateFromLastPercent: true,
              radius: 30,
              lineWidth: 2,
              backgroundColor: AppColor.Vector,
              center: Image.asset(
                'assets/accolade.png',
                width: 18,
              )),
          SizedBox(
            height: 5,
          ),
          Text(
            "Rising Star",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'CerebriSansPro-Regular',
            ),
          ),
        ]),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircularPercentIndicator(
              animation: true,
              animationDuration: 2000,
              radius: 30,
              percent: 0.8,
              lineWidth: 2,
              progressColor: Colors.lightGreenAccent[400],
              center: Text(
                '80%',
                style: TextStyle(
                    fontFamily: 'CerebriSansPro-Regular',
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Job Score",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'CerebriSansPro-Regular',
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircularPercentIndicator(
                circularStrokeCap: CircularStrokeCap.round,
                animation: true,
                animationDuration: 2000,
                radius: 30,
                percent: 0.6,
                lineWidth: 2,
                progressColor: Colors.yellowAccent[700],
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.star,
                        size: 11.05, color: Colors.yellowAccent[700]),
                    Text(
                      '3.8',
                      style: TextStyle(
                          fontFamily: 'CerebriSansPro-Regular',
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )),
            SizedBox(
              height: 5,
            ),
            Text(
              "Ratings",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'CerebriSansPro-Regular',
              ),
            ),
          ],
        )
      ],
    );
  }
}
