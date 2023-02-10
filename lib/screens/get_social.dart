import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/screens/dashboard_c.dart';
import 'package:skupal/screens/verify_email.dart';
import 'package:skupal/services/skupal_repo.dart';

import 'reg_1.dart';

final emailProvider = Provider((ref) =>
    ref.watch(userSignUpFlowProvider.select((value) => value["email"])));
final passwordProvider = Provider((ref) =>
    ref.watch(userSignUpFlowProvider.select((value) => value["password"])));
final firstNameProvider = Provider((ref) =>
    ref.watch(userSignUpFlowProvider.select((value) => value["fName"])));
final lastNameProvider = Provider((ref) =>
    ref.watch(userSignUpFlowProvider.select((value) => value["lName"])));
final displayNameProvider = Provider((ref) =>
    ref.watch(userSignUpFlowProvider.select((value) => value["userName"])));
final dobProvider = Provider(
    (ref) => ref.watch(userSignUpFlowProvider.select((value) => value["dob"])));
final phoneProvider = Provider((ref) =>
    ref.watch(userSignUpFlowProvider.select((value) => value["phone"])));
final acctNameProvider = Provider((ref) =>
    ref.watch(userSignUpFlowProvider.select((value) => value["accountName"])));
final acctNoProvider = Provider((ref) => ref
    .watch(userSignUpFlowProvider.select((value) => value["accountNumber"])));
final bankProvider = Provider((ref) =>
    ref.watch(userSignUpFlowProvider.select((value) => value["bankname"])));
final skillsProvider = Provider((ref) =>
    ref.watch(userSignUpFlowProvider.select((value) => value["skills"])));
final socialMediaProvider = Provider((ref) =>
    ref.watch(userSignUpFlowProvider.select((value) => value["email"])));

class GetSocial extends ConsumerStatefulWidget {
  const GetSocial({Key? key}) : super(key: key);

  @override
  GetSocialState createState() => GetSocialState();
}

class GetSocialState extends ConsumerState<GetSocial> {
  // String _selectedItem = '';
  final _isLoadingProvider = StateProvider((ref) => false);

  Widget _linkedIn = Container();
  Widget _dribble = Container();
  Widget _twitter = Container();
  final chipKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(_isLoadingProvider);
    final fName = ref.watch(firstNameProvider);
    final lName = ref.watch(lastNameProvider);
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    final userName = ref.watch(displayNameProvider);
    final acctName = ref.watch(acctNameProvider);
    final acctNum = ref.watch(acctNoProvider);
    final skills = ref.watch(skillsProvider);
    final socialMediaLinks = ref.watch(socialMediaProvider);
    final phone = ref.watch(phoneProvider);
    final dob = ref.watch(dobProvider);
    final bank = ref.watch(bankProvider);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                _showModal(context);
              },
              icon: Icon(
                Icons.add,
                color: AppColor.Neutral3,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _GetSocial(),
            _LetsConnectYou(),
            // Text(_selectedItem),

            //there lord!!!
            _linkedIn,
            SizedBox(
              height: 17,
            ),
            _dribble,
            SizedBox(
              height: 17,
            ),
            _twitter,
            Spacer(),
            GestureDetector(
              onTap: isLoading
                  ? null
                  : () {
                      ref.read(_isLoadingProvider.state).state = true;
                      // registerUser(
                      //     fName,
                      //     lName,
                      //     email,
                      //     password,
                      //     userName,
                      //     dob,
                      //     phone,
                      //     acctName,
                      //     acctNum,
                      //     bank,
                      //     skills,
                      //     socialMediaLinks,
                      //     ref,
                      //     context);
                      // Navigator.of(context).pushReplacement(
                      //     MaterialPageRoute(builder: (_) => DashboardC()));
                    },
              child: _button(),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20))
          ],
        ),
      ),
    );
  }

  // registerUser(
  //     String firstName,
  //     String lastName,
  //     String email,
  //     String password,
  //     String userName,
  //     String dob,
  //     String phoneNumber,
  //     String acctName,
  //     String acctNumber,
  //     String bank,
  //     List skills,
  //     List socialMediaLinks,
  //     WidgetRef ref,
  //     BuildContext context) async {
  //   if (email.isEmpty ||
  //       password.isEmpty ||
  //       firstName.isEmpty ||
  //       lastName.isEmpty ||
  //       password.isEmpty ||
  //       userName.isEmpty ||
  //       dob.isEmpty ||
  //       phoneNumber.isEmpty ||
  //       acctName.isEmpty ||
  //       acctNumber.isEmpty ||
  //       bank.isEmpty ||
  //       skills.isEmpty ||
  //       socialMediaLinks.isEmpty) return;
  //   print("Creating User...");
  //   ref.read(_isLoadingProvider.state).state = true;
  //   ref
  //       .read(skupalRepoProvider)
  //       .createUser(firstName, lastName, email, password, userName, dob,
  //           phoneNumber, acctName, acctNumber, bank, skills, socialMediaLinks)
  //       .then((result) {
  //     ref.read(_isLoadingProvider.state).state = true;

  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text(result.status!)));

  //     //Open Email Verification Page
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (context) => VerifyEmail()),
  //         (Route<dynamic> route) => false);
  //   }).onError((error, stackTrace) {
  //     print(error.toString());
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("Registration Failed!")));
  //     ref.read(_isLoadingProvider.state).state = false;
  //   });
  // }

  Future<void> _showModal(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Color(0xFF737373),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                // ListTile(
                //   leading: Icon(Icons.no_cell),
                //   title: Text('No cell'),
                //   onTap: () => _selectItem('no Cell'),
                // ),

                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.topCenter,
                  height: 5,
                  width: 59,
                  decoration: BoxDecoration(
                      color: AppColor.Grey5,
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Link new social account',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),

                Container(
                    child: TextFormField(
                  textAlign: TextAlign.justify,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                      border: InputBorder.none,
                      hintText: '   search',
                      hintStyle: TextStyle(
                          fontFamily: 'CerebriSansPro-Regular',
                          color: AppColor.Neutral3,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontStyle: FontStyle.italic),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColor.Neutral3,
                        size: 16,
                      )),
                )),

                ListTile(
                  leading: Image.asset(
                    'assets/linkedin.png',
                    width: 24,
                  ),
                  title: Text(
                    'LinkedIn',
                    style: TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        color: AppColor.Neutral1,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  onTap: () => _linkedInSelected(
                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                          color: AppColor.Subtle,
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(top: 25, left: 0, right: 0),
                      child: linkedInTextField(),
                    ),
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/dribble.png',
                    width: 24,
                  ),
                  title: Text('Dribble',
                      style: TextStyle(
                          fontFamily: 'CerebriSansPro-Regular',
                          color: AppColor.Neutral1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  onTap: () => _dribbleSelected(
                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                          color: AppColor.Subtle,
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(top: 25, left: 0, right: 0),
                      child: DribbleTextField(),
                    ),
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/twitter.png',
                    width: 24,
                  ),
                  title: Text('Twitter',
                      style: TextStyle(
                          fontFamily: 'CerebriSansPro-Regular',
                          color: AppColor.Neutral1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  onTap: () => _twitterSelected(
                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                          color: AppColor.Subtle,
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(top: 25, left: 0, right: 0),
                      child: twitterTextField(),
                    ),
                  ),
                )
              ]),
            ),
          ),
        );
      },
    );
  }

