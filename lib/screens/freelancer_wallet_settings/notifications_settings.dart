import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helper/appcolors.dart';

class NotificationSettings extends ConsumerStatefulWidget {
  NotificationSettings({Key? key}) : super(key: key);

  @override
  NotificationSettingsState createState() => NotificationSettingsState();
}

@override
class NotificationSettingsState extends ConsumerState<NotificationSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Notification Settings',
              style: TextStyle(
                  color: AppColor.Neutral1,
                  fontFamily: 'CerebriSansPro-Regular',
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColor.Neutral1,
                ))),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'APP Notification',
                  style: TextStyle(
                      color: AppColor.Grey2,
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 10),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: AppColor.Grey4),
              SizedBox(height: 31),
              ListTile(
                title: Text(
                  'Notification Settings',
                  style: TextStyle(
                      color: AppColor.Neutral1,
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                subtitle: Text(
                  'If disabled, you will not be able to receive operational Notifications',
                  style: TextStyle(
                      color: AppColor.Neutral3,
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
                trailing: Wrap(spacing: 10, children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Disabled',
                      style: TextStyle(
                          color: AppColor.State_Error,
                          fontFamily: 'CerebriSansPro-Regular',
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColor.Grey3,
                        size: 15,
                      ))
                ]),
              ),
              SizedBox(
                height: 25,
              ),
              ListTile(
                title: Text(
                  'New job listing',
                  style: TextStyle(
                      color: AppColor.Grey1,
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                trailing: Switch(value: false, onChanged: (value) {}),
              ),
              SizedBox(
                height: 41,
              ),
              ListTile(
                title: Text(
                  'Inbox',
                  style: TextStyle(
                      color: AppColor.Grey1,
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                trailing: Switch(value: false, onChanged: (value) {}),
              ),
              SizedBox(
                height: 41,
              ),
              ListTile(
                title: Text(
                  'Contracts',
                  style: TextStyle(
                      color: AppColor.Grey1,
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                trailing: Switch(value: false, onChanged: (value) {}),
              ),
              SizedBox(
                height: 41,
              ),
              ListTile(
                title: Text(
                  'Wallet Transactions',
                  style: TextStyle(
                      color: AppColor.Grey1,
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                trailing: Switch(value: false, onChanged: (value) {}),
              ),
              SizedBox(
                height: 41,
              ),
              ListTile(
                title: Text(
                  'Email Notification',
                  style: TextStyle(
                      color: AppColor.Grey1,
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 41,
              ),
              ListTile(
                title: Text(
                  'Marketing Campaigns',
                  style: TextStyle(
                      color: AppColor.Grey1,
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                trailing: Switch(value: false, onChanged: (value) {}),
              ),
              SizedBox(
                height: 41,
              ),
              ListTile(
                title: Text(
                  'Referral Programs',
                  style: TextStyle(
                      color: AppColor.Grey1,
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                trailing: Switch(value: false, onChanged: (value) {}),
              )
            ],
          ),
        ));
  }
}
