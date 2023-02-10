import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/screens/freelancer_wallet_settings/change_pwd.dart';

import '../../helper/appcolors.dart';

class Security extends ConsumerStatefulWidget {
  Security({Key? key}) : super(key: key);

  @override
  SecurityState createState() => SecurityState();
}

class SecurityState extends ConsumerState<Security> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.Neutral1,
              ))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 27,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Security',
              style: TextStyle(
                  color: AppColor.Neutral1,
                  fontFamily: 'CerebriSansPro-Regular',
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 39,
          ),
          ListTile(
              title: Text(
                'Enable 2-Factor Authentication',
                style: TextStyle(
                    color: AppColor.Grey1,
                    fontFamily: 'CerebriSansPro-Regular',
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              trailing: Switch(value: false, onChanged: (value) {})),
          SizedBox(
            height: 40,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ChangePwd()));
            },
            title: Text(
              'Password',
              style: TextStyle(
                  color: AppColor.Grey1,
                  fontFamily: 'CerebriSansPro-Regular',
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            trailing: Wrap(spacing: 10, children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Change',
                  style: TextStyle(
                      color: AppColor.Grey3,
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColor.Grey3,
                    size: 15,
                  ))
            ]),
          ),
          SizedBox(
            height: 38,
          ),
          ListTile(
            title: Text(
              'Transaction PIN',
              style: TextStyle(
                  color: AppColor.Grey1,
                  fontFamily: 'CerebriSansPro-Regular',
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            trailing: Wrap(spacing: 10, children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Change',
                  style: TextStyle(
                      color: AppColor.Grey3,
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColor.Grey3,
                    size: 15,
                  ))
            ]),
          ),
        ],
      ),
    );
  }
}
