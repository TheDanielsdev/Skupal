import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/screens/notification_screens/notificatoion_center_settings.dart';

import '../../helper/appcolors.dart';

class NotificationCenter extends ConsumerStatefulWidget {
  NotificationCenter({Key? key}) : super(key: key);

  @override
  NotificationCenterState createState() => NotificationCenterState();
}

@override
class NotificationCenterState extends ConsumerState<NotificationCenter> {
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
          'Notifications',
          style: TextStyle(
            color: AppColor.Neutral1,
            fontWeight: FontWeight.w700,
            fontFamily: 'CerebriSansPro-Regular',
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                //handle navigation to the notification settings screen.
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => NotificationCenterSettings()));
              },
              icon: Icon(
                Icons.settings_outlined,
                color: AppColor.Neutral1,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Today",
                  style: TextStyle(
                    color: AppColor.Neutral3,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    fontFamily: 'CerebriSansPro-Regular',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Con1(),
              Container(
                height: 1,
                color: AppColor.Irish_light,
              ),
              Con2(),
              Container(
                height: 1,
                color: AppColor.Irish_light,
              ),
              Con3(),
              Container(
                height: 1,
                color: AppColor.Irish_light,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Earlier",
                  style: TextStyle(
                    color: AppColor.Neutral3,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    fontFamily: 'CerebriSansPro-Regular',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Con4(),
              Container(
                height: 1,
                color: AppColor.Irish_light,
              ),
              // Con5(),
              // Container(
              //   height: 1,
              //   color: AppColor.Irish_light,
              // ),
              SizedBox(
                height: 69,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Mark all as read',
                  style: TextStyle(
                    color: AppColor.Main_Color,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: 'CerebriSansPro-Regular',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
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
      height: 115,
      color: AppColor.White_Color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColor.Main_Color,
                      borderRadius: BorderRadius.circular(50)),
                  child: Image.asset(
                    'assets/person.png',
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Login Activity',
                    style: TextStyle(
                      color: AppColor.Neutral1,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: 'CerebriSansPro-Regular',
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                      color: AppColor.Main_Color,
                      borderRadius: BorderRadius.circular(50)),
                )
              ],
            ),
            //here
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 55,
              ),
              child: Text(
                'A recent sign-in to your Skupal account (franklycr8tive) from an unknown device or browser.',
                maxLines: 3,
                style: TextStyle(
                  color: AppColor.Neutral3,
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 5),
              child: Text(
                'Just Now',
                style: TextStyle(
                  color: AppColor.Neutral4,
                  fontWeight: FontWeight.w500,
                  fontSize: 8,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
            )
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
      height: 115,
      color: AppColor.White_Color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColor.Main_Color,
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.business_center,
                      color: AppColor.White_Color,
                      size: 20,
                    )),
                SizedBox(
                  width: 15,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Closed jobs',
                    style: TextStyle(
                      color: AppColor.Neutral1,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: 'CerebriSansPro-Regular',
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                      color: AppColor.Main_Color,
                      borderRadius: BorderRadius.circular(50)),
                )
              ],
            ),
            //here
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 55,
              ),
              child: Text(
                'A job that you submitted a bid for, Rockstar Web Designer, has been closed or has expired. Your bid has been archived.',
                maxLines: 3,
                style: TextStyle(
                  color: AppColor.Neutral3,
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 5),
              child: Text(
                'Just Now',
                style: TextStyle(
                  color: AppColor.Neutral4,
                  fontWeight: FontWeight.w500,
                  fontSize: 8,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
            )
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
      height: 115,
      color: AppColor.White_Color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColor.Main_Color,
                        borderRadius: BorderRadius.circular(50)),
                    child: Image.asset('assets/hand.png')),
                SizedBox(
                  width: 15,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Withdrawal',
                    style: TextStyle(
                      color: AppColor.Neutral1,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: 'CerebriSansPro-Regular',
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                      color: AppColor.Main_Color,
                      borderRadius: BorderRadius.circular(50)),
                )
              ],
            ),
            //here
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 55,
              ),
              child: Text(
                'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                maxLines: 3,
                style: TextStyle(
                  color: AppColor.Neutral3,
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 5),
              child: Text(
                'Just Now',
                style: TextStyle(
                  color: AppColor.Neutral4,
                  fontWeight: FontWeight.w500,
                  fontSize: 8,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Con4 extends StatelessWidget {
  const Con4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 115,
      color: AppColor.White_Color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColor.Neutral2,
                      borderRadius: BorderRadius.circular(50)),
                  child: Image.asset(
                    'assets/person.png',
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Login Activity',
                    style: TextStyle(
                      color: AppColor.Neutral1,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: 'CerebriSansPro-Regular',
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                      color: AppColor.Neutral2,
                      borderRadius: BorderRadius.circular(50)),
                )
              ],
            ),
            //here
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 55,
              ),
              child: Text(
                'A recent sign-in to your Skupal account (franklycr8tive) from an unknown device or browser.',
                maxLines: 3,
                style: TextStyle(
                  color: AppColor.Neutral3,
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 5),
              child: Text(
                'Just Now',
                style: TextStyle(
                  color: AppColor.Neutral4,
                  fontWeight: FontWeight.w500,
                  fontSize: 8,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Con5 extends StatelessWidget {
  const Con5({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 115,
      color: AppColor.White_Color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColor.Neutral2,
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.business_center,
                      color: AppColor.White_Color,
                      size: 20,
                    )),
                SizedBox(
                  width: 15,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Closed jobs',
                    style: TextStyle(
                      color: AppColor.Neutral1,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: 'CerebriSansPro-Regular',
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                      color: AppColor.Neutral2,
                      borderRadius: BorderRadius.circular(50)),
                )
              ],
            ),
            //here
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 55,
              ),
              child: Text(
                'A job that you submitted a bid for, Rockstar Web Designer, has been closed or has expired. Your bid has been archived.',
                maxLines: 3,
                style: TextStyle(
                  color: AppColor.Neutral3,
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 5),
              child: Text(
                'Just Now',
                style: TextStyle(
                  color: AppColor.Neutral4,
                  fontWeight: FontWeight.w500,
                  fontSize: 8,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
