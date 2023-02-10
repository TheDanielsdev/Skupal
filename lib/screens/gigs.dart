// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import 'package:skupal/helper/appcolors.dart';
// import 'package:skupal/helper/tabs.dart';
// import 'package:skupal/widgets/active_jobs.dart';
// import 'package:skupal/widgets/cancelled_jobs.dart';
// import 'package:skupal/widgets/in_review.dart';

// class Gigs extends StatefulWidget {
//   const Gigs({Key key}) : super(key: key);

//   @override
//   State<Gigs> createState() => _GigsState();
// }

// class _GigsState extends State<Gigs> {
//   int _currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       // initialIndex: _currentIndex,
//       length: 3,
//       child: Scaffold(
//         // appBar: AppBar(
//         //   backgroundColor: Colors.transparent,
//         //   elevation: 0,
//         //   title: Text('Jobs for you'),
//         //   actions: [
//         //     IconButton(
//         //         onPressed: () {
//         //           //handle ontap here
//         //         },
//         //         icon: Icon(Icons.search))
//         //   ],
//         // ),
//         body: tabs[_currentIndex],
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           selectedItemColor: AppColor.Main_Color,
//           type: BottomNavigationBarType.fixed,
//           iconSize: 20,
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.business_center_outlined), label: 'Gigs'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.money_rounded), label: 'Loans')
//           ],
//           onTap: (index) {
//             setState(() {
//               _currentIndex = index;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
