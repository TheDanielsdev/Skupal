import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helper/appcolors.dart';

class AddItems extends ConsumerStatefulWidget {
  AddItems({Key? key}) : super(key: key);

  @override
  AddItemsState createState() => AddItemsState();
}

@override
class AddItemsState extends ConsumerState<AddItems> {
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
            )),
        title: Text(
          'Add Portfolio',
          style: TextStyle(
            color: AppColor.Neutral1,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            fontFamily: 'CerebriSansPro-Regular',
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text(
              'Upload',
              style: TextStyle(
                color: AppColor.Main_Color,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: 'CerebriSansPro-Regular',
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Show off some of your finest works',
                  style: TextStyle(
                    color: AppColor.Neutral3,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'CerebriSansPro-Regular',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DottedBorder(
                dashPattern: [4],
                radius: Radius.circular(10),
                color: AppColor.Main_Color4,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  alignment: Alignment.center,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/album.png'))),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Container(
                          child: Text(
                            'Click to upload files',
                            style: TextStyle(
                              color: AppColor.Neutral1,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'CerebriSansPro-Regular',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text(
                            '     Files uploaded here will be\n added to your portfolio gallery',
                            style: TextStyle(
                              color: AppColor.Neutral3,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'CerebriSansPro-Regular',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Container(
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
                          'Add more',
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
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  '*File limit size is 5MB. Recommended dimenson is 1280x790',
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      color: AppColor.Neutral3,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              _addedItemsContainer(
                image: 'assets/Rectangle.png',
              ),
              SizedBox(
                height: 37,
              ),
              Container(
                child: Text(
                  'Project details',
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      color: AppColor.Neutral1,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  expands: false,
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    hintText: 'Project Name',
                    hintStyle: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.Neutral3),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColor.Subtle, style: BorderStyle.solid)),
                    focusColor: AppColor.Main_Color,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 149,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  maxLines: null,
                  minLines: null,
                  textCapitalization: TextCapitalization.words,
                  expands: true,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText:
                        'Tell potential client what makes this project stand out',
                    hintStyle: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.Neutral3),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColor.Subtle, style: BorderStyle.solid)),
                    focusColor: AppColor.Main_Color,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  expands: false,
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    suffixIcon: _usefulLinksBtn(),
                    hintText: 'Add useful links',
                    hintStyle: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.Neutral3),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColor.Subtle, style: BorderStyle.solid)),
                    focusColor: AppColor.Main_Color,
                    border: OutlineInputBorder(),
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

class _usefulLinksBtn extends StatelessWidget {
  const _usefulLinksBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      width: 90,
      height: 28,
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
                'Add',
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
    );
  }
}

class _addedItemsContainer extends StatelessWidget {
  String image;
  _addedItemsContainer({
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        Container(
          margin: EdgeInsets.all(10),
          width: 105,
          height: 95,
          child: Stack(children: [
            Image.asset(image),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.7)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
            Positioned(
              top: 7,
              right: 7,
              child: Container(
                padding: EdgeInsets.all(7),
                width: 23,
                height: 23,
                decoration: BoxDecoration(
                    color: AppColor.White_Color,
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.delete_outlined,
                  size: 10,
                  color: AppColor.Neutral1,
                ),
              ),
            )
          ]),
        ),
        Container(
          margin: EdgeInsets.all(10),
          width: 105,
          height: 95,
          child: Stack(children: [
            Image.asset(image),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.7)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
            Positioned(
              top: 7,
              right: 7,
              child: Container(
                padding: EdgeInsets.all(7),
                width: 23,
                height: 23,
                decoration: BoxDecoration(
                    color: AppColor.White_Color,
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.delete_outlined,
                  size: 10,
                  color: AppColor.Neutral1,
                ),
              ),
            )
          ]),
        ),
        Container(
          margin: EdgeInsets.all(10),
          width: 105,
          height: 95,
          child: Stack(children: [
            Image.asset(image),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.7)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
            Positioned(
              top: 7,
              right: 7,
              child: Container(
                padding: EdgeInsets.all(7),
                width: 23,
                height: 23,
                decoration: BoxDecoration(
                    color: AppColor.White_Color,
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.delete_outlined,
                  size: 10,
                  color: AppColor.Neutral1,
                ),
              ),
            )
          ]),
        ),
        Container(
          margin: EdgeInsets.all(10),
          width: 105,
          height: 95,
          child: Stack(children: [
            Image.asset(image),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.7)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
            Positioned(
              top: 7,
              right: 7,
              child: Container(
                padding: EdgeInsets.all(7),
                width: 23,
                height: 23,
                decoration: BoxDecoration(
                    color: AppColor.White_Color,
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.delete_outlined,
                  size: 10,
                  color: AppColor.Neutral1,
                ),
              ),
            )
          ]),
        ),
        Container(
          margin: EdgeInsets.all(10),
          width: 105,
          height: 95,
          child: Stack(children: [
            Image.asset(image),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.7)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
            Positioned(
              top: 7,
              right: 7,
              child: Container(
                padding: EdgeInsets.all(7),
                width: 23,
                height: 23,
                decoration: BoxDecoration(
                    color: AppColor.White_Color,
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.delete_outlined,
                  size: 10,
                  color: AppColor.Neutral1,
                ),
              ),
            )
          ]),
        ),
        Container(
          margin: EdgeInsets.all(10),
          width: 105,
          height: 95,
          child: Stack(children: [
            Image.asset(image),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.7)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
            Positioned(
              top: 7,
              right: 7,
              child: Container(
                padding: EdgeInsets.all(7),
                width: 23,
                height: 23,
                decoration: BoxDecoration(
                    color: AppColor.White_Color,
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.delete_outlined,
                  size: 10,
                  color: AppColor.Neutral1,
                ),
              ),
            )
          ]),
        ),
        Container(
          margin: EdgeInsets.all(10),
          width: 105,
          height: 95,
          child: Stack(children: [
            Image.asset(image),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.7)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
            Positioned(
              top: 7,
              right: 7,
              child: Container(
                padding: EdgeInsets.all(7),
                width: 23,
                height: 23,
                decoration: BoxDecoration(
                    color: AppColor.White_Color,
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.delete_outlined,
                  size: 10,
                  color: AppColor.Neutral1,
                ),
              ),
            )
          ]),
        ),
        Container(
          margin: EdgeInsets.all(10),
          width: 105,
          height: 95,
          child: Stack(children: [
            Image.asset(image),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.7)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
            Positioned(
              top: 7,
              right: 7,
              child: Container(
                padding: EdgeInsets.all(7),
                width: 23,
                height: 23,
                decoration: BoxDecoration(
                    color: AppColor.White_Color,
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.delete_outlined,
                  size: 10,
                  color: AppColor.Neutral1,
                ),
              ),
            )
          ]),
        )
      ]),
    );
  }
}
