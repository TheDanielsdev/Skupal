// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:skupal/my_tests/list_data.dart';
// import 'package:skupal/my_tests/list_item.dart';

// import '../helper/appcolors.dart';

// final data = Lits_Data.getItems();

// class Okay extends StatefulWidget {
//   const Okay({Key? key}) : super(key: key);

//   @override
//   State<Okay> createState() => _OkayState();
// }

// class _OkayState extends State<Okay> {
//   List items = [];
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(actions: [
//         IconButton(
//             onPressed: () {
//               _showModal(context);
//             },
//             icon: Icon(Icons.add))
//       ]),
//       body: ListView.builder(
//           itemCount: items.length,
//           itemBuilder: (_, index) {
//             return TextField(
//               decoration: InputDecoration(
//                   hintText: data[index].itemName,
//                   suffixIcon: data[index].suffixIcon,
//                   prefixIcon: data[index].prefixImage),
//             );
//           }),
//     );
//   }

//   Future<void> _showModal(BuildContext context) {
//     return showModalBottomSheet<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           color: Color(0xFF737373),
//           child: Container(
//             decoration: BoxDecoration(
//                 color: Theme.of(context).canvasColor,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20))),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(children: [
//                 Container(
//                   margin: EdgeInsets.only(top: 10),
//                   alignment: Alignment.topCenter,
//                   height: 5,
//                   width: 59,
//                   decoration: BoxDecoration(
//                       color: AppColor.Grey5,
//                       borderRadius: BorderRadius.circular(20)),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                       itemCount: data.length,
//                       itemBuilder: (_, index) {
//                         return items.contains(data[index])
//                             ? Container()
//                             : ListTile(
//                                 onTap: () {
//                                   Navigator.pop(context);

//                                   setState(() {
//                                     items.add(data[index]);
//                                   });
//                                 },
//                                 leading: data[index].prefixImage,
//                                 title: Text(data[index].itemName),
//                               );
//                       }),
//                 ),
               
//               ]),
//             )