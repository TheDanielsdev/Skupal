import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as pvd;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:skupal/screens/freelancer_wallet_settings/appearance/model/theme_provider.dart';

import '../../../helper/appcolors.dart';

class Appearance extends ConsumerStatefulWidget {
  Appearance({Key? key}) : super(key: key);

  @override
  AppearanceState createState() => AppearanceState();
}

@override
class AppearanceState extends ConsumerState {
  static const switchKey = 'SwitchKey';
  late bool changed = false;

  void initState() {
    super.initState();
    getBoolFnc();
  }

  void getBoolFnc() async {
    var prefs = await SharedPreferences.getInstance();
    var switched = prefs.getBool(switchKey);
    setState(() => this.changed = switched!);
  }

  void setBoolFnc() async {
    setState(() => changed = !changed);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(switchKey, changed);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = pvd.Provider.of<ThemeProvider>(context);
    Icon _icon =
        pvd.Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
            ? Icon(
                Icons.wb_sunny_rounded,
                size: 14,
              )
            : Icon(Icons.nightlight_round, size: 14);
    final textTheme =
        pvd.Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
            ? 'Light'
            : 'Dark';

    Color _color =
        pvd.Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
            ? Colors.grey
            : Colors.grey;

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.Neutral1,
              ))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 27,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Notification Settings',
              style: TextStyle(
                  color: AppColor.Neutral1,
                  fontFamily: 'CerebriSansPro-Regular',
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 29,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Select your theme',
              style: TextStyle(
                  color: AppColor.Grey2,
                  fontFamily: 'CerebriSansPro-Regular',
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: AppColor.Grey4,
          ),
          SizedBox(
            height: 33,
          ),
          ListTile(
            title: Text(
              textTheme,
              style: TextStyle(
                  color: AppColor.Grey1,
                  fontFamily: 'CerebriSansPro-Regular',
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            trailing: Wrap(spacing: 10, children: [
              Container(
                  margin: EdgeInsets.symmetric(vertical: 15), child: _icon),
              Container(
                  child: Switch.adaptive(
                      activeTrackColor: _color,
                      inactiveThumbColor: Colors.grey[800],
                      thumbColor:
                          MaterialStateProperty.resolveWith<Color>((states) {
                        if (states.contains(MaterialState.disabled)) {
                          return _color.withOpacity(.48);
                        }
                        return _color;
                      }),
                      value: themeProvider.isLightMode,
                      onChanged: (value) {
                        final provider = pvd.Provider.of<ThemeProvider>(context,
                            listen: false);
                        setState(() => changed = value);
                        if (changed == true) {
                          setBoolFnc();
                        } else {
                          null;
                        }
                        provider.toggleTheme(value);
                      }))
            ]),
          ),
          ListTile(
              title: Text(
                'Auto detect',
                style: TextStyle(
                    color: AppColor.Grey1,
                    fontFamily: 'CerebriSansPro-Regular',
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              trailing: Switch(value: false, onChanged: (value) {})),
        ],
      ),
    );
  }
}
