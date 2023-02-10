import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/screens/reg_1.dart';
import 'package:skupal/screens/skills/skills.dart';

class PaymentDetails extends ConsumerStatefulWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  PaymentDetailsState createState() => PaymentDetailsState();
}

class PaymentDetailsState extends ConsumerState<PaymentDetails> {
  final accountNameProvider = StateProvider((ref) => "");
  final accountNumberProvider = StateProvider((ref) => "");
  final bankProvider = StateProvider((ref) => "");
  final _isLoadingProvider = StateProvider((ref) => false);
  final formKeyProvider = Provider((ref) => GlobalKey<FormState>());
  @override
  Widget build(BuildContext context) {
    final accountName = ref.watch(accountNameProvider);
    final accountNumber = ref.watch(accountNumberProvider);
    final bank = ref.watch(bankProvider);
    final _isLoading = ref.watch(_isLoadingProvider);
    final formKey = ref.watch(formKeyProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  'Payment Details',
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  "You'll need a bank account to cashout\n loans or earnings",
                  style: TextStyle(
                    color: AppColor.Neutral3,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    fontFamily: 'CerebriSansPro-Regular',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  expands: false,
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    hintText: 'Account Name',
                    hintStyle: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.Neutral3),
                    focusColor: AppColor.Main_Color,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onChanged: (value) {
                    ref.read(accountNameProvider.state).state = value.trim();
                  },
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Field cannot be empty';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  expands: false,
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    hintText: 'Account Number',
                    hintStyle: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.Neutral3),
                    focusColor: AppColor.Main_Color,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onChanged: (value) {
                    ref.read(accountNumberProvider.state).state = value.trim();
                  },
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Field cannot be empty';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  expands: false,
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    // suffixIcon: Image.asset(
                    //   'assets/kuda.png',
                    //   filterQuality: FilterQuality.high,
                    // ),
                    hintText: 'Bank',
                    hintStyle: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.Neutral3),
                    focusColor: AppColor.Main_Color,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onChanged: (value) {
                    ref.watch(bankProvider.state).state = value.trim();
                  },
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Field cannot be empty';
                    }
                    return null;
                  },
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: _isLoading
                      ? null
                      : () {
                          formKey.currentState!.validate();
                          //Handle navigation
                          _cacheUserDate(accountName, accountNumber, bank, ref);
                        },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _isLoading
                          ? AppColor.Main_Color.withOpacity(0.5)
                          : AppColor.Main_Color,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _isLoading
                                    ? Container(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(''),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'Continue',
                                  style: TextStyle(
                                      fontFamily: 'CerebriSansPro-Regular',
                                      color: _isLoading
                                          ? Colors.grey[50]
                                          : AppColor.White_Color,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
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

  _cacheUserDate(String accountName, String accountNumber, String bankName,
      WidgetRef ref) {
    if (accountName.isEmpty || accountNumber.isEmpty || bankName.isEmpty)
      return;
    ref.read(_isLoadingProvider.state).state = true;
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => Skills()));
    ref.read(userSignUpFlowProvider.state).state["accountName"] = accountName;
    ref.read(userSignUpFlowProvider.state).state["accountNumber"] =
        accountNumber;
    ref.read(userSignUpFlowProvider.state).state["bankName"] = bankName;
    print(accountName);
    print(accountNumber);
    print(bankName);
  }
}
