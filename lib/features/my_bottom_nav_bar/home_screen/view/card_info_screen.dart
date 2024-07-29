
import 'package:bank_app/common/colors.dart';
import 'package:bank_app/common/text.dart';
import 'package:bank_app/features/my_bottom_nav_bar/home_screen/view/view_statement_screen.dart';
import 'package:bank_app/features/my_bottom_nav_bar/view/my_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/account_related.dart';
import '../widgets/tab1_transaction.dart';
import '../widgets/widgets.dart';


class CardInfoScreen extends ConsumerStatefulWidget {
  static const String routeName = 'CardInfoScreen';
  const CardInfoScreen({Key? key}) : super(key: key);

  @override
  _CardInfoScreenState createState() => _CardInfoScreenState();
}

class _CardInfoScreenState extends ConsumerState<CardInfoScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('Account',style: MyTextStyle.largeText,),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding: EdgeInsets.only(bottom: 1.2.h,right: 4.w,left: 3.w),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 1.0.h,),
                  Text('SAVINGS A/C', style: MyTextStyle.mediumText.copyWith(fontWeight: FontWeight.w500),),
                  SizedBox(height: 0.4.h,),
                  Row(
                    children: [
                      Text(basicAccountSortCode, style: MyTextStyle.smallText.copyWith(fontWeight: FontWeight.w500,color: Colors.grey.shade600,fontSize: 15.sp) ),
                      SizedBox(width: 3.w),
                      Text( basicAccountNumber.toString() , style: MyTextStyle.smallText.copyWith(fontWeight: FontWeight.w500,color: Colors.grey.shade600,fontSize: 15.sp) ),
                    ],
                  ),
                  SizedBox(height: 0.8.h,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('£ ${formatDouble(basicAccountBalance)}',style: MyTextStyle.smallMedium.copyWith(fontWeight: FontWeight.w500,fontSize: 16.5.sp)),
                  ),
                ],
              ),
            ),

            Divider(color: Colors.grey.shade300, thickness: 0.23.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 1.7.h),
              child: GestureDetector(
                onTap: () {
                  context.go('${MyBottomNavigationBar.routeName}/${CardInfoScreen.routeName}/${ViewStatementScreen.routeName}');
                },
                child: Row(
                  children: [
                    Icon(Icons.file_copy_rounded,color: Colors.grey.shade700,),
                    SizedBox(width: 3.w),
                    Text('View statements',style: MyTextStyle.smallMedium.copyWith(fontWeight: FontWeight.w500, color: Colors.grey.shade700),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded, size: 2.4.h,color: Colors.grey.shade900,),
                  ],
                ),
              ),
            ),
            Divider(color: Colors.grey.shade300, thickness: 0.23.h),
            TabBar(
              controller: _tabController,
              overlayColor: MaterialStatePropertyAll(Colors.white),
              automaticIndicatorColorAdjustment: true,
              indicatorColor: myRed,
              labelStyle: MyTextStyle.smallText.copyWith(fontWeight: FontWeight.w500,color: Colors.grey.shade700),
              dividerHeight: 0,
              tabs: [
                Tab(child: Container(
                  width: double.infinity,
                  child: Center(child: Text('Transactions'),),
                )),
                Tab(child: Container(
                  width: double.infinity,
                  child: Center(child: Text('Details'),),
                )),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Content for Tab 1
                  Tab1Transactions(),

                  tabDetails()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
