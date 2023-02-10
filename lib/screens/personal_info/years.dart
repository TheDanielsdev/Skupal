import 'package:flutter/material.dart';

import '../../helper/appcolors.dart';

class Year extends StatelessWidget {
  int years;
  Year({Key? key, required this.years}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          years < 25 ? "19" + years.toString() : "20" + years.toString(),
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
