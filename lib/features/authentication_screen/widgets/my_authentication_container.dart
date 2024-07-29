import 'package:bank_app/common/text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class MyAuthenticationScreenContainer extends StatefulWidget {
  IconData leadingIcon;
  IconData trailingIcon;
  Color borderColor ;
  String leadingText;
  String trailingText;
  Function() function;
   MyAuthenticationScreenContainer(
      {super.key, required this.leadingIcon, required this.trailingIcon, required this.borderColor,required this.leadingText, required this.trailingText, required this.function}
      );

  @override
  State<MyAuthenticationScreenContainer> createState() => _MyAuthenticationScreenContainerState();
}

class _MyAuthenticationScreenContainerState extends State<MyAuthenticationScreenContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function ,
      child: Container(
        padding: EdgeInsets.all(1.6.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: widget.borderColor, width: 1)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(widget.leadingIcon,color: Colors.grey.shade600,),
                Icon(widget.trailingIcon,color: Colors.grey.shade700,),
              ],
            ),
            SizedBox(height: 1.h,),
            Text(widget.leadingText,style: MyTextStyle.smallText ),
            SizedBox(height: 0.4.h,),
            Text(widget.trailingText, textAlign: TextAlign.start, )
          ],
        ),
      ),
    );
  }
}
