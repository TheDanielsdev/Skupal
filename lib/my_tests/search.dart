import 'package:flutter/material.dart';
import 'package:skupal/my_tests/home.dart';
import 'package:video_player/video_player.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => Home()));
    });
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('check_mark.gif'))),
        ),
      ),
    );
  }
}
