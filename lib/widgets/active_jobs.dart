import 'package:flutter/material.dart';
import 'package:skupal/helper/appcolors.dart';

class ActiveJobs extends StatelessWidget {
  const ActiveJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Padding(padding: EdgeInsets.only(top: 10)),
          ListTile(
            leading: Image.asset(
              'assets/landing1.png',
            ),
            title: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                'Landing Page Design',
                style: TextStyle(
                    fontFamily: 'CerebriSansPro-Regular',
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              ),
            ),
            subtitle: Text(
              'Due March 12',
              style: TextStyle(
                  color: AppColor.Neutral3,
                  fontFamily: 'CerebriSansPro-Regular',
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            ),
            trailing: Text('NGN12,000',
                style: TextStyle(
                    color: AppColor.Neutral3,
                    fontFamily: 'CerebriSansPro-Regular',
                    fontWeight: FontWeight.w500,
                    fontSize: 12)),
          ),
          // Divider(
          //   indent: 20,
          //   endIndent: 40,
          // ),
          ListTile(
            leading: Image.asset(
              'assets/landing2.png',
            ),
            title: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                'Landing Page Design',
                style: TextStyle(
                    fontFamily: 'CerebriSansPro-Regular',
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              ),
            ),
            subtitle: Text(
              'Due March 12',
              style: TextStyle(
                  color: AppColor.Neutral3,
                  fontFamily: 'CerebriSansPro-Regular',
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            ),
            trailing: Text(
              'NGN12,000',
              style: TextStyle(
                  color: AppColor.Neutral3,
                  fontFamily: 'CerebriSansPro-Regular',
                  fontWeight: FontWeight.w500,
                  fontSize: 12),
            ),
          ),
          Center(
            child: Text(
              '+2 more',
              style: TextStyle(
                  color: AppColor.Main_Color,
                  fontFamily: 'CerebriSansPro-Regular',
                  fontWeight: FontWeight.w500,
                  fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
