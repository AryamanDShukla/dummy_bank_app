

import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';


class SharedPreferenceService {
  static late SharedPreferences _prefs;

  // Initialize SharedPreferences instance
  static Future<void> initState() async {
    _prefs = await SharedPreferences.getInstance();
    basicAccountBalance = _prefs.getDouble('basicAccountBalance') ?? 55630.00;
  }

  // Save basic account balance to SharedPreferences
  static Future<void> saveBasicAccountBalance(double balance) async {
    await _prefs.setDouble('basicAccountBalance', balance);
  }

  // Get basic account balance from SharedPreferences
  static double? getBasicAccountBalance() {
    return _prefs.getDouble('basicAccountBalance');
  }
}



String formatDouble(double number) {
  // Format the double number with 2 decimal places
  String formattedNumber = NumberFormat("#,##0.00", "en_US").format(number);
  return formattedNumber;
}


String sortCode = '23-45-43';

int basicAccountNumber = 81332897;
double basicAccountBalance =   SharedPreferenceService.getBasicAccountBalance()  ?? 55343.00;
String basicAccountSortCode = '23-45-43';


int visaPlatinumNumber = 99284632;
double visaPlatinumBalance = 673420.3;
String visaPlatinumSortCode = '95-67-34';


int creditCardNumber = 78769284;
double creditCardBalance = 24456.45;
String creditCardSortCode = '24-56-34';


//when paying reference string//
String payeesName = '';
int payeesAccountNumber = 0 ;
double amountToPay = 0;
String reference = '';