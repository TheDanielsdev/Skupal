import 'package:flutter/material.dart';

import '../../../../../../helper/appcolors.dart';

class RatingStoryContainer extends StatelessWidget {
  final String img;
  final String name;
  final String verifiedtag;
  final String location;
  final String hoursAgo;
  final String desc;
  const RatingStoryContainer(
      {Key? key,
      required this.img,
      required this.name,
      required this.verifiedtag,
      required this.location,
      required this.hoursAgo,
      required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 149,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 23,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    img,
                    width: 35,
                    height: 35,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(children: [
                    Row(
                      children: [
                        Container(
                          child: Text(name,
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  color: AppColor.Neutral1,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12)),
                        ),
                        SizedBox(
                          width: 6.17,
                        ),
                        Image.asset(
                          verifiedtag,
                          width: 11.67,
                          height: 11.67,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Container(),
                        Spacer(),
                        Container(
                          child: Text(hoursAgo,
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  color: AppColor.Neutral3,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/ratingstar.png',
                          width: 10.25,
                          height: 9.79,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 11.78,
                        ),
                        Icon(
                          Icons.location_on_outlined,
                          size: 10,
                          color: AppColor.Neutral2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(location,
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  color: AppColor.Neutral2,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8)),
                        ),
                      ],
                    )
                  ]),
                )
              ],
            ),
            SizedBox(
              height: 15.46,
            ),
            Container(
              width: 328,
              height: 45,
              child: Text(desc,
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      color: AppColor.Neutral2,
                      fontWeight: FontWeight.w400,
                      fontSize: 10)),
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Icon(
                  Icons.flag_outlined,
                  color: AppColor.Neutral2,
                  size: 10,
                ),
                SizedBox(
                  width: 9,
                ),
                Container(
                  child: Text('Report',
                      style: TextStyle(
                          fontFamily: 'CerebriSansPro-Regular',
                          color: AppColor.Neutral1,
                          fontWeight: FontWeight.w500,
                          fontSize: 10)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
