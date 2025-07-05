import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:task_1_camp/UI/Screens/loginScreen/LoginScreen.dart';
import 'package:task_1_camp/utils/appColor.dart';
import '../../../Models/onboerdmodel.dart';
import 'onboardingview.dart'; // Adjust if needed

class Onboarding extends StatelessWidget {
  Onboarding({super.key});

  static const routescreen = "onbording";

  final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      image: 'assets/images/onborading/Slice 1.png',
      title: 'Various Collections Of The Latest Products',
      subtitle: 'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    ),
    OnboardingModel(
      image: 'assets/images/onborading/Slice 2.png',
      title: 'Complete Collection Of Colors And Sizes',
      subtitle: 'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    ),
    OnboardingModel(
      image: 'assets/images/onborading/Slice 3.png',
      title: 'Find The Most Suitable Outfit For You',
      subtitle: 'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    ),
  ];

  void _onIntroEnd(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(Loginscreen.routescreen);
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: onboardingList.map((page) {
        return PageViewModel(
          titleWidget: const SizedBox(),
          bodyWidget: OnboardingView(
             url: page.image,
            title: page.title,
            subtitle: page.subtitle,
          ),
        );
      }).toList(),
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skip:  Text("Skip", style: TextStyle(fontSize: 16, color: AppColor().primary,)),
      next: Text("Next", style: TextStyle(fontSize: 16, color: AppColor().primary,)),
      done: Text("Done", style: TextStyle(fontSize: 16, color: AppColor().primary,)),
      dotsDecorator: DotsDecorator(
        size: const Size(13.0, 13.0),
        color: AppColor().primary,
        activeSize: const Size(22.0, 10.0),
        activeColor:AppColor().primary,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
