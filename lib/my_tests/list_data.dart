import 'package:flutter/material.dart';
import 'package:skupal/my_tests/list_item.dart';

class Lits_Data {
  static List<Lits_items> getItems() {
    return [
      Lits_items(
          prefixImage: Image.asset('linkedin.png'),
          suffixIcon: Icon(Icons.delete),
          itemName: 'LinkedIN'),
      Lits_items(
          prefixImage: Image.asset('flutter_wave.png'),
          suffixIcon: Icon(Icons.delete),
          itemName: 'Facebook'),
    ];
  }
}