//for the container
  void _linkedInSelected(Container name) {
    Navigator.pop(context);
    setState(() {
      _linkedIn = name;
    });
  }

  void _dribbleSelected(Container name) {
    Navigator.pop(context);
    setState(() {
      _dribble = name;
    });
  }

  void _twitterSelected(Container name) {
    Navigator.pop(context);
    setState(() {
      _twitter = name;
    });
  }

//for the text
  // void _selectItem(String name) {
  //   Navigator.pop(context);
  //   setState(() {
  //     _selectedItem = name;
  //   });
  // }

}

class linkedInTextField extends StatefulWidget {
  const linkedInTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<linkedInTextField> createState() => _linkedInTextFieldState();
}

class _linkedInTextFieldState extends State<linkedInTextField> {
  var linkedInController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    linkedInController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    linkedInController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: linkedInController,
      textAlign: TextAlign.justify,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          border: InputBorder.none,
          hintText: '   https://www.linkedin.com/xyz',
          hintStyle: TextStyle(
              fontFamily: 'CerebriSansPro-Regular',
              color: AppColor.Neutral3,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontStyle: FontStyle.italic),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Image.asset(
              'linkedin.png',
              width: 15,
            ),
          ),
          suffixIcon: IconButton(
              onPressed: () {
                linkedInController.dispose();
                // Navigator.pop(context);
              },
              icon: Icon(
                Icons.delete_outline_rounded,
                color: AppColor.Neutral3,
              ))),
    );
  }
}

class twitterTextField extends StatelessWidget {
  const twitterTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController twitterController = TextEditingController();
    return TextFormField(
      controller: twitterController,
      textAlign: TextAlign.justify,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          border: InputBorder.none,
          hintText: '   https://www.twitter.com/xyz',
          hintStyle: TextStyle(
              fontFamily: 'CerebriSansPro-Regular',
              color: AppColor.Neutral3,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontStyle: FontStyle.italic),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Image.asset(
              'twitter.png',
              width: 15,
            ),
          ),
          suffixIcon: IconButton(
              onPressed: () {
                twitterController.dispose();
                // Navigator.pop(context);
              },
              icon: Icon(
                Icons.delete_outline_rounded,
                color: AppColor.Neutral3,
              ))),
    );
  }
}

class DribbleTextField extends StatelessWidget {
  const DribbleTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController DribbleController = TextEditingController();
    return TextFormField(
      controller: DribbleController,
      textAlign: TextAlign.justify,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          border: InputBorder.none,
          hintText: '   https://www.dribble.com/xyz',
          hintStyle: TextStyle(
              fontFamily: 'CerebriSansPro-Regular',
              color: AppColor.Neutral3,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontStyle: FontStyle.italic),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Image.asset(
              'dribble.png',
              width: 15,
            ),
          ),
          suffixIcon: IconButton(
              onPressed: () {
                DribbleController.dispose();
                // Navigator.pop(context);
              },
              icon: Icon(
                Icons.delete_outline_rounded,
                color: AppColor.Neutral3,
              ))),
    );
  }
}

class _LetsConnectYou extends StatelessWidget {
  const _LetsConnectYou({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, top: 10, right: 0),
      child: Text(
        "Let clients connect with you",
        style: TextStyle(
            fontFamily: 'CerebriSansPro-Regular',
            color: AppColor.Neutral3,
            fontWeight: FontWeight.w300,
            fontSize: 14),
      ),
    );
  }
}

class _GetSocial extends StatelessWidget {
  const _GetSocial({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Text(
        'Get Social',
        style: TextStyle(
            fontFamily: 'CerebriSansPro-Regular',
            fontWeight: FontWeight.w700,
            fontSize: 24),
      ),
    );
  }
}

class _button extends StatelessWidget {
  const _button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
                  'Done',
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
    );
  }
}
