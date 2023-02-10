import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/models/animated_bar_controller.dart';
import 'package:skupal/models/jobs.dart';
import 'package:skupal/my_tests/chat.dart';
import 'package:skupal/my_tests/dropdwn.dart';
import 'package:skupal/my_tests/home.dart';
import 'package:skupal/my_tests/list_widget.dart';
import 'package:skupal/my_tests/mainpage.dart';
import 'package:skupal/my_tests/testmap.dart';
import 'package:skupal/screens/basic_network_request/body.dart';
import 'package:skupal/screens/bid_summary.dart';
import 'package:skupal/screens/chat_single.dart';
import 'package:skupal/screens/client_profile.dart';
import 'package:skupal/screens/dashboard_c.dart';
import 'package:skupal/screens/delivered.dart';
import 'package:skupal/screens/disputes/support/support.dart';
import 'package:skupal/screens/disputes/support/widgets/metest.dart';
import 'package:skupal/screens/email_sent.dart';
import 'package:skupal/screens/forget_pwd.dart';
import 'package:skupal/screens/freelancer_wallet/add_bank.dart';
import 'package:skupal/screens/freelancer_wallet/earnings_history.dart';
import 'package:skupal/screens/freelancer_wallet/select_bank.dart';
import 'package:skupal/screens/freelancer_wallet/wallet.dart';
import 'package:skupal/screens/freelancer_wallet/wallet_withdraw.dart';
import 'package:skupal/screens/freelancer_wallet/widthraw_suceesful.dart';
import 'package:skupal/screens/freelancer_wallet_settings/add_items.dart';
import 'package:skupal/screens/freelancer_wallet_settings/appearance/appearance.dart';
import 'package:skupal/screens/freelancer_wallet_settings/appearance/model/theme_provider.dart';
import 'package:skupal/screens/freelancer_wallet_settings/change_pwd.dart';
import 'package:skupal/screens/freelancer_wallet_settings/edit.dart';
import 'package:skupal/screens/freelancer_wallet_settings/edit_profile.dart';
import 'package:skupal/screens/freelancer_wallet_settings/freelancer%20profile/freelancer_profile.dart';
import 'package:skupal/screens/freelancer_wallet_settings/manage_skills.dart';
import 'package:skupal/screens/freelancer_wallet_settings/manage_socials.dart';
import 'package:skupal/screens/freelancer_wallet_settings/notifications_settings.dart';
import 'package:skupal/screens/freelancer_wallet_settings/portfolio.dart';
import 'package:skupal/screens/freelancer_wallet_settings/profile_settings.dart';
import 'package:skupal/screens/freelancer_wallet_settings/security.dart';
import 'package:skupal/screens/freelancer_wallet_settings/settings.dart';
import 'package:skupal/screens/freelancer_wallet_settings/view_items.dart';
import 'package:skupal/screens/jobs_single.dart';
import 'package:skupal/screens/personal_info/lets_get_to_meet_you.dart';
import 'package:skupal/screens/login.dart';
import 'package:skupal/screens/notification_screens/notification_center.dart';
import 'package:skupal/screens/notification_screens/notificatoion_center_settings.dart';
import 'package:skupal/screens/onboarding.dart';
import 'package:skupal/screens/onboarding/onboarding_main.dart';
import 'package:skupal/screens/payment_details.dart';
import 'package:skupal/screens/get_social.dart';
import 'package:skupal/screens/reg_1.dart';
import 'package:skupal/screens/skills/skills.dart';
import 'package:skupal/screens/splash.dart';
import 'package:skupal/my_tests/test.dart';
import 'package:skupal/screens/submit_bid/submit_bid.dart';
import 'package:skupal/screens/submit_gig.dart';

import 'package:skupal/screens/verification_success.dart';
import 'package:skupal/screens/verify_email.dart';

import 'package:skupal/widgets/dashboard.dart';
import 'package:skupal/widgets/gigs_widget.dart';
import 'package:provider/provider.dart' as pvd;

// import 'package:skupal/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final preferences = await SharedPreferences.getInstance();
  final showHome = preferences.getBool("showHome") ?? false;

  runApp(ProviderScope(child: MyApp(showHome: showHome)));
}

class MyApp extends StatelessWidget {
  final bool showHome;

  MyApp({required this.showHome});
  @override
  Widget build(BuildContext context) => pvd.ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          // final themeProvider = pvd.Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // themeMode: themeProvider.themeMode,
            // theme: SkupalThemes.lightTheme,
            // darkTheme: SkupalThemes.darkTheme,
            // OnBoardingMain(stories: stories)
            home: Splash(),
          );
        },
      );
}
