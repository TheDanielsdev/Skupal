import 'package:flutter/material.dart';

extension CustomWidget on Widget {
  Widget center() {
    return Center(
      child: this,
    );
  }
}

extension CustomString on String {
  bool get isEmailValid {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  }
}

extension CustomDataType on dynamic {
  String valueToString() {
    return this.toString();
  }
}
