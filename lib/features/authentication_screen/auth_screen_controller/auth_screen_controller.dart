import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authScreenProvider = Provider((ref) => AuthScreenController(ref: ref));

class AuthScreenController extends ChangeNotifier {
  ProviderRef ref;
  AuthScreenController({required this.ref});

  ///// Register now screen wale functions and all ////
  int selectedIndex = 0;
  select1() {
    selectedIndex = 1;
  }

  select2() {
    selectedIndex = 2;
  }

  ////// to enter phone and account details //////
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  bool isContinueEnabled = false;

  void checkFilledFunction() {
    if (phoneNumber.text.isNotEmpty &&
        phoneNumber.text.length == 10 &&
        accountNumber.text.isNotEmpty &&
        accountNumber.text.length == 8) {
      isContinueEnabled = true;
    } else {
      isContinueEnabled = false;
    }
    notifyListeners(); // Notify listeners of changes
  }
}
