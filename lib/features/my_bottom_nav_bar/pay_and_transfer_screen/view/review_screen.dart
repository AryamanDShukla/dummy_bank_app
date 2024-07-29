import 'package:bank_app/common/account_related.dart';
import 'package:bank_app/common/colors.dart';
import 'package:bank_app/common/text.dart';
import 'package:bank_app/features/my_bottom_nav_bar/pay_and_transfer_screen/view/confirmation_screen.dart';
import 'package:bank_app/features/my_bottom_nav_bar/view/my_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl/intl.dart'; // For date formatting


// class ReviewScreen extends StatefulWidget {
//   static const String routeName = 'ReviewScreen';
//   const ReviewScreen({super.key});
//
//   @override
//   State<ReviewScreen> createState() => _ReviewScreenState();
// }
//
// class _ReviewScreenState extends State<ReviewScreen> {
//
//   infoContainer(String formerText, String laterText, String laterSubText){
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 1.4.h, horizontal: 3.w),
//       decoration: BoxDecoration(
//         border: Border(bottom: BorderSide(color: Colors.grey.shade300,width: 1.4)),
//       ),
//       child: Row(
//         children: [
//           Expanded(child: Text(formerText,style: MyTextStyle.smallText.copyWith(color: Colors.grey.shade700),)),
//
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text( laterText ,style: MyTextStyle.smallMedium.copyWith(color: Colors.black, fontWeight: FontWeight.w500)),
//               SizedBox(height: 0.3.h),
//               Text( laterSubText ,style: MyTextStyle.smallText.copyWith(color: Colors.black, fontWeight: FontWeight.w400)),
//             ],
//           )
//         ],
//       ),
//
//     );
//   }
//
//   itemContainer(String formerText, String laterText,){
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 2.4.h, horizontal: 3.w),
//       decoration: BoxDecoration(
//         border: Border(bottom: BorderSide(color: Colors.grey.shade300,width: 1.4)),
//       ),
//       child: Row(
//         children: [
//           Expanded(child: Text(formerText,style: MyTextStyle.smallText.copyWith(color: Colors.grey.shade700),)),
//
//           Text( laterText ,style: MyTextStyle.smallMedium.copyWith(color: Colors.grey.shade800, fontWeight: FontWeight.w500))
//         ],
//       ),
//
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: true,
//           backgroundColor: Colors.white,
//           elevation: 5,
//           centerTitle: true,
//           title: Text(
//             'Review',
//             style: MyTextStyle.largeText,
//           ),
//         ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//              infoContainer('From', 'Basic Savings Account', '000-000000-000'),
//              infoContainer('To', 'Visa Platinum', 'Visa 000-00000-000'),
//              itemContainer('Amount', '10000 £'),
//              itemContainer('Reference', 'Payment'),
//              itemContainer('Date', '06 April 2024'),
//             SizedBox(height: 13.h,),
//             GestureDetector(
//               onTap: (){
//
//                 context.go('${MyBottomNavigationBar.routeName}/${ConfirmationScreen.routeName}');
//               },
//               child: Container(
//                 margin: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
//                 height: 6.h,
//                 decoration: BoxDecoration(
//                   color:  myRed,
//                 ),
//                 child: Center(
//                   child: Text(
//                     'Confirm',
//                     style: MyTextStyle.smallMedium.copyWith(
//                       color:  Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: (){
//                 context.pop();
//               },
//               child: Container(
//                 margin: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
//                 height: 6.h,
//                 decoration: BoxDecoration(
//                   color:  Colors.grey.shade300,
//                   border: Border.all(color: Colors.grey.shade800, width: 1.3),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'Cancel',
//                     style: MyTextStyle.smallMedium.copyWith(
//                       color:  Colors.grey.shade800,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 2.h,),
//
//             Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
//                 child: Text('Important information',style: MyTextStyle.smallText.copyWith(color: Colors.grey.shade700, fontWeight: FontWeight.w500) )
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 3.w),
//               child: Row(
//                 children: [
//                   IconButton(onPressed: (){
//
//                   }, icon: Icon(Icons.circle,color: Colors.grey.shade700,size: 1.h,)),
//                   Expanded(child: Text('Please check these details carefully before confirming',style: MyTextStyle.smallText.copyWith(color: Colors.grey.shade700),)),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//
//      );
//   }
// }

