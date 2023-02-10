import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/models/story_model.dart';
import 'package:skupal/screens/dashboard_c.dart';
import 'package:skupal/screens/login.dart';
import 'package:skupal/screens/reg_1.dart';
import 'package:skupal/widgets/animated_bars.dart';
import 'package:video_player/video_player.dart';

class Onboarding extends StatefulWidget {
  final List<Story>? stories;

  const Onboarding({this.stories});

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  PageController? _pageController;
  AnimationController? _animController;
  VideoPlayerController? _videoController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animController = AnimationController(vsync: this);

//check back if needed
    final Story firstStory = widget.stories!.first;
    _loadStory(story: firstStory, animateToPage: false);

    _animController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animController!.stop();
        _stopAnimation();
        // _animController.reset();
        setState(() {
          if (_currentIndex + 1 < widget.stories!.length) {
            _currentIndex += 1;
            _loadStory(story: widget.stories![_currentIndex]);
          } else {
            // Out of bounds - loop story
            // You can also Navigator.of(context).pop() here
            // _currentIndex = 0;
            // _loadStory(story: widget.stories[_currentIndex]);

            //the function to stop the animation
            // _stopAnimation();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController!.dispose();

    //I then called the function here.
    _stopAnimation();

    _videoController?.dispose();
    super.dispose();
  }

//I used this to stop the animation at the end of the third screen....I cant believe i did.
  _stopAnimation() {
    if (_currentIndex == 2) {
      setState(() {
        _animController!.dispose();
        print('Onboarding Animation Stopped');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    final Story story = widget.stories![_currentIndex];
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColor.White_Color,
        body: GestureDetector(
          child: Stack(
            children: <Widget>[
              //Blood sweat and tears

              PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  //the first screen
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Image.asset(
                          'assets/bonbon-hands-with-house-and-money-buying-and-selling-property-1 1.png'),
                      const Text(
                        'Instant access \n to microloans',
                        style: TextStyle(
                            fontFamily: 'CerebriSansPro-Regular',
                            color: AppColor.Neutral1,
                            fontWeight: FontWeight.w700,
                            fontSize: 24),
                      ),
                      SizedBox(height: 20),
                      const Text(
                        '      Collect microloans to suit your\n   needs: gadgets, foodstuffs or even \n                   fees. We got you!',
                        style: TextStyle(
                            fontFamily: 'CerebriSansPro-Regular',
                            color: AppColor.Neutral3,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                //this should take us to the login page

                                // _pageController.jumpToPage(3);
                                // _animController.animateTo(_pageController.page);
                                // setState(() {
                                //   _pageController.dispose();
                                // });
                                // _pageController.nextPage(
                                //     duration: Duration(seconds: 1),
                                //     curve: Curves.linear);
                                // _animController.forward();
                                // _animController.animateTo(_pageController.);
                              },
                              child: const Text(
                                'Skip',
                                style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  fontSize: 14,
                                  color: AppColor.Main_Color,
                                ),
                              ),
                            ),
                            //To navigate to next screen

                            TextButton(
                                onPressed: () {},
                                child: GestureDetector(
                                  onTapDown: (details) =>
                                      _onTapDown(details, story),
                                  // onTap: () {
                                  //   onAddButtonTapped(1);
                                  // },

                                  child: Container(
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.Main_Color,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Row(
                                        children: const [
                                          Text(
                                            'Next',
                                            style: TextStyle(
                                                fontFamily:
                                                    'CerebriSansPro-Regular',
                                                fontSize: 14,
                                                color: AppColor.White_Color,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            size: 13.33,
                                            color: AppColor.White_Color,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20))
                    ],
                  ),

                  //The second screen.

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Image.asset(
                          'assets/bonbon-man-ans-woman-confirming-the-deal-with-a-handshake 1.png'),
                      const Text(
                        'Get tasks tailored \n      just for you',
                        style: TextStyle(
                            fontFamily: 'CerebriSansPro-Regular',
                            color: AppColor.Neutral1,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      SizedBox(height: 20),
                      const Text(
                        '      Complete task on our task\n   Marketplace according to your \n         Skillset to make money.',
                        style: TextStyle(
                            fontFamily: 'CerebriSansPro-Regular',
                            color: AppColor.Neutral3,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // _pageController.jumpToPage(3);
                                // _animController.animateTo(_pageController.page);
                                // setState(() {
                                //   _pageController.dispose();
                                // });
                                // _pageController.nextPage(
                                //     duration: Duration(seconds: 1),
                                //     curve: Curves.linear);

                                // _animController.forward();
                              },
                              child: const Text(
                                'Skip',
                                style: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  fontSize: 14,
                                  color: AppColor.Main_Color,
                                ),
                              ),
                            ),
                            //To navigate to next screen
                            Spacer(),
                            TextButton(
                                onPressed: () {},
                                child: GestureDetector(
                                  onTapDown: (details) =>
                                      _onTapDown(details, story),
                                  // onTap: () {
                                  //   onAddButtonTapped(1);
                                  // },

                                  child: Container(
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.Main_Color,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Row(
                                        children: const [
                                          Text(
                                            'Next',
                                            style: TextStyle(
                                                fontFamily:
                                                    'CerebriSansPro-Regular',
                                                fontSize: 14,
                                                color: AppColor.White_Color,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            size: 13.33,
                                            color: AppColor.White_Color,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20))
                    ],
                  ),

                  //the third screen

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Image.asset('assets/bonbon-investing-money-online 1.png'),
                      const Text(
                        '  All your loans and \n  tasks in one place',
                        style: TextStyle(
                            fontFamily: 'CerebriSansPro-Regular',
                            color: AppColor.Neutral1,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        '     Skupal has a custom wallet to help\n  you manage your loans and earnings.',
                        style: TextStyle(
                            fontFamily: 'CerebriSansPro-Regular',
                            color: AppColor.Neutral3,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => DashboardC()));
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: AppColor.Main_Color,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    'Create Account',
                                    style: TextStyle(
                                        fontFamily: 'CerebriSansPro-Regular',
                                        fontSize: 14,
                                        color: AppColor.White_Color,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already a member?',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'CerebriSansPro-Regular',
                                      color: AppColor.Main_Color,
                                    ),
                                  ),

                                  //Take us to the login page
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             LoginScreen()));
                                    },
                                    child: Text(
                                      '  Login',
                                      style: TextStyle(
                                        fontFamily: 'CerebriSansPro-Regular',
                                        color: AppColor.Main_Color,
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 25.0,
                left: 10.0,
                right: 10.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: widget.stories!
                          //use .asMap to convert a list to a map
                          .asMap()
                          .map((i, e) {
                            return MapEntry(
                              i,
                              AnimatedBar(
                                animController: _animController,
                                position: i,
                                currentIndex: _currentIndex,
                              ),
                            );
                          })
                          .values
                          .toList(),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 1.5,
                        vertical: 10.0,
                      ),
                      // child: UserInfo(user: story.imageName),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void onAddButtonTapped(int index) {
  //   // use this to animate to the page
  //   // _pageController.animateToPage(index);

  //   // or this to jump to it without animating
  //   _pageController.jumpToPage(index);
  // }

//this will be invoked inside the next botton
  void _onTapDown(TapDownDetails details, Story story) {
    final double screenWidth = MediaQuery.of(context).size.width;
    //below means anywhere on the x axis
    final double dx = details.globalPosition.dx;

    //to go back, but I didnt implement it
    if (dx < screenWidth / 3) {
      // setState(() {
      //   if (_currentIndex - 1 >= 0) {
      //     _currentIndex -= 1;
      //     _loadStory(story: widget.stories[_currentIndex]);
      //   }
      // });

      //to go forward
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (_currentIndex + 1 < widget.stories!.length) {
          _currentIndex += 1;
          _loadStory(story: widget.stories![_currentIndex]);
        } else {
          // Out of bounds - loop story
          // You can also Navigator.of(context).pop() here
          _currentIndex = 0;
          _loadStory(story: widget.stories![_currentIndex]);
        }
      });
      // } else {
      //   if (story.media == MediaType.video) {
      //     if (_videoController.value.isPlaying) {
      //       _videoController.pause();
      //       _animController.stop();
      //     } else {
      //       _videoController.play();
      //       _animController.forward();
      //     }
      //   }
    }
  }

  void _loadStory({required Story story, bool animateToPage = true}) {
    _animController!.stop();
    _animController!.reset();
    switch (story.media) {
      case MediaType.image:
        _animController!.duration = story.duration;
        _animController!.forward();
        break;
      // case MediaType.video:
      //   _videoController = null;
      //   _videoController?.dispose();
      //   _videoController = VideoPlayerController.network(story.image!)
      //     ..initialize().then((_) {
      //       setState(() {});
      //       if (_videoController!.value.isInitialized) {
      //         _animController!.duration = _videoController!.value.duration;
      //         _videoController!.play();
      //         _animController!.forward();
      //       }
      //     });
      //   break;
      case null:
        break;
      case MediaType.video:
        // TODO: Handle this case.
        break;
    }
    if (animateToPage) {
      _pageController!.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}
