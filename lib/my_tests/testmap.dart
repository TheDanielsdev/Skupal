import 'package:flutter/material.dart';
import 'package:skupal/my_tests/map.dart';

class TestMap extends StatefulWidget {
  TestMap({Key? key}) : super(key: key);

  @override
  State<TestMap> createState() => _TestMapState();
}

class _TestMapState extends State<TestMap> {
  TextEditingController _myController = TextEditingController();

  @override
  void initState() {
    _myController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _myController,
                decoration: InputDecoration(label: Text('Enter name')),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  MyMap.myMap.addAll({'Name': _myController.text});
                  for (final n in MyMap.myMap.keys) {
                    if (MyMap.myMap.containsKey('Name')) {
                      print(n);
                    }
                  }
                  final checkMap = MyMap.myMap.containsKey('Name');
                  print(MyMap.myMap);
                  print(checkMap);
                },
                icon: Icon(Icons.launch),
                label: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
