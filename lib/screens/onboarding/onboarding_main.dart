import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skupal/helper/appcolors.dart';
import 'package:skupal/models/story_model.dart';
import 'package:skupal/screens/dashboard_c.dart';
import 'package:skupal/screens/login.dart';
import 'package:skupal/screens/onboarding/onboarding_data.dart';
import 'package:skupal/screens/reg_1.dart';
import 'package:skupal/widgets/animated_bars.dart';
import 'package:video_player/video_player.dart';

class OnBoardingMain extends StatefulWidget {
  final List<Story>? stories;

  const OnBoardingMain({this.stories});

  @override
  _OnBoardingMainState createState() => _OnBoardingMainState();
}

class _OnBoardingMainState extends State<OnBoardingMain>
    with SingleTickerProviderStateMixin {
  PageController? _pageController;
  AnimationController? _animController;
  VideoPlayerController? _videoController;
  int _currentIndex = 0;
  final onboardData = OnBoarding_Data.getItems();
  bool isLastIndex = false;

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
              PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    isLastIndex = index == 2;
                  },
                  itemCount: onboardData.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                              child: Image.asset(
                            onboardData[index].img,
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          )),
                          SizedBox(
                            height: 49,
                          ),
                          Container(
                            child: Text(
                              onboardData[index].title,
                              style: TextStyle(
                                fontSize: 24,
                                color: AppColor.Neutral1,
                                fontFamily: 'CerebriSansPro-Regular',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            child: Text(
                              onboardData[index].desc,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColor.Neutral3,
                                fontFamily: 'CerebriSansPro-Regular',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Spacer(),
                          isLastIndex
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 33),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        height: 49,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: AppColor.Main_Color,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) => Reg1()));
                                            },
                                            child: Text(
                                              'Create account',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: AppColor.White_Color,
                                                fontFamily:
                                                    'CerebriSansPro-Regular',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Container(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Already a member ? ',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColor.Main_Color,
                                              fontFamily:
                                                  'CerebriSansPro-Regular',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          LoginScreen()));
                                            },
                                            child: Text(
                                              'Login ',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: AppColor.Main_Color,
                                                fontFamily:
                                                    'CerebriSansPro-Regular',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(bottom: 33),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTapDown: (details) =>
                                            _onTapDownSkipBtn(story),
                                        child: Text(
                                          'Skip',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: AppColor.Main_Color,
                                            fontFamily:
                                                'CerebriSansPro-Regular',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTapDown: (details) =>
                                            _onTapDown(details, story),
                                        child: Container(
                                          width: 124,
                                          height: 49,
                                          decoration: BoxDecoration(
                                              color: AppColor.Main_Color,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  child: Text(
                                                    'Next',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color:
                                                          AppColor.White_Color,
                                                      fontFamily:
                                                          'CerebriSansPro-Regular',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15.33,
                                                ),
                                                Icon(
                                                  Icons.arrow_forward,
                                                  color: AppColor.White_Color,
                                                  size: 15,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                        ],
                      ),
                    );
                  }),
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

//for skip button
  void _onTapDownSkipBtn(Story story) {
    setState(() {
      if (_currentIndex + 2 < widget.stories!.length) {
        _currentIndex += 2;
        _loadStory(story: widget.stories![_currentIndex]);
      } else {
        // Out of bounds - loop story
        // You can also Navigator.of(context).pop() here
        _currentIndex = 0;
        _loadStory(story: widget.stories![_currentIndex]);
      }
    });
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
        duration: const Duration(milliseconds: 3),
        curve: Curves.easeInOut,
      );
    }
  }
}
