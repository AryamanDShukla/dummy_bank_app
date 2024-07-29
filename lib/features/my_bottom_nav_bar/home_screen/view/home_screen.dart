import 'package:bank_app/common/account_related.dart';
import 'package:bank_app/common/text.dart';
import 'package:bank_app/features/my_bottom_nav_bar/home_screen/view/view_statement_screen.dart';
import 'package:bank_app/features/my_bottom_nav_bar/view/my_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../bottom_nav_controller/bottom_nav_controller.dart';
import '../home_screen_controller/home_screen_controller.dart';
import '../widgets/widgets.dart';
import 'enter_pin_screen.dart';








class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
   bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    var homeData = ref.read(homeScreenProvider);
    var navData = ref.read(navigationBarProvider);
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: SingleChildScrollView(
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
          
                            GestureDetector(
                              onTap: (){},
                              child: Container(
                                height: 6.h,
                                width: 6.h,
                                decoration: BoxDecoration(
                                  color: Colors.white ,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(Icons.notifications),
                                ),
                              ),
                            ),
                            SizedBox(width: 2.w,),
                            GestureDetector(
                              onTap: (){},
                              child: Container(
                                height: 6.h,
                                width: 6.h,
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
                        child: Text('Accounts',style: MyTextStyle.largeText.copyWith(color: Colors.white, fontSize: 24.sp),),
                      )
                  ),
          
                ],
              ),

              myHSAlertContainer(),

              GestureDetector(
                onTap: (){
                  context.go('${MyBottomNavigationBar.routeName}/${EnterPinScreen.routeName}');
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: 1.2.h,right: 4.w,left: 3.w),

                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1.5,color: Colors.grey.shade300),
                          bottom: BorderSide(width: 1.5,color: Colors.grey.shade300)
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 1.0.h,),
                      Text('SAVINGS A/C', style: MyTextStyle.mediumText.copyWith(fontWeight: FontWeight.w500,fontSize: 16.5.sp),),
                      SizedBox(height: 0.4.h,),
                      Row(
                        children: [
                          Text(basicAccountSortCode, style: MyTextStyle.smallText.copyWith(fontWeight: FontWeight.w500,color: Colors.grey.shade600,fontSize: 15.sp) ),
                          SizedBox(width: 3.w),
                          Text( basicAccountNumber.toString() , style: MyTextStyle.smallText.copyWith(fontWeight: FontWeight.w500,color: Colors.grey.shade600,fontSize: 15.sp) ),
                        ],
                      ),
                      SizedBox(height: 0.8.h,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('£ ${formatDouble(basicAccountBalance)}',style: MyTextStyle.smallMedium.copyWith(fontWeight: FontWeight.w500,fontSize: 16.5.sp)),
                      ),
                    ],
                  ),
                ),
              ),


              //quick actions wala//
              SizedBox(height: 2.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Quick actions',style: MyTextStyle.mediumLarge.copyWith(fontWeight: FontWeight.w500)),
                    SizedBox(height: 1.7.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myHSActionsContainer(Icons.copy, 'View eStatements & eAdvices',(){
                            context.go('${MyBottomNavigationBar.routeName}/${ViewStatementScreen.routeName}');
                        } ),
                        myHSActionsContainer(Icons.person_add_alt, 'Transfer to local payees / FPS',(){

                            navData.selectedIndex = 2;
                            navData.onItemTapped(2);
                            context.pushReplacement(MyBottomNavigationBar.routeName);


                        } ),
                        myHSActionsContainer(Icons.compare_arrows_rounded, 'Transfer to my local HSBC accounts',(){
                          navData.selectedIndex = 2;
                          navData.onItemTapped(2);
                          context.pushReplacement(MyBottomNavigationBar.routeName);
                        } ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 0.8.h,),
              Divider(thickness: 0.9.h, color: Colors.grey.shade300,),
              Padding(
                  padding: EdgeInsets.only(left: 3.w, top:  1.h),
                  child: Text('Suggested for you',style: MyTextStyle.mediumLarge.copyWith(fontWeight: FontWeight.w500))),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.4.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  border: Border.all(color: Colors.grey.shade400,width: 1.4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.close, size: 3.h,color: Colors.grey.shade800,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1.h, bottom: 3.h),
                      height: 13.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/mywallet.png'),
                            fit: BoxFit.fitWidth
                        ),
                      ),

                    ),
                    Text('Forgotten your debit card PIN? Retrieve it in an instant in your app. Choose your account, select \'View more\', then \'Manage cards\' and \'View card PIN\'.',
                      style: MyTextStyle.smallText )

                  ],
                ),
                
              ),

              SizedBox(height: 1.h,),
              Divider(thickness: 0.9.h, color: Colors.grey.shade300,),
              SizedBox(height: 0.7.h,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 0.7.h),
                  Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Text('Your accounts', style: MyTextStyle.mediumLarge.copyWith(fontWeight: FontWeight.w500),),
                  ),
                  SizedBox(height: 0.7.h),
                  myHSCardContainer('Savings A/C', basicAccountSortCode , basicAccountNumber , formatDouble(basicAccountBalance) ,
                          () { context.go('${MyBottomNavigationBar.routeName}/${EnterPinScreen.routeName}'); }
                  ),
                  myHSCardContainer('Visa Platinum', visaPlatinumSortCode, visaPlatinumNumber, formatDouble(visaPlatinumBalance)  ,() {
                    context.go('${MyBottomNavigationBar.routeName}/${EnterPinScreen.routeName}');
                  }),
                  myHSCardContainer('HSBC Credit', creditCardSortCode, creditCardNumber, formatDouble(creditCardBalance)  ,() {
                    context.go('${MyBottomNavigationBar.routeName}/${EnterPinScreen.routeName}');
                  }),
                  SizedBox(height: 2.5.h,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    height: 6.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade800,width: 1.5),
                      borderRadius: BorderRadius.circular(2)
                    ),
                    child: Center(child: Text('Customise account overview',style: MyTextStyle.mediumText.copyWith(fontWeight: FontWeight.w500),),),
                  )
                ],
              ),
          
              SizedBox(height: 1.2.h,),
              Divider(thickness: 0.25.h, color: Colors.grey.shade200,),


            ],
          ),
        ),
      ),
    );
  }
}
