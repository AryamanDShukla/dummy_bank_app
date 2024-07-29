import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../home_screen/view/home_screen.dart';
import '../investment_screen/view/investment_screen.dart';
import '../pay_and_transfer_screen/view/pay_and_transfer_screen.dart';
import '../support_screen/view/support_screen.dart';



final navigationBarProvider = Provider((ref) {
  return BottomNavBarController(ref: ref);
} );

class BottomNavBarController {
  final ProviderRef ref;
  BottomNavBarController({required this.ref});

  //////change the current pages ////
  int selectedIndex = 0;
  final List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    InvestmentScreen(),
    PayAndTransferScreen(),
    const SupportScreen()
  ];

   onItemTapped(int index) {
      selectedIndex = index;
  }

}













