import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/text.dart';



class FindBranchScreen extends StatefulWidget {
  static const String routeName = 'FindBranchScreen';
  const FindBranchScreen({super.key});

  @override
  State<FindBranchScreen> createState() => _FindBranchScreenState();
}

class _FindBranchScreenState extends State<FindBranchScreen> {

  bulletText(String text, String subText){
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h,left: 2.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check, color: Colors.green,size: 3.9.h),
          SizedBox(width: 2.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text,style: MyTextStyle.mediumText.copyWith(fontWeight: FontWeight.w500),),
                SizedBox(height: 0.7.h,),
                Text(subText, style: MyTextStyle.smallMedium)
              ],
            ),
          ),

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
          title: Text('Branch location near you', style: MyTextStyle.largeText,),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h,),
                Row(
                  children: [
                    Container(
                      height: 3.h,
                      width: 1.w,
                      color: myRed,
                    ),
                    SizedBox(width: 2.w,),
                    Expanded(child: Text('Find out more about our ATMs',style: MyTextStyle.largeText ))
                  ],
                ),
                SizedBox(height: 1.5.h),
                Text('You do not need to spend time waiting in queues at the branch to perform your transactions. An ATM provides you with most of the personal banking services. The Debit Card1 from HSBC is extremely versatile and simple to use, being valid both in India and overseas. What\'s more, you can use the HSBC Debit Card at HSBC Group ATMs and ATMs affiliated to the VISA network for cash withdrawal and VISA merchant outlets for purchases. This allows you 24-hour electronic access to upto three HSBC Savings / Current Accounts, wherever and whenever you need the money. Your debit card is internationally valid and combines the benefits of domestic and international usage in one card2.',style: MyTextStyle.smallMedium,),
                SizedBox(height: 3.h),

                Row(
                  children: [
                    Container(
                      height: 3.h,
                      width: 1.w,
                      color: myRed,
                    ),
                    SizedBox(width: 2.w,),
                    Expanded(child: Text('Features & benefits',style: MyTextStyle.largeText ))
                  ],
                ),
                SizedBox(height: 1.5.h),
                Text('You do not need to spend time waiting in queues at the branch to perform your transactions. The HSBC ATM provides you with the option of banking instantly for various transactions, here are some of the ways it will benefit you:',style: MyTextStyle.smallMedium,),
                SizedBox(height: 2.h),

                bulletText('Save Time', 'By banking at the ATM, you save on time spent traveling to the branch or waiting for a teller.'),
                bulletText('24/7 banking', 'At the ATM, you don\'t need to worry about reaching before closing time and banking on holidays.'),
                bulletText('Security features', 'When you bank at the ATM, you can make the most of its secure features like daily transaction limits and ATM receipts that help you keep track of your monies.'),
                bulletText('Withdraw money', 'You don\'t need to rush to the bank next time you need some cash. Cash up to your daily transaction limit can be withdrawn in a few minutes from the nearest HSBC or any VISA network/Cash Net/NFS ATM.'),




                SizedBox(height: 5.h,),
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
                Text('Resident/Non-Resident Individuals (excluding minors) holding SmartMoney/Savings/Current Accounts with HSBC India, either held singly or jointly on a \'either or survivor\' basis, may apply for a debit card.',
                  style: MyTextStyle.smallText,),
                SizedBox(height: 1.5.h),
                Text('All cash withdrawals overseas must be strictly in accordance with the Exchange Control Regulations of the Reserve Bank of India. The aggregate expenses (i.e. through cash/traveller\'s cheques/your bank accounts) should not exceed the limit set by RBI, as prevailing from time to time.',
                  style: MyTextStyle.smallText,),

              ],
            ),
          ),
        )

    );
  }
}



