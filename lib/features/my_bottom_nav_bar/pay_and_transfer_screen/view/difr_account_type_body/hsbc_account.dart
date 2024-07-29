import 'package:bank_app/common/account_related.dart';
import 'package:bank_app/common/colors.dart';
import 'package:bank_app/common/text.dart';
import 'package:bank_app/features/my_bottom_nav_bar/pay_and_transfer_screen/view/amount_to_pay_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../common/custom_snackbar.dart';
import '../../../view/my_bottom_nav_bar.dart';
import '../payee_account_type.dart';


class HSBCAccount extends StatefulWidget {
  const HSBCAccount({Key? key}) : super(key: key);

  @override
  State<HSBCAccount> createState() => _HSBCAccountState();
}

class _HSBCAccountState extends State<HSBCAccount> {
  bool addToPayeeList = false;
  bool isLoading = false;
  TextEditingController accNameController = TextEditingController();
  TextEditingController toAccountNumber = TextEditingController();
  TextEditingController payeeSortCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account holder',
            style: MyTextStyle.smallMedium.copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 0.5.h),
          Container(
            height: 7.h,
            padding: EdgeInsets.symmetric(vertical: 1.h),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black, width: 1),
                left: BorderSide(color: Colors.black, width: 1),
                right: BorderSide(color: Colors.black, width: 1),
                bottom: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            child: TextField(
              controller: accNameController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                hintText: 'Enter account holder name',
              ),
              maxLength: 140,
              cursorColor: Colors.green,
              style: MyTextStyle.smallMedium,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            'Payee\'s sort code',
            style: MyTextStyle.smallMedium.copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 0.5.h),
          Container(
            height: 7.h,
            padding: EdgeInsets.symmetric(vertical: 1.h),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black,width: 1.2),
            ),
            child: TextField(
              controller: payeeSortCode,
              onChanged: (value) {
                setState(() {});
              },
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                hintText: '##-##-##',
              ),
              cursorColor: Colors.green,
              style: MyTextStyle.smallMedium,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            'Payee\'s account number',
            style: MyTextStyle.smallMedium.copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 0.5.h),
          Container(
            height: 7.h,
            padding: EdgeInsets.symmetric(vertical: 1.h),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black,width: 1.2),
            ),
            child: TextField(
              controller: toAccountNumber,
              onChanged: (value) {
                setState(() {});
              },
              enableSuggestions: true,
              keyboardType: TextInputType.number,
              maxLength: 8,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                hintText: 'Enter payee\'s account number',
              ),
              cursorColor: Colors.green,
              style: MyTextStyle.smallMedium,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            'Add to your payee list for easier transfers in the future.',
            style: MyTextStyle.smallMedium,
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Expanded(
                child: Text('Add to your payee list', style: MyTextStyle.smallMedium.copyWith(fontWeight: FontWeight.w500)),
              ),
              SizedBox(
                width: 3.5.w, // Adjust as needed
                height: 2.3.h, // Adjust as needed
                child: Transform.scale(
                  scale: 0.78, // Adjust as needed
                  child: Switch(
                    value: addToPayeeList,
                    onChanged: (value) {
                      setState(() {
                        addToPayeeList = value;
                      });
                    },
                    activeColor: Colors.red, // Color of the toggle when it's switched on
                  ),
                ),
              ),
              SizedBox(width: 5.w,)
            ],
          ),
          SizedBox(height: 16.h),
          GestureDetector(
              onTap: () {
                if (accNameController.text.isEmpty || toAccountNumber.text.isEmpty) {
                  CustomSnackbar.show(context, 'Please enter the account info correctly.');
                } else if (payeeSortCode.text.length != 6) {
                  CustomSnackbar.show(context, 'Sort code should be 6 digits.');
                } else if (toAccountNumber.text.length != 8) {
                  CustomSnackbar.show(context, 'Account number should be 8 digits.');
                } else {
                  setState(() {
                    isLoading = true;
                  });

                  Future.delayed(Duration(seconds: 2), () {
                    setState(() {
                      isLoading = false;
                      payeesName = accNameController.text;
                      payeesAccountNumber = int.parse(toAccountNumber.text);
                    });
                    context.go('${MyBottomNavigationBar.routeName}/${PayeeAccountType.routeName}/${AmountToPayScreen.routeName}');
                  });
                }
              },
            child: Container(
              height: 6.h,
              decoration: BoxDecoration(
                color: accNameController.text.isNotEmpty && toAccountNumber.text.isNotEmpty ? myRed : Colors.grey.shade300,
                border: Border.all(color: accNameController.text.isNotEmpty && toAccountNumber.text.isNotEmpty ? myRed : Colors.grey.shade400, width: 1.3),
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
                    color: accNameController.text.isNotEmpty && toAccountNumber.text.isNotEmpty ? Colors.white : Colors.grey.shade700,
                          ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}




