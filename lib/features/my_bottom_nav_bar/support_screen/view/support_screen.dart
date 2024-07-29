import 'dart:math';

import 'package:bank_app/common/account_related.dart';
import 'package:bank_app/common/custom_snackbar.dart';
import 'package:bank_app/features/my_bottom_nav_bar/support_screen/view/FAQScreen.dart';
import 'package:bank_app/features/my_bottom_nav_bar/support_screen/view/contact_hsbc_screen.dart';
import 'package:bank_app/features/my_bottom_nav_bar/support_screen/view/find_branch_screen.dart';
import 'package:bank_app/features/my_bottom_nav_bar/view/my_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/text.dart';
import '../support_screen_widgets/support_screen_widgets.dart';
import 'package:intl/intl.dart';



class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {

  myText(String title){
    return Padding(padding: EdgeInsets.symmetric(horizontal: 3.5.w,vertical: 1.h),
      child: Text(title, style: MyTextStyle.smallMedium.copyWith(color: Colors.grey.shade800),),
    );
  }

  TextEditingController increaseBalanceController = TextEditingController();
  bool isVisible = false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text('Support', style: MyTextStyle.largeText,),
          ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myScreenCards('CONTACT HSBC', 'Enquire online, call or send a message',(){
                context.go('${MyBottomNavigationBar.routeName}/${ContactHSBCScreen.routeName}');
              }),
              myScreenCards('FIND A BRANCH OR ATM', 'Find your nearest HSBC branch or ATM',(){
                context.go('${MyBottomNavigationBar.routeName}/${FindBranchScreen.routeName}');
              }),
              myScreenCards('FREQUENTLY ASKED QUESTION', 'see the FAQs on your products',(){
                context.go('${MyBottomNavigationBar.routeName}/${FAQScreen.routeName}');
              }),
              myScreenCards('ABOUT HSBC', 'Careers, media, investors and corporate information',(){
                context.go('${MyBottomNavigationBar.routeName}/${FAQScreen.routeName}');
              }),
              SizedBox(height: 2.h),
              myText('Regulatory Disclosures'),
              myText('Hyperlink Policy'),
              myText('Privacy Statement'),
              myText('Site Terms'),
              GestureDetector(
                onTap: (){
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: myText('Sitemap'),
              ),

              Visibility(
                  visible:  isVisible,
                  child: Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.5.w,vertical: 2.h),
                        child: TextField(
                          controller: increaseBalanceController,
                          cursorColor: Colors.green,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [
                            ThousandsSeparatorInputFormatter(),
                          ],

                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            prefixText: '£ ',
                            hintText: ' Enter the new balance',
                            hintFadeDuration: Duration(milliseconds: 600),
                            contentPadding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 3.w)
                          ),
                        ),
                      ),

                      SizedBox(height: 0.8.h),
                      GestureDetector(
                        onTap: (){

                          try {
                            double parsedValue = double.parse(increaseBalanceController.text.replaceAll(',', ''));

                            basicAccountBalance = parsedValue;

                            Future.delayed(Duration(seconds: 1), () {
                              increaseBalanceController.clear();
                            });


                            SharedPreferenceService.saveBasicAccountBalance(basicAccountBalance);


                            CustomSnackbar.show(context, 'Balance increased');
                          }
                          catch(e){
                            CustomSnackbar.show(context, 'Write balance ');
                          }

                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.8.h),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Text('Save',style: MyTextStyle.mediumText.copyWith(color: Colors.white,fontWeight: FontWeight.w500),),
                        ),
                      ),

                      SizedBox(height: 5.h),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}




class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      // Remove any characters other than digits and dot
      String filteredValue = newValueText.replaceAll(RegExp(r'[^\d.]'), '');

      // Split value into parts separated by dot
      List<String> parts = filteredValue.split('.');

      // Ensure there are at most two decimal places
      if (parts.length > 1) {
        parts[1] = parts[1].substring(0, min(2, parts[1].length));
      }

      // Format the integer part with commas
      String integerPart = NumberFormat("#,##0", "en_US").format(int.tryParse(parts[0] ?? ''));

      // Concatenate integer and decimal parts with dot
      String newString = parts.length == 1 ? integerPart : '$integerPart.${parts[1]}';

      // Add separators every three digits
      newString = newString.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match match) => '${match[1]}$separator',
      );

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}

