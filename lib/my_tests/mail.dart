import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:skupal/my_tests/search.dart';

class Mail extends StatelessWidget {
  const Mail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => Search()));
    });
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: LinearPercentIndicator(
          animation: true,
          animationDuration: 3000,
          percent: 1.0,
          trailing: Text('100%'),
          progressColor: Colors.red,
        ),
      ),
    );
  }
}
