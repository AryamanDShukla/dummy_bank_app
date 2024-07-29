import 'package:bank_app/features/my_bottom_nav_bar/view/my_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/account_related.dart';
import '../../../../common/text.dart';
import 'package:intl/intl.dart';

import '../pay_screen_widgets/pay_screen_widgets.dart'; // For date formatting




class ConfirmationScreen extends StatefulWidget {
  static const String routeName = 'ConfirmationScreen';
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {


  String date = DateFormat('dd MMMM yyyy').format(DateTime.now());

  Future<void> saveData(String reference, String date, double amountToPay) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? references = prefs.getStringList('references') ?? [];
    List<String>? dates = prefs.getStringList('dates') ?? [];
    List<String>? amounts = prefs.getStringList('amounts') ?? [];

    references.add(reference);
    dates.add(date);
    amounts.add(amountToPay.toString());

    await prefs.setStringList('references', references);
    await prefs.setStringList('dates', dates);
    await prefs.setStringList('amounts', amounts);

    print('Data saved successfully.');
  }


  @override
  void initState() {
    // TODO: implement initState
    date;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 5,
          centerTitle: true,
          title: Text(
            'Confirmation',
            style: MyTextStyle.largeText,
          ),
        ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                children: [
                  SizedBox(height: 3.h,),
                  Container(
                    height: 7.5.h,
                    width: 7.5.h,
                    decoration: BoxDecoration(
                       color: Colors.grey.shade300,
                       shape: BoxShape.circle,
                    ),
                    child: Center(child: Icon(Icons.compare_arrows_rounded,color: Colors.grey.shade900,size: 6.h,),)
                    //Align(alignment: Alignment.bottomRight,child: Icon(Icons.check_circle_outline_rounded,color: Colors.green.shade700,),),
                  ),
                  SizedBox(height: 1.h,),
                  Text('Thank you',style: MyTextStyle.smallMedium.copyWith(fontWeight: FontWeight.w500, color: Colors.grey.shade800),),
                  SizedBox(height: 0.5.h),
                  Text('Your transfer has been completed ✅',textAlign: TextAlign.center,style: MyTextStyle.smallMedium.copyWith(fontWeight: FontWeight.w500, color: Colors.grey.shade700),),

                ],
              ),
            ),
            SizedBox(height: 4.h,),
            itemContainer('Confirmation number', '93492394X3493X401'),
            infoContainer('From', 'Savings A/C', basicAccountNumber.toString()),
            infoContainer('To', '${payeesName}', '${payeesAccountNumber.toString()}'),
            itemContainer('Amount', '£ ${formatDouble(amountToPay)}'),
            itemContainer('Reference', '${reference}'),
            itemContainer('Date', date),
            SizedBox(height: 7.5.h,),
            GestureDetector(
              onTap: () async{

                await saveData(reference, date, amountToPay);
                context.go(MyBottomNavigationBar.routeName);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 3.h,horizontal: 15.w),
                padding: EdgeInsets.symmetric(vertical: 1.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey.shade800,width: 1.5)
                ),
                child: Center(
                  child: Text('Go to home-screen',style: MyTextStyle.smallMedium.copyWith(fontWeight: FontWeight.w500),),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}







