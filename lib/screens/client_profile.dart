import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/screens/about.dart';
import 'package:skupal/screens/reviews.dart';
import 'package:skupal/widgets/job_history.dart';

class ClientProfile extends ConsumerStatefulWidget {
  ClientProfile({Key? key}) : super(key: key);

  @override
  ClientProfileState createState() => ClientProfileState();
}

final currentIndexProvider = StateProvider<int>(((ref) => 0));

@override
class ClientProfileState extends ConsumerState<ClientProfile> {
  @override
  Widget build(BuildContext context) {
    final _currentIndex = ref.watch(currentIndexProvider);
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColor.Neutral1,
                      )),
                  Spacer(),
                  Wrap(
                    spacing: 20,
                    children: [
                      Icon(
                        Icons.flag_outlined,
                        color: AppColor.Main_Color,
                      ),
                      Text(
                        'Report',
                        style: TextStyle(
                          color: AppColor.Main_Color,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'CerebriSansPro-Regular',
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                child: TabBar(
                    indicatorColor: AppColor.Main_Color,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                    onTap: (value) {
                      ref.watch(currentIndexProvider.state).state = value;
                    },
                    tabs: [
                      Tab(
                        child: Text(
                          'About',
                          style: TextStyle(
                              fontFamily: 'CerebriSansPro-Regular',
                              fontWeight: FontWeight.w500,
                              color: _currentIndex == 0
                                  ? AppColor.Main_Color
                                  : AppColor.Neutral3),
                        ),
                      ),
                      Tab(
                        child: Text('Job History',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'CerebriSansPro-Regular',
                                color: _currentIndex == 1
                                    ? AppColor.Main_Color
                                    : AppColor.Neutral3)),
                      ),
                      Tab(
                        child: Text('Reviews',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'CerebriSansPro-Regular',
                                color: _currentIndex == 2
                                    ? AppColor.Main_Color
                                    : AppColor.Neutral3)),
                      )
                    ]),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: AppColor.Neutral5),
            Expanded(
                child: Container(
              child: TabBarView(children: [About(), JobHistory(), Reviews()]),
            ))
          ],
        ),
      ),
    );
  }
}
