import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/account_related.dart';
import '../../../../common/text.dart';
import 'package:intl/intl.dart';

class Tab1Transactions extends StatefulWidget {
  const Tab1Transactions({super.key});

  @override
  State<Tab1Transactions> createState() => _Tab1TransactionsState();
}

class _Tab1TransactionsState extends State<Tab1Transactions> {

  monthContainer(String month){
    return Container(
      padding: EdgeInsets.only(left: 5.w,right: 5.w),
      margin: EdgeInsets.only(bottom: 0.2.h),
      height: 3.4.h,
      width: double.infinity,
      color: Colors.grey.shade300,
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(month,style: MyTextStyle.smallText.copyWith(color: Colors.grey.shade700),)),
    );
  }
  chargesContainer(String chargeName, String chargeDate, double chargeAmount) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      margin: EdgeInsets.only(bottom: 0.5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
            child: Icon(Icons.arrow_back, size: 2.h, color: Colors.grey.shade700),
            offset: Offset(0, 0.5.h),
          ),
          SizedBox(width: 3.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(chargeName, style: MyTextStyle.smallText.copyWith(color: Colors.grey.shade700)),
                SizedBox(height: 0.7.h),
                Row(
                  children: [
                    Expanded(child: Text(chargeDate, style: MyTextStyle.smallText.copyWith(color: Colors.grey.shade700))),
                    Text('- £${formatDouble(chargeAmount)} ', style: MyTextStyle.smallText.copyWith(color: Colors.grey.shade700)),
                    SizedBox(width: 2.w),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  List<Map<String, String>> transactions = [];

  Future<List<Map<String, String>>> getSavedTransactions() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? references = prefs.getStringList('references');
    final List<String>? dates = prefs.getStringList('dates');
    final List<String>? amounts = prefs.getStringList('amounts');

    List<Map<String, String>> savedTransactions = [];

    if (references != null && dates != null && amounts != null) {
      for (int i = 0; i < references.length; i++) {
        savedTransactions.add({
          'reference': references[i],
          'date': dates[i],
          'amount': amounts[i],
        });
      }
    }
    return savedTransactions.reversed.toList();
  }
  List<String> getUniqueMonths() {
    List<String> uniqueMonths = [];
    for (var transaction in transactions) {
      if (!uniqueMonths.contains(transaction['date']!.substring(3))) {
        uniqueMonths.add(transaction['date']!.substring(3));
      }
    }
    return uniqueMonths;
  }

  List<Map<String, String>> getTransactionsForMonth(String month) {
    return transactions.where((transaction) => transaction['date']!.substring(3) == month).toList();
  }

  @override
  void initState() {
    super.initState();
    getSavedTransactions().then((value) {
      setState(() {
        transactions = value;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          for (var month in getUniqueMonths())
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                monthContainer(month),
                ...getTransactionsForMonth(month).map((transaction) => chargesContainer(transaction['reference']!, transaction['date']!, double.parse(transaction['amount']!))),
              ],
            ),
          monthContainer('February 2024'),
          SizedBox(height: 1.h,),
          chargesContainer('HOME RENT', '31 Jan 2024' , 14000.33 ),
          chargesContainer('LATE PAYMENT CHARGE', '21 Jan 2024' , 110.23 ),
          chargesContainer('FINANCE CHARGES', '28 Jan 2024' , 145.00 ),
          SizedBox(height: 1.h,),

          monthContainer('January 2024'),
          SizedBox(height: 1.h,),
          chargesContainer('AMAZON SERVICE', '10 Dec 2023' , 430.54 ),
          chargesContainer('HOME BILLS', '21 Nov 2023' , 1000.90 ),

          SizedBox(height: 1.h,),

          monthContainer('December 2023'),
          SizedBox(height: 1.h,),
          chargesContainer('ELECTRICITY BILL', '15 Nov 2023' , 700.00 ),
          chargesContainer('PHONE BILL', '10 Nov 2023' , 60.00 ),

          SizedBox(height: 1.h,),

          monthContainer('November 2023'),
          SizedBox(height: 1.h,),
          chargesContainer('GROCERY SHOPPING', '25 Oct 2023' , 2300.33 ),
          chargesContainer('INTERNET BILL', '20 Oct 2023' , 800.34 ),
        ],
      ),
    );
  }
}

