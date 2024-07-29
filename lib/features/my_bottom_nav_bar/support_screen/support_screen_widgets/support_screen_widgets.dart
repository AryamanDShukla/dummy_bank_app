import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/text.dart';





////support screen container ////

Widget myScreenCards(String title, String subtitle, Function() function) {
  return GestureDetector(
    onTap: function,
    child: Container(
      width: 100.w,
      margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 1.5,
            blurRadius: 1.5,
            offset: Offset(0, 1.5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: MyTextStyle.smallMedium.copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 1.h),
          Text(
            subtitle,
            style: MyTextStyle.smallText.copyWith(color: Colors.grey.shade700),
          ),
        ],
      ),
    ),
  );
}
