import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/custom_snackbar.dart';
import '../bottom_nav_controller/bottom_nav_controller.dart';



class MyBottomNavigationBar extends ConsumerStatefulWidget {
  static const routeName = '/MyBottomNavigationBar';

  MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  ConsumerState<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends ConsumerState<MyBottomNavigationBar> {

  bool canpop = false;
  @override
  Widget build(BuildContext context) {
    var navData = ref.read(navigationBarProvider);

    return Scaffold(
      body: navData.widgetOptions.elementAt(navData.selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navData.selectedIndex,
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey.shade600,
        selectedItemColor: Colors.red.shade700,
        selectedLabelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        onTap: (int index) {
          setState(() {
            navData.onItemTapped(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home,color: navData.selectedIndex == 0 ? Colors.red.shade700 : Colors.grey,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.auto_graph_rounded, color: navData.selectedIndex == 1 ? Colors.red.shade700 : Colors.grey ),
            label: 'Investment',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.compare_arrows_rounded, color: navData.selectedIndex == 2 ? Colors.red.shade700 : Colors.grey ),
            label: 'Pay \$ Transfer',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.message,color: navData.selectedIndex == 3 ? Colors.red.shade700 : Colors.grey),
            label: 'Support',
          ),
        ],
      ),
    );
  }

}






