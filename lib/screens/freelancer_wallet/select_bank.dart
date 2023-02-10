import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/screens/client_profile.dart';
import 'package:skupal/screens/freelancer_wallet/add_bank.dart';

class SelectBank extends ConsumerStatefulWidget {
  SelectBank({Key? key}) : super(key: key);

  @override
  SelectBankState createState() => SelectBankState();
}

@override
class SelectBankState extends ConsumerState<SelectBank> {
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
            size: 20,
          ),
        ),
        title: Text(
          'Select payment method',
          style: TextStyle(
            color: AppColor.Neutral1,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            fontFamily: 'CerebriSansPro-Regular',
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                'Saved Accounts',
                style: TextStyle(
                  color: AppColor.Neutral1,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Con1(),
              SizedBox(
                height: 20,
              ),
              Con2(),
              SizedBox(
                height: 20,
              ),
              Con3(),
              SizedBox(height: 36),
              TextF1(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextF1 extends StatelessWidget {
  const TextF1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => AddBank()));
          },
          icon: Icon(
            Icons.add,
            color: AppColor.Neutral3,
            size: 12,
          ),
        ),
        hintText: 'Add new payment method',
        hintStyle: TextStyle(
            fontFamily: 'CerebriSansPro-Regular',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColor.Neutral3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColor.Grey6, style: BorderStyle.solid)),
      ),
    );
  }
}

class Con1 extends StatelessWidget {
  const Con1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.White_Color,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(
                  0,
                  12,
                ))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'El Nuru',
                  style: TextStyle(
                    color: AppColor.Neutral3,
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    fontFamily: 'CerebriSansPro-Regular',
                  ),
                ),
                Spacer(),
                Image.asset('assets/wi.png', color: AppColor.Grey1)
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '038677493683',
              style: TextStyle(
                color: AppColor.Neutral1,
                fontWeight: FontWeight.w700,
                fontSize: 15,
                fontFamily: 'CerebriSansPro-Regular',
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Wrap(
              spacing: 15,
              children: [
                Text(
                  'United Bank Of Africa',
                  style: TextStyle(
                    color: AppColor.Neutral3,
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    fontFamily: 'CerebriSansPro-Regular',
                  ),
                ),
                Image.asset('assets/uba.png')
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Con2 extends StatelessWidget {
  const Con2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 20, children: [
      Container(
        height: 100,
        width: MediaQuery.of(context).size.width * 0.65,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.White_Color,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: const Offset(
                    0,
                    12,
                  ))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gus Augustine',
                style: TextStyle(
                  color: AppColor.Neutral3,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '038677493683',
                style: TextStyle(
                  color: AppColor.Neutral1,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'CerebriSansPro-Regular',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Wrap(
                spacing: 15,
                children: [
                  Text(
                    'KUDA...',
                    style: TextStyle(
                      color: AppColor.Neutral3,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'CerebriSansPro-Regular',
                    ),
                  ),
                  Image.asset('assets/kuda_small.png')
                ],
              )
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColor.State_Error.withOpacity(0.1)),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: AppColor.State_Error,
                size: 15,
              )),
        ),
      )
    ]);
  }
}

class Con3 extends StatelessWidget {
  const Con3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.White_Color,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(
                  0,
                  12,
                ))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Daniel Bezos',
                  style: TextStyle(
                    color: AppColor.Neutral3,
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    fontFamily: 'CerebriSansPro-Regular',
                  ),
                ),
                Spacer(),
                Image.asset('assets/wi.png', color: AppColor.Grey1)
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '038677493683',
              style: TextStyle(
                color: AppColor.Neutral1,
                fontWeight: FontWeight.w700,
                fontSize: 15,
                fontFamily: 'CerebriSansPro-Regular',
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Wrap(
              spacing: 15,
              children: [
                Text(
                  'United Bank Of Africa',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColor.Neutral3,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'CerebriSansPro-Regular',
                  ),
                ),
                Image.asset('assets/uba.png')
              ],
            )
          ],
        ),
      ),
    );
  }
}
