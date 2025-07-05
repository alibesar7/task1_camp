import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_1_camp/UI/Screens/HomeScreen/HomeScreen.dart';
import 'package:task_1_camp/cubit/login_screen_Cubit/login_cubit.dart';
import 'package:task_1_camp/cubit/login_screen_Cubit/login_states.dart';
import 'package:task_1_camp/main.dart';
import 'package:task_1_camp/utils/appColor.dart';
import 'package:task_1_camp/utils/appStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../custom_widget/custom_text_form_field.dart';
import 'package:dio/dio.dart';
class Loginscreen extends StatefulWidget {
  Loginscreen({super.key});

  static const routescreen="Loginscreen";

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailcontroller=TextEditingController() ;
  final TextEditingController passwordlcontroller=TextEditingController() ;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context ){
        return  LoginCubit(Dio());
      },
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){
          if(state is SuccessState){
            print("success");
            Navigator.pushNamed(context, Homescreen.routescreen);
          }
           else if (state is LoadingState){
              print("loaddd");
            }
           else if(state is ErrorState){
             print ("errrorrr");
          }
        },
        builder: (context,state){
          return  Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50.h,),
                      Text("Login Account",style: AppStyle().boldblack30,),
                      Text("Please login with registered account",style: AppStyle().gray20,),
                      SizedBox(height: 20.h,),
                      Text("Email or Phone Number",style: AppStyle().boldblack20,),
                      SizedBox(height: 20.h,),
                      CustomTextFormField(
                        controller: emailcontroller,
                        hintText: "Enter your email or Phone",
                        prefixIcon: Icons.mail_sharp,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Email or phone number is required';
                          }
                          return null;
                        },
                      ),
              
              
                      SizedBox(height: 20.h,) ,
                      Text("Password",style: AppStyle().boldblack20,),
                      SizedBox(height: 20.h,) ,
                      CustomTextFormField(
                        controller: passwordlcontroller,
                        hintText: "Enter your Password",
                        prefixIcon: Icons.lock_rounded,
                        obscureText: _obscureText,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Password is required';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 13.h),
                      Padding(
                        padding: const EdgeInsets.only(left:  250),
                        child: Text(
                          textAlign: TextAlign.left,
                          "Forget password",style: AppStyle().primary16,),
                      ),
              
                      SizedBox(height: 30.h),
                      SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child:  state is LoadingState?Center(child: CircularProgressIndicator())
                            :ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginCubit>().login(
                                  emailcontroller.text, passwordlcontroller.text);
                            }
                          },
                          child: Text("Sign In",style: AppStyle().white20,),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor().primary,
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Center(child: Text(textAlign: TextAlign.center,"Or using other method",style: AppStyle().gray20,)),
                      SizedBox(height: 40.h),
                      Padding(
                        padding: const EdgeInsets.only(left:70.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
              
                          ),
                          width: 180.w,
                          height: 40.h,
                          child: Row(
                            children: [
                              SizedBox(width: 20.h,),
                              Image.asset( "assets/images/AucLogos/GoogelIcon.png",
                                width: 30,height: 30,
                                fit:BoxFit.fill,),
                              SizedBox(width: 20.h,),
                              Text("Sign In with Google",style: AppStyle().primary16,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Padding(
                        padding: const EdgeInsets.only(left:70.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
              
                          ),
                          width: 200.w,
                          height: 40.h,
                          child: Row(
                            children: [
                              SizedBox(width: 20.h,),
                              Image.asset("assets/images/AucLogos/facebook Logo.png",
                                width: 30,height: 30,
                                fit:BoxFit.fill,),
                              SizedBox(width: 20.h,),
                              Text("Sign In with facebook",style: AppStyle().primary16,),
                            ],
                          ),
                        ),
                      )
              
                    ],
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
