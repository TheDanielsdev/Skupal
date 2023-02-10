import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/screens/delivered.dart';
import 'package:skupal/widgets/line_widget.dart';

class SubmitGig extends StatelessWidget {
  const SubmitGig({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColor.Neutral1,
              size: 20,
            )),
        centerTitle: true,
        title: Text(
          'Contract Details',
          style: TextStyle(
            fontSize: 15,
            color: AppColor.Neutral1,
            fontFamily: 'CerebriSansPro-Regular',
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Thin1mmLine(color: AppColor.Neutral5),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: const Offset(
                            0,
                            12,
                          ))
                    ]),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Column(
                              children: [
                                Text(
                                  '00',
                                  style: TextStyle(
                                      color: AppColor.State_Error,
                                      fontSize: 13.98,
                                      fontFamily: 'CerebriSansPro-Regular',
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Days',
                                  style: TextStyle(
                                      color: AppColor.Neutral3,
                                      fontSize: 7.77,
                                      fontFamily: 'CerebriSansPro-Regular',
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Column(
                              children: [
                                Text(
                                  '24',
                                  style: TextStyle(
                                      color: AppColor.State_Error,
                                      fontSize: 13.98,
                                      fontFamily: 'CerebriSansPro-Regular',
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Hours',
                                  style: TextStyle(
                                      color: AppColor.Neutral3,
                                      fontSize: 7.77,
                                      fontFamily: 'CerebriSansPro-Regular',
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Column(
                              children: [
                                Text(
                                  '10',
                                  style: TextStyle(
                                      color: AppColor.State_Error,
                                      fontSize: 13.98,
                                      fontFamily: 'CerebriSansPro-Regular',
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Minutes',
                                  style: TextStyle(
                                      color: AppColor.Neutral3,
                                      fontSize: 7.77,
                                      fontFamily: 'CerebriSansPro-Regular',
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Column(
                              children: [
                                Text(
                                  '02',
                                  style: TextStyle(
                                      color: AppColor.State_Error,
                                      fontSize: 13.98,
                                      fontFamily: 'CerebriSansPro-Regular',
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Seconds',
                                  style: TextStyle(
                                      color: AppColor.Neutral3,
                                      fontSize: 7.77,
                                      fontFamily: 'CerebriSansPro-Regular',
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.Neutral5)),
                  width: double.infinity,
                  height: 174,
                  child: TextFormField(
                      textAlign: TextAlign.start,
                      expands: true,
                      minLines: null,
                      maxLines: null,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 17, vertical: 14),
                          border: InputBorder.none,
                          hintText: 'Add a note to your submission',
                          hintStyle: TextStyle(
                              color: AppColor.Neutral4,
                              fontFamily: 'CerebriSansPro-Regular',
                              fontSize: 12,
                              fontWeight: FontWeight.w400))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: DottedBorder(
                  dashPattern: [4],
                  radius: Radius.circular(10),
                  color: AppColor.Main_Color,
                  child: InkWell(
                    onTap: () {
                      //handle file upload
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      height: 42,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: "Tap to ",
                                    style: TextStyle(
                                        color: AppColor.Neutral3,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'CerebriSansPro-Regular',
                                        fontSize: 10),
                                    children: [
                                  TextSpan(
                                      text: "upload a file",
                                      style: TextStyle(
                                          color: AppColor.Main_Color,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'CerebriSansPro-Regular',
                                          fontSize: 10))
                                ]))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 23),
              //   child: Container(
              //     height: 165,
              //     decoration: BoxDecoration(color: AppColor.Subtle),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              //           child: Text('Source files',
              //               style: TextStyle(
              //                   color: AppColor.Neutral1,
              //                   fontWeight: FontWeight.w500,
              //                   fontFamily: 'CerebriSansPro-Regular',
              //                   fontSize: 12)),
              //         ),
              //         // Padding(
              //         //   padding: const EdgeInsets.all(15),
              //         //   child: Row(
              //         //     children: [
              //         //       Image.asset('assets/bent attach.png'),
              //         //       Padding(
              //         //         padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              //         //         child: Text('app screens zip(1kb)'),
              //         //       ),
              //         //       Padding(
              //         //           padding: const EdgeInsets.fromLTRB(90, 0, 0, 0),
              //         //           child: Image.asset('assets/x_out.png'))
              //         //     ],
              //         //   ),
              //         // ),
              //         // Padding(
              //         //   padding: const EdgeInsets.all(15),
              //         //   child: Row(
              //         //     children: [
              //         //       Image.asset('assets/bent attach.png'),
              //         //       Padding(
              //         //         padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              //         //         child: Text('Header social.jp(1kb)'),
              //         //       ),
              //         //       Padding(
              //         //           padding: const EdgeInsets.fromLTRB(90, 0, 0, 0),
              //         //           child: Image.asset('assets/x_out.png'))
              //         //     ],
              //         //   ),
              //         // ),
              //         // Padding(
              //         //   padding: const EdgeInsets.all(15),
              //         //   child: Row(
              //         //     children: [
              //         //       Image.asset('assets/bent attach.png'),
              //         //       Padding(
              //         //         padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              //         //         child: Text('wiki_point.svg (1kb)'),
              //         //       ),
              //         //       Padding(
              //         //           padding: const EdgeInsets.fromLTRB(90, 0, 0, 0),
              //         //           child: Image.asset('assets/x_out.png'))
              //         //     ],
              //         //   ),
              //         // ),
              //       ],
              //     ),
              //   ),
              // ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Delivered()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
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
                        children: [
                          Center(
                            child: Text('Submit for approval',
                                style: TextStyle(
                                    color: AppColor.White_Color,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'CerebriSansPro-Regular',
                                    fontSize: 14)),
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
        ),
      ),
    );
  }
}
