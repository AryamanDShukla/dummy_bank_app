import 'package:bank_app/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/text.dart';



class ContactHSBCScreen extends StatefulWidget {
  static const String routeName = 'ContactHSBCScreen';
  const ContactHSBCScreen({super.key});

  @override
  State<ContactHSBCScreen> createState() => _ContactHSBCScreenState();
}

class _ContactHSBCScreenState extends State<ContactHSBCScreen> {

  bulletText(String text){
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h,left: 2.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
              offset: Offset(0,0.8.h),
              child: Icon(Icons.circle, color: Colors.black,size: 1.3.h)),
          SizedBox(width: 2.w,),
          Expanded(child: Text(text, style: MyTextStyle.smallMedium,))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('Support', style: MyTextStyle.largeText,),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Row(
                 children: [
                   Container(
                     height: 3.h,
                     width: 1.w,
                     color: myRed,
                   ),
                   SizedBox(width: 2.w,),
                   Expanded(child: Text('Important Information',style: MyTextStyle.largeText ))
                 ],
               ),
              SizedBox(height: 2.5.h),
              Text('Terms & Conditions',style: MyTextStyle.mediumLarge,),
              SizedBox(height: 2.h),
              Text('Our Business phone banking service is available between Monday to Friday 9:00 am to 6:00 pm Indian Standard Time (IST) to help you with your banking queries and transactions. For Interactive Voice Response (IVR) transactions, IVR enquiries and for emergency services like Lost Card Reporting and Stop Cheque Instructions our Phone Banking service is available 24/7',
                 style: MyTextStyle.smallText,),
              SizedBox(height: 3.h),
              Text('For reporting unauthorized transactions along with blocking of cards in case of loss/theft/mis-use of debit card or termination/revocation of card membership. Please use any of the below modes-',
                  style: MyTextStyle.smallMedium,),
              SizedBox(height: 2.h,),
              bulletText('Visit your nearest HSBC branch for terminating the use of HSBC debit card.'),
              bulletText('Please dial 1800 266 3456/ 1800 120 4722 (Domestic) & +91-40-65118001/+91-22-71728001(Overseas) for HSBC Premier Debit Cards.'),
              bulletText('Please dial 1800 267 3456/1800 121 2208 (Domestic) & +91-40-65118002 /+91-22-71728002 (Overseas) for HSBC Personal Banking Debit Cards.'),
              bulletText('Please dial 1800 419 5400 /1800 123 2979 & (040) 6126 8004 and (080) 7189 8004 (from overseas) for HSBC Retail Business Banking Debit Cards.'),
              bulletText('SMS BLOCK <space>HSBC<space><last four digits of your card number> to 575750 from your registered mobile number.'),


              SizedBox(height: 5.h,),
              Row(
                children: [
                  Container(
                    height: 3.h,
                    width: 1.w,
                    color: myRed,
                  ),
                  SizedBox(width: 2.w,),
                  Expanded(child: Text('UAE Contact Details',style: MyTextStyle.largeText ))
                ],
              ),
              SizedBox(height: 2.5.h),
              Text('''
The Hongkong and Shanghai Banking Corporation Limited, Representative office, UAE
          
Unit 802, 8th floor, M-Square Building, Sheikh Khalifa Bin Zayed Street, Bur Dubai, Dubai.
          
Working Days/Hours：
          
Monday-Thursday and Saturday : 8:00 AM to 3:00 PM
Friday: 7.30 AM to 12.30 PM
Email : nriservicesdubai@hsbc.com
          
Phone numbers : +9714 3028575 / +9714 3028529
              ''',style: MyTextStyle.smallMedium,),

            ],
          ),
        ),
      ),
     );
  }
}
