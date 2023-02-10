import 'package:skupal/screens/onboarding/onboarding_items.dart';

class OnBoarding_Data {
  static List<Onboarding_Items> getItems() {
    return [
      Onboarding_Items(
          img: "assets/onboarding_image_1.png",
          title: "Get tasks tailored \n      just for you",
          desc:
              "      Complete task on our task\n   Marketplace according to your \n         Skillset to make money."),
      Onboarding_Items(
          img: "assets/onboarding_image_2.png",
          title: "Instant access \n to microloans",
          desc:
              "      Collect microloans to suit your\n   needs: gadgets, foodstuffs or even \n                   fees. We got you!"),
      Onboarding_Items(
          img: "assets/onboarding_image_3.png",
          title: "  All your loans and \n  tasks in one place",
          desc:
              "    Skupal has a custom wallet to help\n  you manage your loans and earnings.")
    ];
  }
}
