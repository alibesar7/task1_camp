import 'dart:async'; // Correct import for Timer
import 'package:flutter/material.dart';
import 'package:task_1_camp/main.dart';
import 'package:task_1_camp/utils/appColor.dart';
import 'package:task_1_camp/utils/appStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'onboarding/onbording.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
  static const routescreen = "splash_screen";

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 15), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Onboarding()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().primary,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 360.h,),
            Text("Kutuku",style:AppStyle().boldwhite50  ),
            Text("Any Shopping just from home",style:AppStyle(). white20 ),
          ],
        ),
      ),
    );
  }
}