import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:skupal/screens/freelancer_wallet_settings/freelancer%20profile/widgets/reviews/data/rating_story_data.dart';
import 'package:skupal/screens/freelancer_wallet_settings/freelancer%20profile/widgets/reviews/data/review_tag_data.dart';
import 'package:skupal/screens/freelancer_wallet_settings/freelancer%20profile/widgets/reviews/widget/rating_story_container.dart';
import 'package:skupal/screens/freelancer_wallet_settings/freelancer%20profile/widgets/reviews/widget/review_tag_widget.dart';
import 'package:skupal/widgets/line_widget.dart';

import '../../../../../helper/appcolors.dart';

final ratingStory = RATING_STORY_DATA.storyFunction();

class FreelancerProfileReview extends ConsumerStatefulWidget {
  FreelancerProfileReview({Key? key}) : super(key: key);

  @override
  FreelancerProfileReviewState createState() => FreelancerProfileReviewState();
}

@override
class FreelancerProfileReviewState
    extends ConsumerState<FreelancerProfileReview> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    final _verticalScrollController = ScrollController();
    final _horizontalScrollController = ScrollController();

    @override
    void dispose() {
      //so that it will be disposed whem we dont need anymore;
      _verticalScrollController.dispose();
      _horizontalScrollController.dispose();
      super.dispose();
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Container(
                width: double.infinity,
                height: 250,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23),
                        child: Row(
                          children: [
                            Text('Reviews (20)',
                                style: TextStyle(
                                    fontFamily: 'CerebriSansPro-Regular',
                                    color: AppColor.Neutral1,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14)),
                            SizedBox(
                              width: 9.63,
                            ),
                            Image.asset(
                              'ratingstar.png',
                              fit: BoxFit.cover,
                              width: 82.6,
                            ),
                            SizedBox(
                              width: 7.4,
                            ),
                            Text('4',
                                style: TextStyle(
                                    fontFamily: 'CerebriSansPro-Regular',
                                    color: AppColor.Neutral1,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 8.4)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23),
                        child: LinearPercentIndicator(
                          barRadius: Radius.circular(20),
                          leading: Text('5',
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  color: AppColor.Neutral3,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12)),
                          trailing: Text('(21)',
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  color: AppColor.Main_Color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8)),
                          percent: 0.8,
                          progressColor: AppColor.Main_Color,
                          backgroundColor: AppColor.Rec_79,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23),
                        child: LinearPercentIndicator(
                          barRadius: Radius.circular(20),
                          leading: Text('4',
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  color: AppColor.Neutral3,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12)),
                          trailing: Text('(02)',
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  color: AppColor.Main_Color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8)),
                          percent: 0.0,
                          backgroundColor: AppColor.Rec_79,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23),
                        child: LinearPercentIndicator(
                          barRadius: Radius.circular(20),
                          leading: Text('3',
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  color: AppColor.Neutral3,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12)),
                          trailing: Text('(02)',
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  color: AppColor.Main_Color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8)),
                          percent: 0.6,
                          progressColor: AppColor.Main_Color,
                          backgroundColor: AppColor.Rec_79,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23),
                        child: LinearPercentIndicator(
                          barRadius: Radius.circular(20),
                          leading: Text('2',
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  color: AppColor.Neutral3,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12)),
                          trailing: Text('(02)',
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  color: AppColor.Main_Color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8)),
                          percent: 0.0,
                          backgroundColor: AppColor.Rec_79,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23),
                        child: LinearPercentIndicator(
                          barRadius: Radius.circular(20),
                          leading: Text('1',
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  color: AppColor.Neutral3,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12)),
                          trailing: Text('(02)',
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  color: AppColor.Main_Color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8)),
                          percent: 0.7,
                          progressColor: AppColor.Main_Color,
                          backgroundColor: AppColor.Rec_79,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Thin1mmLine(color: AppColor.Grey4),
                      SizedBox(
                        height: 14,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 23),
                          child: ListView.builder(
                              controller: _horizontalScrollController,
                              scrollDirection: Axis.horizontal,
                              itemCount: REVIEW_TAG_DATA.length,
                              itemBuilder: (BuildContext context, index) {
                                return ReviewWidget(
                                    tag: REVIEW_TAG_DATA[index].tag);
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23),
                        child: Thin1mmLine(
                          color: AppColor.Grey4,
                        ),
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
                    controller: _verticalScrollController,
                    physics: ScrollPhysics(),
                    itemCount: ratingStory.length,
                    itemBuilder: (BuildContext context, index) {
                      return RatingStoryContainer(
                          img: ratingStory[index].img,
                          name: ratingStory[index].name,
                          verifiedtag: ratingStory[index].verifiedtag,
                          location: ratingStory[index].location,
                          hoursAgo: ratingStory[index].hoursAgo,
                          desc: ratingStory[index].desc);
                    }))
          ],
        ),
      ),
    );
  }
}
