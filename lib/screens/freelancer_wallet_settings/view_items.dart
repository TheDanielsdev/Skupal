import 'package:background_app_bar/background_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helper/appcolors.dart';

class ViewItems extends StatelessWidget {
  String image;
  String label;
  ViewItems({Key? key, required this.image, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            // title: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       IconButton(
            //           onPressed: () {
            //             Navigator.pop(context);
            //           },
            //           icon: Icon(Icons.arrow_back_ios_new_rounded,
            //               color: AppColor.Neutral1, size: 12)),
            //       Container(
            //           width: 32.9,
            //           height: 32.9,
            //           decoration: BoxDecoration(
            //             color: AppColor.White_Color,
            //             borderRadius: BorderRadius.circular(50),
            //           ),
            //           child: Center(
            //             child: Image.asset(
            //               'assets/edit1.png',
            //               fit: BoxFit.cover,
            //               filterQuality: FilterQuality.high,
            //               color: AppColor.Main_Color,
            //               width: 9.38,
            //               height: 9.38,
            //             ),
            //           ))
            //     ]),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Container(
                padding: EdgeInsets.only(
                  top: 25,
                  bottom: 10,
                ),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 23),
                    alignment: Alignment.topLeft,
                    child: Text(
                      label,
                      style: TextStyle(
                        color: AppColor.Neutral1,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'CerebriSansPro-Regular',
                      ),
                    )),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(30, 30),
                        topRight: Radius.elliptical(30, 30))),
              ),
            ),
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 300,
            backgroundColor: Colors.transparent,
            flexibleSpace: BackgroundFlexibleSpaceBar(
                background: Stack(
              children: [
                Image.asset(
                  
                  image,
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
                  // for(int i = 0; i<10; i++) {
                  //   Text('hey $i'),
                  //   print('hey ' + $i)
                  // },
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

class _appBar extends StatelessWidget {
  const _appBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColor.White_Color,
                )),
            Spacer(),
            GestureDetector(
              onTap: () {
                //handle actions
              },
              child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColor.White_Color,
                  ),
                  child: Center(
                      child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'edit1.png',
                      color: AppColor.Main_Color,
                      width: 15,
                    ),
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
