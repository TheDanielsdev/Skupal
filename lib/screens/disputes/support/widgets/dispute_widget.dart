import 'package:flutter/material.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/screens/disputes/chat_single.dart';

class DisputeContainer extends StatelessWidget {
  final String title;
  final String desc;
  const DisputeContainer({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => DisputeChat(title: title)));
        },
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'CerebriSansPro-Regular',
              color: AppColor.Neutral1,
              fontWeight: FontWeight.w500,
              fontSize: 12),
        ),
        subtitle: Text(
          desc,
          style: TextStyle(
              fontFamily: 'CerebriSansPro-Regular',
              color: AppColor.Neutral3,
              fontWeight: FontWeight.w400,
              fontSize: 10),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColor.Grey3,
          size: 12,
        ),
      ),
    );
  }
}
