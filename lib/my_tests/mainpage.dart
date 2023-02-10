import 'package:flutter/material.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/my_tests/home.dart';
import 'package:skupal/my_tests/mail.dart';
import 'package:skupal/my_tests/search.dart';
import 'package:skupal/my_tests/settings.dart';
import 'package:skupal/my_tests/tabbarmaterial_widget.dart';
import 'package:skupal/screens/freelancer_wallet_settings/profile_settings.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  var isOpened = false;
  final List _pages = [Home(), Search(), Setting(), Mail()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[index],
      bottomNavigationBar: TabBarMaterialWidget(
        index: index,
        onChangedTab: onChangedTab,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.State_Error,
        elevation: 2,
        child: isOpened ? Icon(Icons.close) : Icon(Icons.add),
        onPressed: () {
          setState(() {
            isOpened = !isOpened;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  void onChangedTab(int itemIndex) {
    setState(() {
      this.index = itemIndex;
    });
  }
}
