import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/my_tests/settings.dart';
import 'package:skupal/screens/dashboard_c.dart';
import 'package:skupal/screens/freelancer_wallet_settings/freelancer%20profile/freelancer_profile.dart';
import 'package:skupal/screens/freelancer_wallet_settings/manage_socials.dart';
import 'package:skupal/screens/freelancer_wallet_settings/portfolio.dart';
import 'package:skupal/screens/freelancer_wallet_settings/settings.dart';

class ProfileSettings extends ConsumerStatefulWidget {
  ProfileSettings({Key? key}) : super(key: key);

  @override
  ProfileSettingsState createState() => ProfileSettingsState();
}

@override
class ProfileSettingsState extends ConsumerState<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Main_Color,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: GestureDetector(
                            //will remove later
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DashboardC()));
                            },
                            child: Image.asset('assets/Augustine.png')),
                      ),
                      SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Text(
                          'Austine',
                          style: TextStyle(
                              fontFamily: 'CerebriSansPro-Regular',
                              color: AppColor.White_Color,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                      Spacer(
                        flex: 10,
                      ),
                      Image.asset('assets/verified.png',
                          width: 16, height: 16, color: AppColor.White_Color),
                      SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Image.asset('assets/bell.png',
                              width: 16, color: AppColor.White_Color),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                )
              ],
            ),
            GestureDetector(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment(0, -1.03),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.elliptical(50, 50),
                          topLeft: Radius.elliptical(50, 50)),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.topCenter,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          blurRadius: 10,
                                          spreadRadius: 0,
                                          offset: const Offset(
                                            0,
                                            12,
                                          )),
                                    ]),
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.93,
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      Text('Your wallet balance',
                                          style: TextStyle(
                                              fontFamily:
                                                  'CerebriSansPro-Regular',
                                              color: AppColor.Neutral1,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12)),
                                      Spacer(),
                                      Text('500,000.00 NGN',
                                          style: TextStyle(
                                              fontFamily:
                                                  'CerebriSansPro-Regular',
                                              color: AppColor.Main_Color,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12))
                                    ],
                                  ),
                                )),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: Container(
                                      child: Text('My Account',
                                          style: TextStyle(
                                              fontFamily:
                                                  'CerebriSansPro-Regular',
                                              color: AppColor.Neutral1,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 21.5,
                                  ),
                                  ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  FreelancerProfile()));
                                    },
                                    leading:
                                        Image.asset('assets/myprofile.png'),
                                    title: Text('My Profile',
                                        style: TextStyle(
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            color: AppColor.Grey1,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12)),
                                    trailing: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: AppColor.Neutral3,
                                          size: 12,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListTile(
                                    leading:
                                        Image.asset('assets/myprofile.png'),
                                    title: Text('Loans',
                                        style: TextStyle(
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            color: AppColor.Grey1,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12)),
                                    trailing: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: AppColor.Neutral3,
                                          size: 12,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListTile(
                                    leading: Image.asset('assets/earningg.png'),
                                    title: Text('Earnings',
                                        style: TextStyle(
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            color: AppColor.Grey1,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12)),
                                    trailing: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: AppColor.Neutral3,
                                          size: 12,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => PortFolio()));
                                    },
                                    leading: Image.asset('assets/earningg.png'),
                                    title: Text('Manage Portfolio',
                                        style: TextStyle(
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            color: AppColor.Grey1,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12)),
                                    trailing: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: AppColor.Neutral3,
                                          size: 12,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => ManageSocial()));
                                    },
                                    leading: Image.asset('assets/earningg.png'),
                                    title: Text('Social Networks',
                                        style: TextStyle(
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            color: AppColor.Grey1,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12)),
                                    trailing: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: AppColor.Neutral3,
                                          size: 12,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListTile(
                                    leading: Image.asset('assets/earningg.png'),
                                    title: Text('Manage Skills',
                                        style: TextStyle(
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            color: AppColor.Grey1,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12)),
                                    trailing: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: AppColor.Neutral3,
                                          size: 12,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Container(
                                    child: Text('General',
                                        style: TextStyle(
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            color: AppColor.Neutral1,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15)),
                                  ),
                                  SizedBox(
                                    height: 21.5,
                                  ),
                                  ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => Settings()));
                                    },
                                    leading: Icon(
                                      Icons.settings,
                                    ),
                                    title: Text('Settings',
                                        style: TextStyle(
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            color: AppColor.Grey1,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12)),
                                    trailing: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: AppColor.Neutral3,
                                          size: 12,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListTile(
                                    leading: Image.asset('assets/web.png'),
                                    title: Text('Help & Support',
                                        style: TextStyle(
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            color: AppColor.Grey1,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12)),
                                    trailing: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: AppColor.Neutral3,
                                          size: 12,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListTile(
                                    leading: Image.asset('assets/share2.png'),
                                    title: Text('Share The App',
                                        style: TextStyle(
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            color: AppColor.Grey1,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12)),
                                    trailing: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: AppColor.Neutral3,
                                          size: 12,
                                        )),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 20))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
