import 'package:bank_app/common/custom_snackbar.dart';
import 'package:bank_app/common/text.dart';
import 'package:bank_app/features/my_bottom_nav_bar/view/my_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/colors.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = 'SignInScreen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isPasswordVisible = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: true,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('Help'),
                  value: 'Help',
                ),
                PopupMenuItem(
                  child: Text('Raise Issue'),
                  value: 'Raise Issue',
                ),
              ],
              onSelected: (String value) {
                if (value == 'Help') {
                  // Handle Help action
                } else if (value == 'Raise Issue') {
                  // Handle Raise Issue action
                }
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4.h),
              Text('Enter your username', style: MyTextStyle.smallText),
              SizedBox(height: 0.6.h),
              Container(
                padding: EdgeInsets.only(left: 2.5.w, right: 1.w),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.grey), // Top border
                    bottom: BorderSide(width: 2.0, color: Colors.black), // Bottom border (thicker)
                    left: BorderSide(width: 1.0, color: Colors.grey), // Left border
                    right: BorderSide(width: 1.0, color: Colors.grey), // Right border
                  ),
                ),
                child: Center(
                  child: TextField(
                    controller: username,
                    cursorColor: Colors.green,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Username',
                      suffixIcon: Icon(Icons.question_mark_rounded, color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Text('Enter your password', style: MyTextStyle.smallText),
              SizedBox(height: 0.6.h),
              Container(
                padding: EdgeInsets.only(left: 2.5.w, right: 1.w),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.grey), // Top border
                    bottom: BorderSide(width: 2.0, color: Colors.black), // Bottom border (thicker)
                    left: BorderSide(width: 1.0, color: Colors.grey), // Left border
                    right: BorderSide(width: 1.0, color: Colors.grey), // Right border
                  ),
                ),
                child: Center(
                  child: TextField(
                    controller: password,
                    cursorColor: Colors.green,
                    obscureText: !isPasswordVisible,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(isPasswordVisible ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  if (username.text.isEmpty || password.text.isEmpty) {
                    CustomSnackbar.show(context, 'Please enter your username and password.');
                  } else {
                    // Start loading
                    setState(() {
                      isLoading = true;
                    });

                    // Simulate loading for 2 seconds
                    Future.delayed(Duration(seconds: 2), () {
                      // Stop loading
                      setState(() {
                        isLoading = false;
                      });
                      context.go(MyBottomNavigationBar.routeName);

                      // Continue action
                    });
                  }
                },
                child: Container(
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: username.text.isEmpty || password.text.isEmpty ? Colors.grey.shade300 : myRed,
                    border: Border.all(color: username.text.isEmpty || password.text.isEmpty ? Colors.grey.shade400 : myRed, width: 1.3),
                  ),
                  child: Center(
                    child: isLoading
                        ? SizedBox(
                           height: 2.5.h,
                           width: 2.5.h,
                           child: CircularProgressIndicator(color: Colors.white,)) // Loading indicator
                        : Text(
                      'Continue',
                      style: MyTextStyle.smallMedium.copyWith(
                        color: username.text.isEmpty || password.text.isEmpty ? Colors.grey.shade700 : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
