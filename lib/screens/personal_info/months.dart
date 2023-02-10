import 'package:flutter/material.dart';

import '../../helper/appcolors.dart';

class Months extends StatelessWidget {
  String months;
  Months({Key? key, required this.months}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        months,
        style: TextStyle(
          color: AppColor.Neutral3,
          fontWeight: FontWeight.w700,
          fontSize: 20,
          fontFamily: 'CerebriSansPro-Regular',
        ),
      ),
    );
  }
}
