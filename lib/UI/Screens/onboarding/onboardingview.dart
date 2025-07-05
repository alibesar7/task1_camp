import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_1_camp/utils/appStyle.dart';
class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key, required this.url, required this.title, required this.subtitle});
 final String url;
 final String title;
 final String subtitle;
  @override
  Widget build(BuildContext context) {
    return    Column(
        children: [
          SizedBox(height: 100.h,),
          Container(
              height: 350.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r)
              ),
              child: Image.asset("$url")),
          SizedBox(height: 20.h,),
          Text(textAlign: TextAlign.center,"$title",style: AppStyle().boldblack30,),
          SizedBox(height: 20.h,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(textAlign: TextAlign.center,"$subtitle",style: AppStyle().gray20,),
          ),
        ],

    );
  }
}
