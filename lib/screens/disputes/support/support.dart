import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:skupal/screens/disputes/support/data/dispute_data.dart';
import 'package:skupal/screens/disputes/support/widgets/dispute_widget.dart';

import '../../../helper/appcolors.dart';

final disputeData = DISPUTE_DATA.disputFnc();

class Support extends ConsumerStatefulWidget {
  Support({Key? key}) : super(key: key);

  @override
  SupportState createState() => SupportState();
}

@override
class SupportState extends ConsumerState<Support> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.Neutral1,
              size: 12,
            )),
        title: Text(
          'Support & Disputes',
          style: TextStyle(
              fontFamily: 'CerebriSansPro-Regular',
              color: AppColor.Neutral1,
              fontWeight: FontWeight.w600,
              fontSize: 14),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 45,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 23),
                width: double.infinity,
                child: Image.asset(
                  'disputeimg.png',
                  width: 203,
                  height: 160,
                )),
            SizedBox(
              height: 50.59,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              alignment: Alignment.topCenter,
              child: Text(
                '  We’re here to help you 24/7, drop\nus a line and we’ll be in touch ASAP!',
                softWrap: false,
                overflow: TextOverflow.clip,
                style: TextStyle(
                    fontFamily: 'CerebriSansPro-Regular',
                    color: AppColor.Neutral3,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            SizedBox(
              height: 44,
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: AppColor.White_Color,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(30, 30),
                      topRight: Radius.elliptical(30, 30))),
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: disputeData.length,
                  itemBuilder: (BuildContext context, index) {
                    return DisputeContainer(
                        title: disputeData[index].title,
                        desc: disputeData[index].desc);
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
