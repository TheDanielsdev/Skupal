import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../helper/appcolors.dart';

class MeTest extends ConsumerStatefulWidget {
  MeTest({Key? key}) : super(key: key);

  @override
  MetestState createState() => MetestState();
}

@override
class MetestState extends ConsumerState<MeTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 10),
                child: Center(child: Text('heyyy')),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(30, 30),
                        topRight: Radius.elliptical(30, 30))),
              ),
            ),
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 300,
            backgroundColor: AppColor.Main_Color.withOpacity(0.5),
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(
              children: [
                Image.asset(
                  'assets/folio_mock1.png',
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                  //this below is to turn low quality images to high quality images
                  filterQuality: FilterQuality.high,
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.5)
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                ),
              ],
            )),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                children: [
                  Text(
                      'Please complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.comPlease complete the security check to access www.moonbitcoins.com'),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.maxFinite,
                    color: Colors.red,
                    height: 50,
                    child: Stack(children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.black.withOpacity(0.5),
                                Colors.black.withOpacity(0.5)
                              ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
