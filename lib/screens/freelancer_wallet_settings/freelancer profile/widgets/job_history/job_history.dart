import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/screens/freelancer_wallet_settings/edit_profile.dart';
import 'package:skupal/screens/freelancer_wallet_settings/freelancer%20profile/widgets/job_history/data/job_history_data.dart';
import 'package:skupal/screens/freelancer_wallet_settings/freelancer%20profile/widgets/job_history/data/job_history_items.dart';
import 'package:skupal/screens/freelancer_wallet_settings/freelancer%20profile/widgets/job_history/widget/job_history_container.dart';
import 'package:skupal/widgets/line_widget.dart';

import '../../../../../helper/appcolors.dart';

final jobDone = Job_History_Data.jobDoneFnc();

class FreelancerJobHistory extends ConsumerStatefulWidget {
  FreelancerJobHistory({Key? key}) : super(key: key);

  @override
  FreelancerJobHistoryState createState() => FreelancerJobHistoryState();
}

@override
class FreelancerJobHistoryState extends ConsumerState<FreelancerJobHistory> {
  // Job_History_Items? jobs;
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: double.infinity,
              height: 147,
              decoration: BoxDecoration(
                  color: AppColor.Rec_79,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: const Offset(
                          0,
                          12,
                        ))
                  ]),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/Augustine.png',
                          width: 45,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('Austine',
                            style: TextStyle(
                                fontFamily: 'CerebriSansPro-Regular',
                                color: AppColor.Neutral1,
                                fontWeight: FontWeight.w500,
                                fontSize: 12)),
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          'assets/verified.png',
                          width: 10,
                        )
                      ],
                    ),
                    // Container(
                    //     alignment: Alignment(-0.9, 0),
                    //     child: Text(
                    //       "satrs",
                    //       style: TextStyle(
                    //           fontFamily: 'CerebriSansPro-Regular',
                    //           color: AppColor.Neutral1,
                    //           fontWeight: FontWeight.w500,
                    //           fontSize: 12),
                    //     )),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => EditProfile()));
                      },
                      child: Container(
                          height: 34,
                          decoration: BoxDecoration(
                              color: AppColor.Main_Color,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  color: AppColor.White_Color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          )),
                    )
                    // TextButton(onPressed: () {}, child: Text('Edit Profile'))
                  ]),
            ),
          ),
          SizedBox(
            height: 19,
          ),
          Thin1mmLine(color: AppColor.Grey4),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Job History (20)',
                style: TextStyle(
                    fontFamily: 'CerebriSansPro-Regular',
                    color: AppColor.Neutral1,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Thin1mmLine(color: AppColor.Grey4),
          ),
          SizedBox(
            height: 8,
          ),
          ListView.separated(
              controller: _scrollController,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: jobDone.length,
              separatorBuilder: (_, __) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Divider(color: AppColor.Grey4),
                  ),
              itemBuilder: (BuildContext context, index) {
                return JobHistoryContainer(
                    title: jobDone[index].title,
                    date: jobDone[index].date,
                    desc: jobDone[index].desc,
                    status: jobDone[index].status,
                    price: jobDone[index].price,
                    priceLabel: jobDone[index].priceLabel);
              })
        ]),
      )),
    );
  }
}
