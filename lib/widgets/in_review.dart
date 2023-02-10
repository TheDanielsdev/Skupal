import 'package:flutter/material.dart';
import 'package:skupal/helper/appcolors.dart';

class InReview extends StatelessWidget {
  const InReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/nothing.png'),
          Text(
            'Nothing here',
            style: TextStyle(
                fontFamily: 'CerebriSansPro-Regular',
                fontWeight: FontWeight.w600,
                fontSize: 12),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.Main_Color,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(
                        child: Text(
                          'Bid for jobs',
                          style: TextStyle(
                              fontFamily: 'CerebriSansPro-Regular',
                              color: AppColor.White_Color,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
