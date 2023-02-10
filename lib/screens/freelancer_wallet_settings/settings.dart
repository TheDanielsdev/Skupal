import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/screens/freelancer_wallet_settings/appearance/appearance.dart';

class Settings extends ConsumerStatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  SettingsState createState() => SettingsState();
}

@override
class SettingsState extends ConsumerState<Settings> {
  @override
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
                size: 20,
              ))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Settings',
                style: TextStyle(
                    color: AppColor.Neutral1,
                    fontFamily: 'CerebriSansPro-Regular',
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Change password and push notifications etc',
                style: TextStyle(
                    color: AppColor.Neutral3,
                    fontFamily: 'CerebriSansPro-Regular',
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: AppColor.Grey4),
            SizedBox(
              height: 25,
            ),
            ListTile(
                title: Text(
                  'Notification Settings',
                  style: TextStyle(
                      color: AppColor.Grey1,
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                subtitle: Text('Edit your notification settings',
                    style: TextStyle(
                        color: AppColor.Neutral3,
                        fontFamily: 'CerebriSansPro-Regular',
                        fontSize: 10,
                        fontWeight: FontWeight.w400)),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColor.Grey3,
                      size: 15,
                    ))),
            SizedBox(
              height: 30,
            ),
            ListTile(
                title: Text(
                  'Security Settings',
                  style: TextStyle(
                      color: AppColor.Grey1,
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                subtitle: Text('Options to keep your account secure',
                    style: TextStyle(
                        color: AppColor.Neutral3,
                        fontFamily: 'CerebriSansPro-Regular',
                        fontSize: 10,
                        fontWeight: FontWeight.w400)),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColor.Grey3,
                      size: 15,
                    ))),
            SizedBox(
              height: 30,
            ),
            ListTile(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Appearance()));
                },
                title: Text(
                  'Appearance',
                  style: TextStyle(
                      color: AppColor.Grey1,
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                subtitle: Text('Select options to make our app your own',
                    style: TextStyle(
                        color: AppColor.Neutral3,
                        fontFamily: 'CerebriSansPro-Regular',
                        fontSize: 10,
                        fontWeight: FontWeight.w400)),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColor.Grey3,
                      size: 15,
                    )))
          ],
        ),
      ),
    );
  }
}
