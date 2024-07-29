import 'package:bank_app/common/colors.dart';
import 'package:bank_app/common/text.dart';
import 'package:bank_app/features/authentication_screen/view/register_now.dart';
import 'package:bank_app/features/authentication_screen/view/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class AuthenticationScreen extends StatefulWidget {
  static const String routeName = '/AuthenticationScreen';
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric( horizontal: 3.w ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(
                       height: 25.h,
                       width: 100.w,
                       child: Image.asset('images/worker_logo.jpg')),
                   SizedBox(height: 4.h,),
                  Text('Already registered for HSBC UK Digital Banking?', style: MyTextStyle.largeText,),
                  SizedBox(height: 1.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Text('If you already have a username and password, sign in to set up your device.',style: MyTextStyle.smallText,),
                  ),


                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Text('If you\'ve not registered, simply grab your passport or driving licence and select \'Register now\' for a quick and easy set up. ',style: MyTextStyle.smallText,),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Text('By registering for digital banking, you\'ll receive certain statements and documents in electronic form. ',style: MyTextStyle.smallText,),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Text('If you\'d like to change these preferences you can do so by visiting \'communication preferences\' within online banking.',style: MyTextStyle.smallText,),
                  ),
                  SizedBox(height: 8.h,),
                  GestureDetector(
                    onTap: (){
                      context.go('${AuthenticationScreen.routeName}/${SignInScreen.routeName}');
                    },
                    child: Container(
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: myRed,
                      ),
                      child: Center(child: Text('Sign in', style: MyTextStyle.smallMedium.copyWith(color: Colors.white),),),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  GestureDetector(
                    onTap: (){
                      context.go('${AuthenticationScreen.routeName}/${RegisterNowScreen.routeName}');
                    },
                    child: Container(
                      height: 6.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.7)
                      ),
                      child: Center(child: Text('Register now', style: MyTextStyle.smallMedium),),
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
