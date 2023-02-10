import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/screens/freelancer_wallet_settings/edit.dart';
import 'package:skupal/screens/freelancer_wallet_settings/edit_profile.dart';

import 'package:skupal/screens/freelancer_wallet_settings/view_items.dart';

import '../../helper/appcolors.dart';

// final folio = StateProvider(((ref) => PortFolio_data.PortFolio_data_Items()));

class PContent extends StatefulWidget {
  String image;
  String editImage;
  String label;

  PContent({
    Key? key,
    required this.image,
    required this.editImage,
    required this.label,
  }) : super(key: key);

  @override
  State<PContent> createState() => _PContentState();
}

class _PContentState extends State<PContent> {
  // bool _isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
          onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ViewItems(
                      image: widget.image,
                      label: widget.label,
                    )))
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      widget.image,
                    ))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Container(),
                  Spacer(),
                  Column(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColor.Main_Color,
                        ),
                        child: Center(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => EditItems()));
                          },
                          child: Container(
                            child: Image.asset(
                              widget.editImage,
                              color: AppColor.White_Color,
                              width: 13,
                            ),
                          ),
                        )),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColor.Main_Color,
                          ),
                          child: Center(
                              child: Icon(
                            Icons.delete_outline_rounded,
                            size: 13,
                            color: AppColor.White_Color,
                          )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          widget.label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontFamily: 'CerebriSansPro-Regular',
              color: AppColor.Neutral1,
              fontWeight: FontWeight.w400,
              fontSize: 12),
        ),
      ]),
    );
  }
}
