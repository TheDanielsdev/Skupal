import 'package:skupal/my_tests/data_class.dart';

class MyData {
  static List<Data> getDatafnc() {
    return [
      Data(title: 'first', desc: 'Hello'),
      Data(title: 'Second', desc: 'Hello')
    ];
  }
}
