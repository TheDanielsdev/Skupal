import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/screens/freelancer_wallet_settings/add_items.dart';
import 'package:skupal/screens/freelancer_wallet_settings/data/portfolio_data.dart';
import 'package:skupal/screens/freelancer_wallet_settings/portfolio_content.dart';

import '../../helper/appcolors.dart';

class PortFolio extends ConsumerStatefulWidget {
  PortFolio({Key? key}) : super(key: key);

  @override
  PortFolioState createState() => PortFolioState();
}

@override
class PortFolioState extends ConsumerState<PortFolio> {
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
            'Manage Portfolio',
            style: TextStyle(
              color: AppColor.Neutral1,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              fontFamily: 'CerebriSansPro-Regular',
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 39, 20, 50),
                child: GridView(
                  children: DUMMY_DATA
                      .map((e) => PContent(
                          image: e.image, editImage: e.editImg, label: e.label))
                      .toList(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => AddItems()));
                  },
                  child: Container(
                    height: 50,
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
                              'Add new',
                              style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  color: AppColor.White_Color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
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
        ));
  }
}
