import 'package:flutter/material.dart';
import 'package:skupal/helper/appcolors.dart';

class JobHistoryContainer extends StatelessWidget {
  final String title;
  final String date;
  final String desc;
  final String status;
  final String price;
  final String priceLabel;
  const JobHistoryContainer({
    Key? key,
    required this.title,
    required this.date,
    required this.desc,
    required this.status,
    required this.price,
    required this.priceLabel,
  }) : super(key: key);

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
                Container(
                  child: Text(
                    title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        color: AppColor.Neutral1,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                ),
                Spacer(),
                Chip(
                  backgroundColor: AppColor.State_Info.withOpacity(0.2),
                  label: Text(
                    status,
                    style: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        color: AppColor.State_Info,
                        fontWeight: FontWeight.w500,
                        fontSize: 8),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.88,
            ),
            Row(
              children: [
                Wrap(
                  spacing: 7.4,
                  children: [
                    Container(
                      width: 11.39,
                      height: 11.39,
                      child: Text(
                        '******',
                        style: TextStyle(
                          fontFamily: 'CerebriSansPro-Regular',
                          color: AppColor.Main_Color,
                          fontWeight: FontWeight.w500,
                          // fontSize: 12
                        ),
                      ),
                    ),
                    Container(
                      width: 5,
                      height: 14,
                      child: Text(
                        '4',
                        style: TextStyle(
                            fontFamily: 'CerebriSansPro-Regular',
                            color: AppColor.Neutral1,
                            fontWeight: FontWeight.w600,
                            fontSize: 8.4),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  width: 99,
                  height: 14,
                  child: Text(
                    date,
                    style: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        color: AppColor.Neutral1,
                        fontWeight: FontWeight.w400,
                        fontSize: 10),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              height: 42,
              width: 184,
              child: Text(
                desc,
                style: TextStyle(
                    fontFamily: 'CerebriSansPro-Regular',
                    color: AppColor.Neutral1,
                    fontWeight: FontWeight.w400,
                    fontSize: 10),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Wrap(
              spacing: 4,
              children: [
                Container(
                  height: 15,
                  width: 112,
                  child: Text(
                    priceLabel,
                    style: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        color: AppColor.Neutral2,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                ),
                Container(
                  height: 15,
                  width: 56,
                  child: Text(
                    price,
                    style: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        color: AppColor.Neutral1,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
