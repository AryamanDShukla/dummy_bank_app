import 'dart:async';

import 'package:bank_app/common/custom_snackbar.dart';
import 'package:bank_app/features/authentication_screen/auth_screen_controller/auth_screen_controller.dart';
import 'package:bank_app/features/my_bottom_nav_bar/view/my_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/colors.dart';
import '../../../common/text.dart';



class VerifyItsYou extends ConsumerStatefulWidget {


  static const String routeName = 'VerifyItsYou';
  const VerifyItsYou({super.key});

  @override
  ConsumerState<VerifyItsYou> createState() => _VerifyItsYouState();
}

class _VerifyItsYouState extends ConsumerState<VerifyItsYou> {
  bool isLoading = false;
  Key key = Key('value');

  @override
  Widget build(BuildContext context) {
    final authScreenData = ref.read(authScreenProvider);
    return  SafeArea(
          child: Scaffold(
            body: GestureDetector(
              onTap: (){
                Focus.of(context).unfocus();
              },
              child: Padding(
                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2.h,),
                      GestureDetector(
                        onTap: (){
                          context.pop();
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text('BACK',style: MyTextStyle.mediumText.copyWith(color: Colors.grey.shade700),),
                        ),
                      ),
                      SizedBox(height: 4.h,),
                      Text('Verify it\'s you',style: MyTextStyle.largeText,),
                      SizedBox(height: 1.h),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Text('Please select one of the following options and provide your account details, date of birth.',style: MyTextStyle.smallText,),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Text('After this step we\'ll check and proceed with the information you provided.',style: MyTextStyle.smallText,),
                      ),
                      SizedBox(height: 4.h,),

                      Text('Mobile Number'),
                      TextField(
                        controller: authScreenData.phoneNumber,
                        onEditingComplete: ()  {
                           authScreenData.checkFilledFunction();
                          setState(() {});
                        },
                        onChanged: (value) {
                           authScreenData.checkFilledFunction();
                          setState(() {});
                        },

                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0.5.h),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        cursorColor: Colors.green,
                        enabled: true,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.error_outline_rounded,color: Colors.deepPurple,),
                          SizedBox(width: 4,),
                          Text('Enter your 10-digit phone number')
                        ],
                      ),


                      SizedBox(height: 5.h,),


                      Text('Account number'),
                      TextField(
                        controller: authScreenData.accountNumber,
                        onEditingComplete: ()  {
                          authScreenData.checkFilledFunction();
                          setState(() {});
                        },
                        onChanged: (value) {
                          authScreenData.checkFilledFunction();
                          setState(() {});
                        },


                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0.5.h),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(5)
                          ),
                        ),
                        cursorColor: Colors.green,
                        enabled: true,
                        keyboardType: TextInputType.number,
                        maxLength: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.error_outline_rounded,color: Colors.deepPurple,),
                          SizedBox(width: 4,),
                          Text('Enter your 8-digit account number')
                        ],
                      ),

                      SizedBox(height: 25.h ,),

                      GestureDetector(
                        onTap: (){
                          setState(() {
                              isLoading = true;
                          });
                          if(authScreenData.isContinueEnabled){

                            Future.delayed(Duration(seconds: 2),() {
                              setState(() {
                                isLoading = false;
                              });

                              context.go(MyBottomNavigationBar.routeName);
                              CustomSnackbar.show(context, 'Log in successful.' );
                            },);

                          }
                          else{
                            CustomSnackbar.show(context, 'Please fill the fields properly.' );
                          }

                        },
                        child: Container(
                          height: 6.h,
                          decoration: BoxDecoration(
                              color: authScreenData.isContinueEnabled == false ? Colors.grey.shade300 : myRed,
                              border: Border.all(color: authScreenData.isContinueEnabled == false ? Colors.grey.shade700 : myRed, width: 1.3)
                          ),
                          child: Center(
                            child: isLoading ? SizedBox(
                                height: 2.5.h,
                                width: 2.5.h,
                                child: CircularProgressIndicator(color: Colors.white,)) :
                            Text('Continue', style: MyTextStyle.smallMedium.copyWith(
                              color: authScreenData.isContinueEnabled == false ? Colors.grey.shade600: Colors.white
                          )),
                          ),
                        ),
                      ),
                      SizedBox(height: 1.h,)


                    ],
                  ),
                ),
              ),
            ),
          ),
        );

  }
}
