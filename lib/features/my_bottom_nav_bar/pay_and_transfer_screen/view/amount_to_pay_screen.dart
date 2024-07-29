import 'package:bank_app/common/account_related.dart';
import 'package:bank_app/common/colors.dart';
import 'package:bank_app/features/my_bottom_nav_bar/pay_and_transfer_screen/view/payee_account_type.dart';
import 'package:bank_app/features/my_bottom_nav_bar/pay_and_transfer_screen/view/review_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/custom_snackbar.dart';
import '../../../../common/text.dart';
import '../../support_screen/view/support_screen.dart';
import '../../view/my_bottom_nav_bar.dart';

class AmountToPayScreen extends StatefulWidget {
  static const String routeName = 'AmountToPayScreen';

  const AmountToPayScreen({Key? key}) : super(key: key);

  @override
  State<AmountToPayScreen> createState() => _AmountToPayScreenState();
}

class _AmountToPayScreenState extends State<AmountToPayScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController referenceController = TextEditingController();
  bool isLoading = false;
  double availableBalance = basicAccountBalance;


  @override
  void dispose() {
    amountController.dispose();
    referenceController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 5,
        centerTitle: true,
        title: Text(
          'Move Money',
          style: MyTextStyle.largeText,
        ),
        actions: [
          GestureDetector(
              onTap: (){
                showPaymentLimitsSnackBar(context);
              },
              child: Icon(Icons.question_mark)),
          SizedBox(width: 3.w,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1.5.h,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 0.8.h ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text('From',style: MyTextStyle.smallText.copyWith(color: Colors.grey.shade600),)),
                      Icon(Icons.arrow_forward_ios_rounded,color: myRed,size: 2.h,)
                    ],
                  ),
                  SizedBox(height: 0.6.h,),
                  Text('SAVINGS A/C', style: MyTextStyle.mediumText.copyWith(fontWeight: FontWeight.w500)),
                  SizedBox(height: 0.4.h),
                  Row(
                    children: [
                      Expanded(child: Text('${basicAccountSortCode}   ${basicAccountNumber}', style: MyTextStyle.smallText.copyWith(color: Colors.grey.shade700) )),
                      Text('£ ${formatDouble(availableBalance)}',style: MyTextStyle.smallText.copyWith(fontWeight: FontWeight.w500))
                    ],
                  )
                ],
              ),
            ),
            Divider(color: Colors.grey.shade400,thickness: 1.7),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 3.h),
                  Text('Amount',style: MyTextStyle.mediumText.copyWith(fontWeight: FontWeight.w500) ),
                  TextField(
                    controller: amountController,
                    onChanged: (value) {
                      setState(() { });
                    },
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      ThousandsSeparatorInputFormatter(),
                    ],
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric( horizontal: 1.w ),
                      hintFadeDuration: Duration(milliseconds: 500),
                      hintText: ' 0.00',
                      prefixText: '£ ',
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1.8)) ,
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1.8)),
                      errorText: _validateAmount(amountController.text),
                    ),
                  ),

                  SizedBox(height: 3.h),

                  Text('When',style: MyTextStyle.mediumText.copyWith(fontWeight: FontWeight.w500) ),
                  TextFormField(
                    initialValue: _getCurrentTime(),
                    readOnly: true,
                    onChanged: (value) {
                      setState(() {
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric( horizontal: 2.w ),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1.8)) ,
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1.8)),
                    ),
                  ),

                  SizedBox(height: 3.h),
                  Text('Reference',style: MyTextStyle.mediumText.copyWith(fontWeight: FontWeight.w500) ),
                  TextField(
                    controller: referenceController,
                    maxLines: 3,
                    cursorColor: Colors.green,
                    onChanged: (value){
                      setState(() {

                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter here',
                      hintStyle: MyTextStyle.smallText,
                      contentPadding: EdgeInsets.symmetric( horizontal: 2.w ),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1.8)) ,
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1.8)),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                      onTap: () async {
                        if (amountController.text.isEmpty || referenceController.text.isEmpty) {
                          CustomSnackbar.show(context, 'Please enter the amount and reference correctly.');
                        } else {
                          // Validate the amount
                          String? errorText = _validateAmount(amountController.text);

                          if (errorText != null) {
                            // Show error message
                            CustomSnackbar.show(context, errorText);
                          } else {
                            // Proceed to the next screen
                            double parsedValue = double.parse(amountController.text.replaceAll(',', ''));

                            // Check if the amount exceeds the available balance
                            if (parsedValue <= basicAccountBalance) {
                              setState(() {
                                isLoading = true;
                              });

                              // Simulate a delay for demonstration
                              await Future.delayed(Duration(seconds: 2));

                              // Update balance
                              basicAccountBalance -= parsedValue;
                              await SharedPreferenceService.saveBasicAccountBalance(basicAccountBalance);

                              amountToPay = parsedValue;
                              reference = referenceController.text;

                              setState(() {
                                isLoading = false;
                              });

                              context.go('${MyBottomNavigationBar.routeName}/${PayeeAccountType.routeName}/${AmountToPayScreen.routeName}/${ReviewScreen.routeName}');
                            } else {
                              CustomSnackbar.show(context, 'Transaction limit exceeded.');
                            }
                          }
                        }
                      },
                    child: Container(
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: amountController.text.isNotEmpty && referenceController.text.isNotEmpty ? myRed : Colors.grey.shade300,
                        border: Border.all(color: amountController.text.isNotEmpty && referenceController.text.isNotEmpty ? myRed : Colors.grey.shade400, width: 1.3),
                      ),
                      child: Center(
                        child: isLoading
                            ? SizedBox(
                              height: 2.5.h,
                              width: 2.5.h,
                              child: CircularProgressIndicator(color: Colors.white,),
                        )
                            : Text(
                          'Continue',
                          style: MyTextStyle.smallMedium.copyWith(color: amountController.text.isNotEmpty && referenceController.text.isNotEmpty ? Colors.white : Colors.grey.shade700),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 2.h,),
                  GestureDetector(
                    onTap: (){
                      amountController.clear();
                      referenceController.clear();
                    },
                    child: Container(
                      height: 6.h,
                      decoration: BoxDecoration(
                        color:  Colors.grey.shade300,
                        border: Border.all(color: Colors.grey.shade800, width: 1.3),
                      ),
                      child: Center(
                        child: Text(
                          'Clear',
                          style: MyTextStyle.smallMedium.copyWith(
                            color:  Colors.grey.shade800,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 8.h,),
                  GestureDetector(
                    onTap: (){
                      showPaymentLimitsSnackBar(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('View payment limits  ',style: MyTextStyle.smallText.copyWith(fontWeight: FontWeight.w500),),
                        Icon(Icons.arrow_forward_ios_rounded,size: 1.8.h,color: myRed,)
                      ],
                    ),
                  )
                ],
              ),
            )


          ],
        ),
      ),
    );
  }

  String _getCurrentTime() {
    return DateFormat('dd MMMM yyyy').format(DateTime.now());
  }

   showPaymentLimitsSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        //duration: Duration(seconds: 5),
        content: Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment Limit 💵',
                    style: MyTextStyle.mediumText.copyWith(fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              Text(
                'Withdrawal Limit: 5 transactions per month, with a maximum limit of £50,000  per transaction.',
                style: MyTextStyle.smallText,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.h),
        ),
      ),
    );
  }


  String? _validateAmount(String? value) {
    if (value != null && value.isNotEmpty) {
      // Remove thousands separator and parse the amount
      double amount = double.tryParse(value.replaceAll(',', '')) ?? 0.0;

      // Check if the amount exceeds the available balance
      if (amount > availableBalance) {
        return 'Transaction limit exceeded the available balance.';
      } else if (amount > 50000) {
        return 'Max transaction limit is £50,000.';
      }
    }
    return null;
  }


}
