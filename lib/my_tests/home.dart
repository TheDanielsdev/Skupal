import 'package:flutter/material.dart';
import 'package:skupal/my_tests/mail.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Mail()));
          },
          child: Container(
              color: Color.fromARGB(255, 83, 169, 239),
              width: 100,
              height: 100,
              child: Center(child: Text('Next'))),
        ),
      ),
    );
  }
}
