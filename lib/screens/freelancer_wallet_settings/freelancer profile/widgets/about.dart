import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/screens/freelancer_wallet_settings/data/portfolio_items.dart';
import 'package:skupal/screens/freelancer_wallet_settings/edit_profile.dart';
import 'package:skupal/widgets/line_widget.dart';

class FreelancerProfileAbout extends ConsumerStatefulWidget {
  FreelancerProfileAbout({Key? key}) : super(key: key);

  @override
  FreelancerProfileAboutState createState() => FreelancerProfileAboutState();
}

@override
class FreelancerProfileAboutState
    extends ConsumerState<FreelancerProfileAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 147,
                  decoration: BoxDecoration(
                      color: AppColor.Rec_79,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: const Offset(
                              0,
                              12,
                            ))
                      ]),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/Augustine.png',
                              width: 45,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text('Austine',
                                style: TextStyle(
                                    fontFamily: 'CerebriSansPro-Regular',
                                    color: AppColor.Neutral1,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12)),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              'assets/verified.png',
                              width: 10,
                            )
                          ],
                        ),
                        // Container(
                        //     alignment: Alignment(-0.9, 0),
                        //     child: Text(
                        //       "satrs",
                        //       style: TextStyle(
                        //           fontFamily: 'CerebriSansPro-Regular',
                        //           color: AppColor.Neutral1,
                        //           fontWeight: FontWeight.w500,
                        //           fontSize: 12),
                        //     )),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => EditProfile()));
                          },
                          child: Container(
                              height: 34,
                              decoration: BoxDecoration(
                                  color: AppColor.Main_Color,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                      fontFamily: 'CerebriSansPro-Regular',
                                      color: AppColor.White_Color,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                              )),
                        )
                        // TextButton(onPressed: () {}, child: Text('Edit Profile'))
                      ]),
                ),
              ),
              SizedBox(
                height: 27,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: _location_date_status(),
              ),
              SizedBox(
                height: 33,
              ),
              Thin1mmLine(color: AppColor.Grey4),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Description',
                    style: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        color: AppColor.Neutral1,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 11,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topLeft,
                  child: Text(
                    'We are looking for a designer to help us design our internal app called MyBoard. It is used to store links by category for each employee of the team. It is a one-page website developed in react, it should be displayed well on both pcs and phones. ',
                    style: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        color: AppColor.Neutral2,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Social Networks',
                    style: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        color: AppColor.Neutral1,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Container(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          box('assets/dribble.png'),
                          box('assets/twitter.png'),
                          box('assets/github.png'),
                          box('assets/twitter.png'),
                          box('assets/dribble.png'),
                          box('assets/github.png'),
                          box('assets/twitter.png'),
                        ]))),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Skills',
                    style: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        color: AppColor.Neutral1,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              _Tags(),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'More (3)',
                    style: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        color: AppColor.Main_Color,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Portfolio (4)',
                    style: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        color: AppColor.Main_Color,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: _PortfolioARea(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PortfolioARea extends StatelessWidget {
  const _PortfolioARea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 24,
      children: [
        Column(
          children: [
            Container(
              width: 159,
              height: 136,
              child: Image.asset(
                'assets/folio_mock1.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Storage mobile app',
              style: TextStyle(
                  fontFamily: 'CerebriSansPro-Regular',
                  color: AppColor.Neutral1,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: 159,
              height: 136,
              child: Image.asset(
                'assets/folio_mock2.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Storage mobile app',
              style: TextStyle(
                  fontFamily: 'CerebriSansPro-Regular',
                  color: AppColor.Neutral1,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: 159,
              height: 136,
              child: Image.asset(
                'assets/folio_mock1.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Storage mobile app',
              style: TextStyle(
                  fontFamily: 'CerebriSansPro-Regular',
                  color: AppColor.Neutral1,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: 159,
              height: 136,
              child: Image.asset(
                'assets/folio_mock2.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Storage mobile app',
              style: TextStyle(
                  fontFamily: 'CerebriSansPro-Regular',
                  color: AppColor.Neutral1,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ],
        )
      ],
    );
  }
}

class _Tags extends StatelessWidget {
  const _Tags({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 11,
      runSpacing: 9,
      children: [
        Chip(
            backgroundColor: AppColor.Neutral5,
            label: Text(
              'UX',
              style: TextStyle(
                  fontFamily: 'CerebriSansPro-Regular',
                  color: AppColor.Neutral1,
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            )),
        Chip(
            backgroundColor: AppColor.Neutral5,
            label: Text(
              'Mobile Development',
              style: TextStyle(
                  fontFamily: 'CerebriSansPro-Regular',
                  color: AppColor.Neutral1,
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            )),
        Chip(
            backgroundColor: AppColor.Neutral5,
            label: Text(
              'Photoshop',
              style: TextStyle(
                  fontFamily: 'CerebriSansPro-Regular',
                  color: AppColor.Neutral1,
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            )),
        Chip(
            backgroundColor: AppColor.Neutral5,
            label: Text(
              'User interface',
              style: TextStyle(
                  fontFamily: 'CerebriSansPro-Regular',
                  color: AppColor.Neutral1,
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            )),
        Chip(
            backgroundColor: AppColor.Neutral5,
            label: Text(
              'AutoCAD Drawings',
              style: TextStyle(
                  fontFamily: 'CerebriSansPro-Regular',
                  color: AppColor.Neutral1,
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            )),
        Chip(
            backgroundColor: AppColor.Neutral5,
            label: Text(
              'Ios',
              style: TextStyle(
                  fontFamily: 'CerebriSansPro-Regular',
                  color: AppColor.Neutral1,
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            )),
        Chip(
            backgroundColor: AppColor.Neutral5,
            label: Text(
              'Android',
              style: TextStyle(
                  fontFamily: 'CerebriSansPro-Regular',
                  color: AppColor.Neutral1,
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            )),
      ],
    );
  }
}

Widget box(String image) {
  return Container(
      margin: EdgeInsets.only(right: 35),
      alignment: Alignment.center,
      child: Image.asset(
        image,
        width: 30,
        fit: BoxFit.cover,
      ));
}

class _location_date_status extends StatelessWidget {
  const _location_date_status({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: AppColor.Neutral4,
              size: 14,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  'Lagos',
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      color: AppColor.Neutral1,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
                Text(
                  'Location',
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      color: AppColor.Neutral1,
                      fontWeight: FontWeight.w400,
                      fontSize: 10),
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.person,
              color: AppColor.Neutral4,
              size: 14,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  'Feb, 2022',
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      color: AppColor.Neutral1,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
                Text(
                  'joined skupal',
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      color: AppColor.Neutral1,
                      fontWeight: FontWeight.w400,
                      fontSize: 10),
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.business_center_outlined,
              color: AppColor.Neutral4,
              size: 14,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  'online',
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      color: AppColor.Neutral1,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
                Text(
                  'Last active',
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      color: AppColor.Neutral1,
                      fontWeight: FontWeight.w400,
                      fontSize: 10),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