class ReviewScreen extends StatefulWidget {
  static const String routeName = 'ReviewScreen';
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  infoContainer(String formerText, String laterText, String laterSubText) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.4.h, horizontal: 3.w),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1.4)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              formerText,
              style: MyTextStyle.smallText.copyWith(color: Colors.grey.shade700),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                laterText,
                style: MyTextStyle.smallMedium.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 0.3.h),
              Text(
                laterSubText,
                style: MyTextStyle.smallText.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }

  itemContainer(String formerText, String laterText) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.4.h, horizontal: 3.w),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1.4)),
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

  bool isLoading = false;

  String _getCurrentTime() {
    return DateFormat('dd MMMM yyyy').format(DateTime.now());
  }

  navigatorFunc(BuildContext c){
    Navigator.pop(c);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 5,
        centerTitle: true,
        title: Text(
          'Review',
          style: MyTextStyle.largeText,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            infoContainer('From', 'Savings A/C', basicAccountNumber.toString()),
            infoContainer('To', '${payeesName}', '${payeesAccountNumber.toString()}'),
            itemContainer('Amount', '£ ${formatDouble(amountToPay)}'),
            itemContainer('Reference', '${reference}'),
            itemContainer('Date', _getCurrentTime()),
            SizedBox(height: 13.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                Future.delayed(Duration(seconds: 2), (){
                  setState(() {
                    isLoading = false;
                  });
                  showDialog(
                    context: context,
                    useRootNavigator: true,
                    builder: (BuildContext c) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        surfaceTintColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text('Payment Completed  ', style: MyTextStyle.mediumLarge.copyWith(color: myRed,fontWeight: FontWeight.w500)),
                                Container(
                                    height: 5.h,
                                    width:  5.h,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        shape: BoxShape.circle
                                    ),
                                    child: Icon(Icons.check,size: 4.h,color: Colors.green.shade700,)
                                ),
                              ],
                            ),
                            SizedBox(height: 2.5.h),
                            Text(
                              'Your payment has been successfully completed.',
                              textAlign: TextAlign.center,
                              style: MyTextStyle.smallMedium.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(onPressed: (){
                             navigatorFunc(c);
                             context.go('${MyBottomNavigationBar.routeName}/${ConfirmationScreen.routeName}');
                          }, child: Text('Ok',style: MyTextStyle.smallMedium.copyWith(fontWeight: FontWeight.w500),))
                        ],
                      );
                    },
                  );

                 }
                );

              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                height: 6.h,
                decoration: BoxDecoration(
                  color: myRed,
                ),
                child: Center(
                  child: isLoading
                      ? SizedBox(
                      height: 2.5.h,
                      width: 2.5.h,
                      child: CircularProgressIndicator(color: Colors.white,)
                  )
                      : Text(
                    'Continue',
                    style: MyTextStyle.smallMedium.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                height: 6.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  border: Border.all(color: Colors.grey.shade800, width: 1.3),
                ),
                child: Center(
                  child: Text(
                    'Cancel',
                    style: MyTextStyle.smallMedium.copyWith(
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              child: Text('Important information', style: MyTextStyle.smallText.copyWith(color: Colors.grey.shade700, fontWeight: FontWeight.w500)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.circle, color: Colors.grey.shade700, size: 1.h),
                  ),
                  Expanded(
                    child: Text(
                      'Please check these details carefully before confirming',
                      style: MyTextStyle.smallText.copyWith(color: Colors.grey.shade700),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
