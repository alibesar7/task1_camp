import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_1_camp/utils/appStyle.dart';

import '../../utils/Appcolor.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key, required this.url, required this.title, required this.des, required this.price});
  final String url;
  final String title;
  final String des;
  final String price;
  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 280.h,
      width: 180.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow:  [
            BoxShadow(
              color: AppColor().primary,
              blurRadius: 4,
              offset: Offset(0, 3),
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "$url",
            height: 150.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              "$title",
              style: AppStyle().boldblack20,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "$des"
                  .substring(0, 20),
              style: AppStyle().black14,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "\$$price",
              style: AppStyle().bolddeep24,
            ),
          ),
        ],
      ),

    );
  }
}