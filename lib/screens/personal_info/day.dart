import 'package:flutter/material.dart';

import '../../helper/appcolors.dart';

class Day extends StatelessWidget {
  int days;
  Day({Key? key, required this.days}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          days.toString(),
          style: TextStyle(
            color: AppColor.Neutral3,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            fontFamily: 'CerebriSansPro-Regular',
          ),
        ),
      ),
    );
  }
}
