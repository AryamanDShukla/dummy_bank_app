import 'package:bank_app/common/colors.dart';
import 'package:bank_app/common/custom_snackbar.dart';
import 'package:bank_app/common/text.dart';
import 'package:bank_app/features/authentication_screen/view/verify_its_you.dart';
import 'package:bank_app/features/authentication_screen/view/authentication_screen.dart';
import 'package:bank_app/features/authentication_screen/view/sign_in_screen.dart';
import 'package:bank_app/features/my_bottom_nav_bar/pay_and_transfer_screen/view/amount_to_pay_screen.dart';
import 'package:bank_app/features/my_bottom_nav_bar/pay_and_transfer_screen/view/confirmation_screen.dart';
import 'package:bank_app/features/my_bottom_nav_bar/pay_and_transfer_screen/view/review_screen.dart';
import 'package:bank_app/features/my_bottom_nav_bar/support_screen/view/FAQScreen.dart';
import 'package:bank_app/features/my_bottom_nav_bar/support_screen/view/contact_hsbc_screen.dart';
import 'package:bank_app/features/my_bottom_nav_bar/support_screen/view/find_branch_screen.dart';
import 'package:bank_app/features/my_bottom_nav_bar/view/my_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../features/authentication_screen/view/register_now.dart';
import '../features/my_bottom_nav_bar/home_screen/view/card_info_screen.dart';
import '../features/my_bottom_nav_bar/home_screen/view/enter_pin_screen.dart';
import '../features/my_bottom_nav_bar/home_screen/view/view_statement_screen.dart';
import '../features/my_bottom_nav_bar/pay_and_transfer_screen/view/payee_account_type.dart';
import '../features/splash_screen/splash_screen.dart';

GoRouter routes = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: SplashScreen.routeName,
        builder: (context, state) => SplashScreen(),
      ),

      GoRoute(
        path: AuthenticationScreen.routeName,
        builder: (context, state) => AuthenticationScreen(),
        routes: [
          GoRoute(
            path: SignInScreen.routeName,
            builder: (context, state) => SignInScreen(),
            routes: [
              GoRoute(
                path: VerifyItsYou.routeName,
                builder: (context, state) => VerifyItsYou(),
              )
            ]
          ),

          GoRoute(
              path: RegisterNowScreen.routeName,
              builder: (context, state) => RegisterNowScreen(),
              routes: [
                GoRoute(
                  path: VerifyItsYou.routeName,
                  builder: (context, state) => VerifyItsYou(),
                )
              ]
          )
        ]
      ),

      GoRoute(
        path: MyBottomNavigationBar.routeName,
        builder: (context, state) => MyBottomNavigationBar(),

        routes: [
          GoRoute(
            path: EnterPinScreen.routeName,
            builder: (context, state) => EnterPinScreen(),
            routes: [
              GoRoute(
                path: CardInfoScreen.routeName,
                builder: (context, state) => CardInfoScreen(),
              ),
            ]
          ),
          GoRoute(
            path: CardInfoScreen.routeName,
            builder: (context, state) => CardInfoScreen(),
            routes: [
              GoRoute(
                path: ViewStatementScreen.routeName,
                builder: (context, state) => ViewStatementScreen(),
              ),
            ]
          ),
          GoRoute(
            path: PayeeAccountType.routeName,
            builder: (context, state) => PayeeAccountType(),
            routes: [
              GoRoute(
                path: AmountToPayScreen.routeName,
                builder: (context, state) => AmountToPayScreen(),
                routes: [
                  GoRoute(
                    path: ReviewScreen.routeName,
                    builder: (context, state) => ReviewScreen(),
                    routes: [
                      GoRoute(
                        path: ConfirmationScreen.routeName,
                        builder: (context, state) => ConfirmationScreen(),
                      )
                    ]
                  )

                ]
              )
            ]
          ),

          GoRoute(
              path: ConfirmationScreen.routeName,
              builder: (context, state) => ConfirmationScreen(),
           ),

          GoRoute(
            path: ViewStatementScreen.routeName,
            builder: (context, state) => ViewStatementScreen(),
          ),


          //// support screen ///
          GoRoute(
            path: ContactHSBCScreen.routeName,
            builder: (context, state) => ContactHSBCScreen(),
          ),
          GoRoute(
            path: FindBranchScreen.routeName,
            builder: (context, state) => FindBranchScreen(),
          ),
          GoRoute(
            path: FAQScreen.routeName,
            builder: (context, state) => FAQScreen(),
          )
        ]
      ),

    ]
);

 confirmNavigation(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all( Radius.circular(2))),
      title: Text('Are you sure you want to exit?',style: MyTextStyle.mediumLarge,),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel',style: MyTextStyle.smallText.copyWith(color: myRed,fontWeight: FontWeight.w500),),
        ),
        TextButton(
          onPressed: (){
            SystemNavigator.pop();

          },
          child: Text('Exit',style: MyTextStyle.smallText.copyWith(color: Colors.black,fontWeight: FontWeight.w500),),
        ),
      ],
    ),
  );
}