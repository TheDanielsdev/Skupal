import 'package:flutter/material.dart';
import 'package:skupal/my_tests/item.dart';
import 'package:skupal/my_tests/list_con.dart';

final data = MyData.getDatafnc();

class AddFavs extends StatefulWidget {
  AddFavs({Key? key}) : super(key: key);

  @override
  State<AddFavs> createState() => _AddFavsState();
}

class _AddFavsState extends State<AddFavs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, index) {
            return ContainerList(
                title: data[index].title, desc: data[index].desc);
          }),
    );
  }
}
