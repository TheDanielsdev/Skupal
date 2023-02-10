import 'package:flutter/material.dart';

import '../../../../../../helper/appcolors.dart';

class ReviewWidget extends StatelessWidget {
  final String tag;
  const ReviewWidget({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 30),
      child: Chip(
        label: Text(tag,
            style: TextStyle(
                fontFamily: 'CerebriSansPro-Regular',
                color: AppColor.Neutral3,
                fontWeight: FontWeight.w500,
                fontSize: 8.8)),
        backgroundColor: AppColor.Subtle,
        clipBehavior: Clip.none,
      ),
    );
  }
}
