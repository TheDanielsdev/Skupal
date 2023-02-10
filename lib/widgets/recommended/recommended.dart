import 'package:flutter/material.dart';

import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/models/jobs.dart';
import 'package:skupal/models/jobs_populate.dart';
import 'package:skupal/screens/jobs_single.dart';
import 'package:skupal/widgets/recommended/reco_container.dart';
import 'package:skupal/widgets/recommended/reco_data.dart';

//creating a variable and invoking the jobpopulate class and function inside
final getJobs = Reco_Data.getRecoItems();

class Recommended extends StatelessWidget {
  //bringing in the job class

  Recommended({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(
          height: 1,
          color: AppColor.Neutral5,
        ),
        itemCount: getJobs.length,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemBuilder: (_, index) {
          return RecoContainer(
              avi: getJobs[index].avi,
              name: getJobs[index].name,
              minAgo: getJobs[index].minAgo,
              price: getJobs[index].price,
              title: getJobs[index].title,
              desc: getJobs[index].desc,
              durationInDays: getJobs[index].durationInDays,
              numberOfFiles: getJobs[index].numberOfFiles,
              numberOfBids: getJobs[index].numberOfBids);
        },
      ),
    );
  }
}
