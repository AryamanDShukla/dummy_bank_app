import 'package:bank_app/common/colors.dart';
import 'package:bank_app/common/custom_snackbar.dart';
import 'package:bank_app/common/text.dart';
import 'package:bank_app/features/authentication_screen/auth_screen_controller/auth_screen_controller.dart';
import 'package:bank_app/features/authentication_screen/view/verify_its_you.dart';
import 'package:bank_app/features/authentication_screen/view/authentication_screen.dart';
import 'package:bank_app/features/authentication_screen/widgets/my_authentication_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class RegisterNowScreen extends ConsumerStatefulWidget {
  static const String routeName = 'RegisterNowScreen';
   RegisterNowScreen({super.key});

  @override
  ConsumerState<RegisterNowScreen> createState() => _RegisterNowState();
}

class _RegisterNowState extends ConsumerState<RegisterNowScreen> {

  @override
  Widget build(BuildContext context) {
    var authScreenData = ref.read(authScreenProvider);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h,),
              Align(
                alignment: Alignment.centerRight,
                child: Text('CANCEL',style: MyTextStyle.mediumText.copyWith(color: Colors.grey.shade700),),
              ),
              SizedBox(height: 4.h,),
              Text('Verify your identity',style: MyTextStyle.largeText,),
              SizedBox(height: 2.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Text('Using Photo ID is the fastest and the easiest way to verify your identity.',style: MyTextStyle.smallText,),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Text('After this step we\'ll send you a one-time activation code via SMS. ',style: MyTextStyle.smallText,),
              ),
              SizedBox(height: 2.h,),
              MyAuthenticationScreenContainer(
                  function: (){
                    authScreenData.select1();
                    setState(() {});
                  },
                  leadingIcon: Icons.camera_alt,
                  trailingIcon: authScreenData.selectedIndex == 1 ? Icons.circle : Icons.circle_outlined,
                  borderColor:  authScreenData.selectedIndex == 1  ? Colors.green : Colors.grey.shade700,
                  leadingText: 'Verify with Photo ID and a Selfie',
                  trailingText: 'Enter your account details then take a photo of your chosed ID.'
              ),
              SizedBox(height: 3.h,),
              MyAuthenticationScreenContainer(
                  function: (){
                    authScreenData.select2();
                    setState(() {});
                  },
                  leadingIcon: Icons.smart_button_rounded,
                  trailingIcon: authScreenData.selectedIndex  == 2 ?  Icons.circle : Icons.circle_outlined ,
                  borderColor:  authScreenData.selectedIndex == 2  ? Colors.green : Colors.grey.shade700,
                  leadingText: 'I don\'t have a Photo ID',
                  trailingText: 'If you don\'t have a Photo ID you\'ll need to enter your account details along with your telephone security number'
              ),

              Spacer(),
              GestureDetector(
                onTap: (){
                    if(authScreenData.selectedIndex == 0){
                      CustomSnackbar.show(context, 'Please select one.');
                    }
                    else{
                      context.go('${AuthenticationScreen.routeName}/${RegisterNowScreen.routeName}/${VerifyItsYou.routeName}');
                    }
                },
                child: Container(
                  height: 6.h,
                  decoration: BoxDecoration(
                      color: authScreenData.selectedIndex == 0 ? Colors.grey.shade300 : myRed,
                      border: Border.all(color: authScreenData.selectedIndex == 0 ? Colors.grey.shade700 : myRed, width: 1.3)
                  ),
                  child: Center(child: Text('Continue', style: MyTextStyle.smallMedium.copyWith(
                    color: authScreenData.selectedIndex == 0 ? Colors.black : Colors.white
                  )),),
                ),
              ),
              SizedBox(height: 2.h,)


            ],
          ),
        ),
      ),
    );
  }
}
