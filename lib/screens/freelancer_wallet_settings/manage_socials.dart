import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/screens/dashboard_c.dart';

class ManageSocial extends StatefulWidget {
  const ManageSocial({Key? key}) : super(key: key);

  @override
  State<ManageSocial> createState() => _ManageSocialState();
}

class _ManageSocialState extends State<ManageSocial> {
  // String _selectedItem = '';

  Widget _LinkedIn = Container();
  Widget _dribble = Container();
  Widget _twitter = Container();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Manage Socials',
          style: TextStyle(
              fontFamily: 'CerebriSansPro-Regular',
              color: AppColor.Neutral1,
              fontSize: 15,
              fontWeight: FontWeight.w700),
        ),
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
            Container(alignment: Alignment.topCenter, child: _LetsConnectYou()),
            // Text(_selectedItem),

            //there lord!!!
            _LinkedIn,
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
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => DashboardC()));
              },
              child: _button(),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20))
          ],
        ),
      ),
    );
  }

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
                        color: AppColor.Neutral1,
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
      _LinkedIn = name;
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

class linkedInTextField extends StatelessWidget {
  const linkedInTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController linkedInController = TextEditingController();
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
              'assets/linkedin.png',
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
              'assets/twitter.png',
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
              'assets/dribble.png',
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
            color: AppColor.Neutral1,
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
