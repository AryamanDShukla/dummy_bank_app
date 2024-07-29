import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/text.dart';



//////home screen quick actions container/////
myHSActionsContainer(IconData iconData,String name,Function() function){
  return Expanded(
    child: GestureDetector(
      onTap: function,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        child: Column(
          children: [
            Icon(iconData,size: 3.5.h,color: Colors.grey.shade800,),
            SizedBox(height: 0.8.h,),
            Text(name, textAlign: TextAlign.center,style: MyTextStyle.smallText.copyWith(fontSize: 14.5.sp,fontWeight: FontWeight.w500,color: Colors.grey.shade800),),
          ],
        ),
      ),
    ),
  );
}


////// home screen accounts container //////
myHSCardContainer(String name, String sortCode ,int accountNumber,  String amount, Function() function){
  return GestureDetector(
    onTap: function,
    child: Container(
      padding: EdgeInsets.only(bottom: 1.2.h,right: 4.w,left: 1.w),
      margin: EdgeInsets.only(left: 3.w,bottom: 0.5.h),
      decoration: BoxDecoration(
          border: Border(
             // top: BorderSide(width: 1.5,color: Colors.grey.shade300),
              bottom: BorderSide(width: 1.5,color: Colors.grey.shade300)
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.0.h,),
          Text(name, style: MyTextStyle.mediumText.copyWith(fontWeight: FontWeight.w500,fontSize: 16.5.sp),),
          SizedBox(height: 0.4.h,),
          Row(
            children: [
              Text(sortCode, style: MyTextStyle.smallText.copyWith(fontWeight: FontWeight.w500,color: Colors.grey.shade600,fontSize: 15.sp) ),
              SizedBox(width: 3.w),
              Text( accountNumber.toString() , style: MyTextStyle.smallText.copyWith(fontWeight: FontWeight.w500,color: Colors.grey.shade600,fontSize: 15.sp) ),
            ],
          ),
          SizedBox(height: 0.8.h,),
          Align(
            alignment: Alignment.centerRight,
            child: Text('£ ${amount}',style: MyTextStyle.smallMedium.copyWith(fontWeight: FontWeight.w500,fontSize: 16.5.sp)),
          ),
        ],
      ),
    ),
  );
}


myHSAlertContainer(){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.4.h ),
    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.8.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(1),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade800, offset: Offset(0, 0.9),blurRadius: 1,spreadRadius: 0.3)
        ]
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top:  0.1.h),
          child: Center(
            child: SizedBox(
                height: 5.5.h,
                width: 5.5.h,
                child: Image.asset('images/bulb.png')),
          ),
          height: 6.5.h,
          width: 6.5.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.shade100
          ),
        ),
        SizedBox(width: 2.w,),
        Expanded(
            child: Text('View, download and print your statements in our app. Just select your account, then \'View more\' and select \'View statements\'',
              style: MyTextStyle.smallText,
            )),
        SizedBox(width: 1.3.w,),
        Icon(Icons.close,color: Colors.grey.shade800,size: 3.3.h,)
      ],
    ),
  );
}




////// tab 2 details /////
tabDetails(){
  myRow(String title, String suffixText){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
      child: Row(
        children: [
          Expanded(child: Text(title, style: MyTextStyle.smallMedium.copyWith(color: Colors.grey.shade800,fontWeight: FontWeight.w500))),
          SizedBox(width:   14.w,),
          Text(suffixText, style: MyTextStyle.smallMedium.copyWith(color: Colors.grey.shade800))
        ],
      ),
    );
  }
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SizedBox(height: 3.h,),
         myRow('Credit limit', '9,400 £'),
         myRow('Latest statement date',  '16 Feb 2024' ),
         myRow('Payment due date', '8 Mar 2024'),
         myRow('Current minimum payment due', '140.00 £'),
         myRow('Reward points', '1894'),
      ],
    ),
  );
}






