import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/helper/tabs.dart';
import 'package:skupal/screens/contracts.dart';
import 'package:skupal/screens/inbox.dart';

import 'package:skupal/widgets/gigs_widget.dart';

import '../widgets/dashboard.dart';
import 'freelancer_wallet/wallet.dart';
import 'package:provider/provider.dart' as pvd;

class DashboardC extends ConsumerStatefulWidget {
  const DashboardC({Key? key}) : super(key: key);

  @override
  DashboardCState createState() => DashboardCState();
}

class DashboardCState extends ConsumerState<DashboardC> {
  final currentIndexProvider = StateProvider<int>((ref) => 0);

  @override
  Widget build(BuildContext context) {
    final _currentIndex = ref.watch(currentIndexProvider);
    final List<Widget> _pages = [
      DashBoardWidget(),
      GigsWidget(),
      Contract(),
      Inbox(),
      Wallet()
    ];

    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        body: IndexedStack(
          children: _pages,
          index: _currentIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 15,
            selectedIconTheme: IconThemeData(color: AppColor.Main_Color),
            currentIndex: _currentIndex,
            selectedLabelStyle: const TextStyle(
                fontFamily: 'CerebriSansPro-Regular',
                fontSize: 11,
                fontWeight: FontWeight.w700),
            selectedItemColor: AppColor.Main_Color,
            unselectedLabelStyle: const TextStyle(
                fontFamily: 'CerebriSansPro-Regular',
                fontSize: 9,
                fontWeight: FontWeight.w400),
            onTap: (newIndex) {
              ref.watch(currentIndexProvider.state).state = newIndex;
            },
            items: [
              BottomNavigationBarItem(
                activeIcon: Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'homeActive.png',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    )),
                icon: Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Image.asset(
                    'assets/home.png',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'tasksActive.png',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    )),
                icon: Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'assets/gigs_nav.png',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    )),
                label: 'Tasks',
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'contractActive.png',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    )),
                icon: Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'assets/contract.png',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    )),
                label: 'Contracts',
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'walletActive.png',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    )),
                icon: Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'assets/export.png',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    )),
                label: 'Inbox',
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'activeWallet.png',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    )),
                icon: Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'assets/wallet.png',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    )),
                label: 'Wallet',
              ),
            ]),
      ),
    );
  }
}
