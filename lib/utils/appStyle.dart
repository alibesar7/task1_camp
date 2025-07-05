import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_1_camp/utils/appColor.dart';

class AppStyle{
  TextStyle boldwhite50 =TextStyle(
      color: Colors.white,
      fontSize: 50 ,
      fontWeight: FontWeight.bold
  );
  TextStyle  white20=TextStyle(
      color: Colors.white,
      fontSize: 20 ,
  );
  TextStyle bolddeep24=TextStyle(
    fontSize: 24,
    color:AppColor().primary,
    fontWeight: FontWeight.bold,
  );
  TextStyle bolddeep16=TextStyle(
    fontSize: 16,
    color:AppColor().primary,
    fontWeight: FontWeight.bold,
  );
  TextStyle boldwhite16=TextStyle(
    fontSize: 16,
    color:Colors.white,
    fontWeight: FontWeight.bold,
  );
  TextStyle boldblack16=TextStyle(
    fontSize: 16,
    color:Colors.black,
    fontWeight: FontWeight.bold,
  );
  TextStyle  black14=TextStyle(
    fontSize: 14,
    color:Colors.black,
  );
  TextStyle  primary16=TextStyle(
    color: AppColor().primary,
    fontSize: 16 ,
    fontWeight: FontWeight.bold
  );
  TextStyle boldblack30=TextStyle(
    color: Color(0xff18212F),
    fontSize: 30,
      fontWeight: FontWeight.bold
  );
  TextStyle boldblack20=TextStyle(
      color: Color(0xff18212F),
      fontSize: 20,
      fontWeight: FontWeight.bold
  );
  TextStyle gray20=TextStyle(
    color: AppColor().ttextcolor,
    fontSize: 15,
  );
}