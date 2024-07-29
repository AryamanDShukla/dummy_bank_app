import 'package:bank_app/common/text.dart';
import 'package:bank_app/features/my_bottom_nav_bar/home_screen/view/card_info_screen.dart';
import 'package:bank_app/features/my_bottom_nav_bar/view/my_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/colors.dart';
import '../../../../common/otp_field.dart';
import '../home_screen_controller/home_screen_controller.dart';



class EnterPinScreen extends ConsumerStatefulWidget {
  static const String routeName = 'EnterPinScreen';
  const EnterPinScreen({super.key});

  @override
  ConsumerState<EnterPinScreen> createState() => _EnterPinScreenState();
}

class _EnterPinScreenState extends ConsumerState<EnterPinScreen> {

  OtpFieldController otpController = OtpFieldController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 11.h,),
            Text('Hi Jos***',style: MyTextStyle.largeText,),
            SizedBox(height: 1.h,),
            Row(
              children: [
                Expanded(child: Text('Enter your 6-digit pin',style: MyTextStyle.smallText,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.question_mark,color: Colors.black,size: 2.4.h,) )
              ],
            ),
            SizedBox(height: 3.5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: OTPTextField(
                  controller: otpController,
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 5.w,
                  fieldStyle: FieldStyle.underline,
                  outlineBorderRadius: 1.h,
                  style: MyTextStyle.mediumLarge.copyWith(fontWeight: FontWeight.w500),
                  obscureText: true,
                  otpFieldStyle: OtpFieldStyle(
                      borderColor: Colors.red,
                      disabledBorderColor: Colors.red,
                      focusBorderColor: Colors.red
                  ),
                  onChanged: (pin) {
                    print("Changed: " + pin);
                  },
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  }),
            ),

            Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                Future.delayed(Duration(seconds: 1),() {
                  setState(() {
                    isLoading = false;
                    context.go( '${MyBottomNavigationBar.routeName}/${CardInfoScreen.routeName}' );
                  });

                },);
              },
              child: Container(
                height: 6.h,
                decoration: BoxDecoration(
                  color:  myRed,
                  border: Border.all(color: myRed, width: 1.3),
                ),
                child: Center(
                  child: isLoading
                      ? SizedBox(
                       height: 2.5.h,
                       width: 2.5.h,
                       child: CircularProgressIndicator(color: Colors.white)) // Loading indicator
                      : Text(
                    'Enter',
                     style: MyTextStyle.smallMedium.copyWith(
                      color:  Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 3.h,)

          ],
        ),
      ),
    );
  }
}
