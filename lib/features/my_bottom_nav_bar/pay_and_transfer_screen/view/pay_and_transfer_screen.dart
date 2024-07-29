import 'package:bank_app/features/my_bottom_nav_bar/pay_and_transfer_screen/view/payee_account_type.dart';
import 'package:bank_app/features/my_bottom_nav_bar/view/my_bottom_nav_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/text.dart';
import '../pay_screen_widgets/pay_screen_widgets.dart';




class PayAndTransferScreen extends StatefulWidget {
  const PayAndTransferScreen({super.key});

  @override
  State<PayAndTransferScreen> createState() => _PayAndTransferScreenState();
}

class _PayAndTransferScreenState extends State<PayAndTransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 20.h,
                  width: 100.w,
                  color: Colors.grey.shade700,
                  child: Image.asset(
                    'images/stack.jpeg',
                    fit: BoxFit.fitHeight, // Adjust fit as needed
                  ),
                ),
                Positioned(
                    top: 6.h,
                    right: 0,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 3.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 2.w,),
                          GestureDetector(
                            onTap: (){},
                            child: Container(
                              height: 5.5.h,
                              width: 5.5.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(Icons.person_outline_rounded),
                              ),
                            ),
                          )

                        ],
                      ),
                    )
                ),

                Positioned(
                    top: 13.5.h,
                    left: 0,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 3.w),
                      child: Text('Pay & Transfer',style: MyTextStyle.largeText.copyWith(color: Colors.white, fontSize: 23.sp),),
                    )
                ),

              ],
            ),
            Divider(thickness: 0.8.h,color: Colors.grey.shade400,),
             payFromContainers('Pay and transfer',Icons.arrow_circle_up, (){
                  context.go('${MyBottomNavigationBar.routeName}/${PayeeAccountType.routeName}');
              }),
             payFromContainers('Deposit a cheque', Icons.payment, (){
               context.go('${MyBottomNavigationBar.routeName}/${PayeeAccountType.routeName}');
             }),
             payFromContainers('International payment tracker',Icons.payments_outlined, (){
               context.go('${MyBottomNavigationBar.routeName}/${PayeeAccountType.routeName}');
             }),
             payFromContainers('Manage payment limit',Icons.downloading_sharp, (){
               context.go('${MyBottomNavigationBar.routeName}/${PayeeAccountType.routeName}');
             }),
          ],
        ),
      ),

    );
  }
}
