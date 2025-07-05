import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_1_camp/Models/product_model.dart';
import 'package:task_1_camp/utils/Appcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_1_camp/utils/appStyle.dart';
class DetailsProductScreen extends StatefulWidget {
   DetailsProductScreen({super.key, required this.product});
   final ProductModel product;

  @override
  State<DetailsProductScreen> createState() => _DetailsProductScreenState();
}

class _DetailsProductScreenState extends State<DetailsProductScreen> {
  final List<Color> colors = [
    Color(0xFF9A5E57),
    Colors.black,
    Color(0xFF26A6C8),
    Color(0xFF00DB4A),
  ];
  bool fav=true;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: AppColor().bgdetails,
         body: Column(
           children: [
             SizedBox(height: 40.h,),
             Container(
               width: double.infinity,
               height: 350.h,
                 color: Colors.transparent,
               child: Column(
                 children: [
                   Row(
                     children: [
                       SizedBox(width: 10.w,),
                       Icon(Icons.arrow_back_ios_new,color: Colors.black,size: 30,),
                       SizedBox(width: 90.w,),
                       Text("Details product",style:AppStyle().black14.copyWith(fontSize: 18,fontWeight: FontWeight.bold),),
                       SizedBox(width: 85.w,),
                       Icon(Icons.card_travel_sharp,color: Colors.black,size: 30,)
                     ],
                   ),
                   Image.network("${widget.product.urlImage}")
                 ],
               ),
             ),
             Expanded(
                 child:Container(
                   width: double.infinity,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30)),
                     color: Colors.white
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(20.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         SizedBox(height: 10.h,),
                         Text( "${widget.product.title}",style: AppStyle().boldblack20),
                         SizedBox(height: 10.h,),
                         Row(
                           children: [
                             Icon(Icons.star,color: Colors.yellow,size: 30,),
                             SizedBox(width:  10.w,),
                             Text( "${widget.product.rate }",style: AppStyle().boldblack16),
                             SizedBox(width: 220.w,),
                             GestureDetector(
                               onTap: (){
                                 setState(() {
                                 fav=!fav;
                                 });
                               },
                                 child: Icon(Icons.favorite,color:fav? Colors.grey:Colors.red,size: 40,)),
                           ],
                         ),
                         SizedBox(height: 20.h,),
                         Column(
                           mainAxisSize: MainAxisSize.min,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               "Color",
                               style:AppStyle().boldblack20,
                             ),
                             SizedBox(height: 12),
                             Row(
                               mainAxisSize: MainAxisSize.min,
                               children: List.generate(colors.length, (index) {
                                 return GestureDetector(
                                   onTap: () {
                                     setState(() {
                                       selectedIndex = index;
                                     });
                                   },
                                   child: Container(
                                     margin: EdgeInsets.symmetric(horizontal: 8),
                                     width: 40,
                                     height: 40,
                                     decoration: BoxDecoration(
                                       color: colors[index],
                                       shape: BoxShape.circle,
                                     ),
                                     child: selectedIndex == index
                                         ? Icon(
                                       Icons.check,
                                       color: Colors.white,
                                       size: 24,
                                     )
                                         : null,
                                   ),
                                 );
                               }),
                             ),
                           ],
                         ),
                         SizedBox(height: 30.h,),
                         Container(
                           height: 100.h,
                           width: double.infinity,
                           color: Colors.transparent,
                           child: SingleChildScrollView(
                             child: Text(
                               widget.product.descrption,
                               style: AppStyle().gray20,
                             ),
                           ),
                         ),
                         Row(

                           children: [
                             Text( "\$",style: AppStyle().boldblack30.copyWith(fontSize: 40,color: AppColor().primary  ),),
                             Text( "${widget.product.price} ",style: AppStyle().boldblack30.copyWith(fontSize: 35),),
                             SizedBox(width: 30.w,),
                             Container(
                               width: 170.w,
                               height: 60.h,
                               decoration: BoxDecoration(
                                 color: AppColor().primary,
                                 borderRadius: BorderRadius.circular(50),
                               ),
                               child: Center(
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Icon(Icons.shopping_cart_sharp,color: Colors.white,size: 35,),
                                     Text("Add to cart",style: AppStyle().white20.copyWith(fontSize: 25),)
                                   ],
                                 ),
                               ),
                             )
                           ],
                         )

                       ],
                     ),
                   ),
                 ))
           ],
         ),
    );
  }
}
