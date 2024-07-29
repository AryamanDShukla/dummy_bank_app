
import 'package:bank_app/common/text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



//// screen containers////
payFromContainers(String name, IconData icon, Function() function){
  return GestureDetector(
    onTap: function,
    child: Container(
       padding: EdgeInsets.only(left: 3.w, right: 2.w, top: 2.h, bottom: 2.h),
       decoration: BoxDecoration(
           color: Colors.white,
           border: Border(bottom: BorderSide(color: Colors.grey.shade300))
        ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Icon(icon,size: 3.4.h,color: Colors.grey.shade800,),
           SizedBox(width: 3.w,),
           Expanded(child: Text(name, style: MyTextStyle.smallMedium.copyWith(fontWeight: FontWeight.w500,color: Colors.grey.shade800),)),
           Icon(Icons.arrow_forward_ios_rounded,size: 2.4.h,color: Colors.grey.shade800,)
         ],
       ),
    ),
  );
}


infoContainer(String formerText, String laterText, String laterSubText){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 1.4.h, horizontal: 3.w),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey.shade300,width: 1.4)),
    ),
    child: Row(
      children: [
        Expanded(child: Text(formerText,style: MyTextStyle.smallText.copyWith(color: Colors.grey.shade700),)),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( laterText ,style: MyTextStyle.smallMedium.copyWith(color: Colors.black, fontWeight: FontWeight.w500)),
            SizedBox(height: 0.3.h),
            Text( laterSubText ,style: MyTextStyle.smallText.copyWith(color: Colors.black, fontWeight: FontWeight.w400)),
          ],
        )
      ],
    ),

  );
}

itemContainer(String formerText, String laterText,) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 2.4.h, horizontal: 3.w),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey.shade300,width: 1.4)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 35.w,
          child: Text(
            formerText,
            style: MyTextStyle.smallText.copyWith(color: Colors.grey.shade700),
          ),
        ),

        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              laterText,
              style: MyTextStyle.smallMedium.copyWith(color: Colors.grey.shade800, fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    ),

  );
}
