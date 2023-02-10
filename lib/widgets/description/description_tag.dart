import 'package:flutter/material.dart';

class DescChip extends StatelessWidget {
  String name;
  DescChip({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Chip(label: Text(name)),
    );
  }
}
