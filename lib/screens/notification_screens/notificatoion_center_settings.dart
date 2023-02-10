import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helper/appcolors.dart';

class NotificationCenterSettings extends ConsumerStatefulWidget {
  NotificationCenterSettings({Key? key}) : super(key: key);

  @override
  NotificationCenterSettingsState createState() =>
      NotificationCenterSettingsState();
}

@override
class NotificationCenterSettingsState
    extends ConsumerState<NotificationCenterSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColor.Neutral1,
                size: 20,
              )),
          title: Text(
            'Settings',
            style: TextStyle(
              color: AppColor.Neutral1,
              fontWeight: FontWeight.w700,
              fontFamily: 'CerebriSansPro-Regular',
            ),
          ),
          centerTitle: true,
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         //handle navigation to the notification settings screen.
          //         Navigator.of(context).push(MaterialPageRoute(
          //             builder: (_) => NotificationCenterSettings()));
          //       },
          //       icon: Icon(
          //         Icons.settings_outlined,
          //         color: AppColor.Neutral1,
          //       ))
          // ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Con1(),
            SizedBox(
              height: 5,
            ),
            Con2(),
            SizedBox(
              height: 5,
            ),
            Con3()
          ]),
        ));
  }
}

class Con1 extends StatelessWidget {
  const Con1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: AppColor.White_Color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/sms.png'),
                SizedBox(
                  width: 15,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'SMS',
                    style: TextStyle(
                      color: AppColor.Neutral1,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: 'CerebriSansPro-Regular',
                    ),
                  ),
                ),
                Spacer(),
                Switch(value: false, onChanged: (value) {})
              ],
            ),
            //here

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
              ),
              child: Text(
                'Send notifications to your mobile number.',
                maxLines: 3,
                style: TextStyle(
                  color: AppColor.Neutral3,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Con2 extends StatelessWidget {
  const Con2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: AppColor.White_Color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/email.png'),
                SizedBox(
                  width: 15,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Email',
                    style: TextStyle(
                      color: AppColor.Neutral1,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: 'CerebriSansPro-Regular',
                    ),
                  ),
                ),
                Spacer(),
                Switch(value: false, onChanged: (value) {})
              ],
            ),
            //here

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
              ),
              child: Text(
                'Send notifications to your email address.',
                maxLines: 3,
                style: TextStyle(
                  color: AppColor.Neutral3,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Con3 extends StatelessWidget {
  const Con3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: AppColor.White_Color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/vibrate.png'),
                SizedBox(
                  width: 15,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Push Notifications',
                    style: TextStyle(
                      color: AppColor.Neutral1,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: 'CerebriSansPro-Regular',
                    ),
                  ),
                ),
                Spacer(),
                Switch(value: false, onChanged: (value) {})
              ],
            ),
            //here

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
              ),
              child: Text(
                'Receive notifications on your device.',
                maxLines: 3,
                style: TextStyle(
                  color: AppColor.Neutral3,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
