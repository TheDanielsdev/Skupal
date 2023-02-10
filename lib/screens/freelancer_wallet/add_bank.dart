import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helper/appcolors.dart';

class AddBank extends ConsumerStatefulWidget {
  AddBank({Key? key}) : super(key: key);

  @override
  AddBankState createState() => AddBankState();
}

class AddBankState extends ConsumerState<AddBank> {
  final chosenValue = StateProvider<String>(((ref) => ''));
  @override
  Widget build(BuildContext context) {
    var _chosenValue = ref.watch(chosenValue);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Add payment method',
          style: TextStyle(
            color: AppColor.Neutral1,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            fontFamily: 'CerebriSansPro-Regular',
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColor.Neutral1,
              size: 20,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            TextF1(),
            SizedBox(
              height: 20,
            ),
            TextF2(),
            SizedBox(
              height: 20,
            ),
            TextF3(),
            SizedBox(
              height: 20,
            ),
            TextF4(),
            Spacer(),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                Image.asset('assets/headsup.png'),
                Text(
                  'The added payment method will be credited by our system so\nplease make sure the information is correct.',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColor.Grey3,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'CerebriSansPro-Regular',
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.Main_Color.withOpacity(0.1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(
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
        hintText: 'Austine Bank Name',
        hintStyle: TextStyle(
            fontSize: 12,
            fontFamily: 'CerebriSansPro-Regular',
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

class TextF2 extends StatelessWidget {
  const TextF2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Bank Account Name',
        hintStyle: TextStyle(
            fontFamily: 'CerebriSansPro-Regular',
            fontSize: 12,
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

//this would later be chnaged to a dropdown
class TextF3 extends StatelessWidget {
  const TextF3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'select Bank',
        hintStyle: TextStyle(
            fontSize: 12,
            fontFamily: 'CerebriSansPro-Regular',
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

class TextF4 extends StatelessWidget {
  const TextF4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Bank Branch (optional)',
        hintStyle: TextStyle(
            fontSize: 12,
            fontFamily: 'CerebriSansPro-Regular',
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
