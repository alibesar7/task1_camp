import 'package:flutter/material.dart';
import 'package:task_1_camp/UI/Screens/HomeScreen/HomeScreen.dart';
import 'package:task_1_camp/UI/Screens/loginScreen/LoginScreen.dart';
import 'package:task_1_camp/UI/Screens/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/product_cubit/productCubit.dart';
import 'UI/Screens/onboarding/onbording.dart';
import 'package:dio/dio.dart';
void main() {
  runApp(const MyApp());
}
 class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     return ScreenUtilInit(
       designSize: const Size(358, 793),
       minTextAdapt: true,
       splitScreenMode: true,
       builder: (context,child){
         return  MaterialApp(
           debugShowCheckedModeBanner: false,
           initialRoute: Splashscreen.routescreen,
           routes: {
             Splashscreen.routescreen:(context )=>Splashscreen(),
             Onboarding.routescreen:(context)=>Onboarding(),
             Loginscreen.routescreen:(context)=>Loginscreen(),
             Homescreen.routescreen: (context) => Homescreen(),
           },
         );
       },
     );
   }
 }
