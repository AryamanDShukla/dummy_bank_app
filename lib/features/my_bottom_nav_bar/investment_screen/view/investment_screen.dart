import 'package:bank_app/common/colors.dart';
import 'package:bank_app/common/text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// class InvestmentScreen extends StatelessWidget {
//   static const String routeName = 'InvestmentScreen';
//
//   final List<InvestmentData> investments = [
//     InvestmentData(name: 'BOL Stock', percentage: 18),
//     InvestmentData(name: 'ABP Stock', percentage: 40),
//     // Add more investment data as needed
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Investments',style: MyTextStyle.largeText,),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Investment Distribution',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             Flexible(
//               child: Container(
//                 child: CustomPaint(
//                   size: Size(300, 300), // Adjust size as needed
//                   painter: BarGraphPainter(investments),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: investments.map((investment) {
//                 return Row(
//                   children: [
//                     Container(
//                       width: 100, // Adjust width as needed
//                       child: Text(
//                         investment.name,
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                     SizedBox(width: 20),
//                     Text(
//                       '${investment.percentage}%',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class InvestmentData {
//   final String name;
//   final int percentage;
//
//   InvestmentData({required this.name, required this.percentage});
// }
//
// class BarGraphPainter extends CustomPainter {
//   final List<InvestmentData> investments;
//
//   BarGraphPainter(this.investments);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint();
//     final barWidth = 20.0; // Width of each bar
//     final spacing = 30.0; // Spacing between bars
//     final maxPercentage = investments.map((investment) => investment.percentage).reduce((a, b) => a > b ? a : b).toDouble();
//     final maxHeight = size.height - 60; // Adjust height as needed
//
//     // Draw bars
//     double startX = 0;
//     for (int i = 0; i < investments.length; i++) {
//       final height = (investments[i].percentage / maxPercentage) * maxHeight;
//       final startY = size.height - height;
//       final endX = startX + barWidth;
//       final endY = size.height;
//       paint.color = Colors.blue; // Change color as needed
//       canvas.drawRect(Rect.fromLTRB(startX, startY, endX, endY), paint);
//       startX += barWidth + spacing;
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }



class InvestmentScreen extends StatelessWidget {
  static const String routeName = 'InvestmentScreen';

  final List<Investment> investments = [
    Investment(name: 'Tesla', amount: 50000),
    Investment(name: 'Wells Fargo', amount: 45000),
    Investment(name: 'HSBC', amount: 38000),
    Investment(name: 'Microsoft', amount: 24000),
    Investment(name: 'Chase', amount: 15000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Investments',
          style: MyTextStyle.largeText,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Investment Overview',
              style: MyTextStyle.largeText.copyWith(fontSize: 19.2.sp),
            ),
            SizedBox(height: 2.h),
            InvestmentChart(investments: investments),
            SizedBox(height: 4.h),
            Row(
              children: [
                Text(
                  'Details  ',
                  style: MyTextStyle.mediumLarge.copyWith(fontWeight: FontWeight.w500),
                ),
                Text('( Total : 230000 )', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey.shade800))
              ],
            ),
            SizedBox(height: 1.h),
            Expanded(
              child: InvestmentDetails(investments: investments),
            ),
          ],
        ),
      ),
    );
  }
}

class Investment {
  final String name;
  final double amount;

  Investment({required this.name, required this.amount});
}

class InvestmentChart extends StatelessWidget {
  final List<Investment> investments;

  const InvestmentChart({required this.investments});

  @override
  Widget build(BuildContext context) {
    double maxAmount = investments.map((investment) => investment.amount).reduce((a, b) => a + b);
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 1.5.h,
      width: screenWidth,
      child: Row(
        children: [
          for (var investment in investments)
            Expanded(
              flex: (investment.amount / maxAmount * 100).toInt(),
              child: Container(
                decoration: BoxDecoration(
                  color: _getInvestmentColor(investment.name),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Color _getInvestmentColor(String name) {
    switch (name) {
      case 'Tesla':
        return Colors.blue.shade700;
      case 'Chase':
        return Colors.green.shade700;
      case 'Wells Fargo':
        return Colors.blueGrey.shade700;
      case 'HSBC':
        return myRed;
      case 'Microsoft':
        return Colors.purple.shade700;
      default:
        return Colors.black;
    }
  }
}

class InvestmentDetails extends StatelessWidget {
  final List<Investment> investments;

  const InvestmentDetails({required this.investments});

  @override
  Widget build(BuildContext context) {
    double maxAmount = investments.map((investment) => investment.amount).reduce((a, b) => a + b);
    return ListView.builder(
      itemCount: investments.length,
      itemBuilder: (context, index) {
        return Container(

          margin: EdgeInsets.symmetric(vertical: 1.5.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 0.5.h),
                width: 2.h,
                height: 2.h,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4),
                  color: _getInvestmentColor(investments[index].name),
                ),
              ),
              SizedBox(width: 2.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        investments[index].name,
                        style: MyTextStyle.mediumText.copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(' (${((investments[index].amount / maxAmount) * 100).toStringAsFixed(2)}%)',style: MyTextStyle.smallText.copyWith( fontSize: 14.sp,fontWeight: FontWeight.w500, color: Colors.grey.shade700),)
                    ],
                  ),
                  SizedBox(height: 1.h,),
                  Text('£ ${investments[index].amount} ',style: MyTextStyle.smallText.copyWith(fontWeight: FontWeight.w500,color: Colors.grey.shade800),),
                ],
              ),
            ],
          ),
        );
      },
    );
  }


  Color _getInvestmentColor(String name) {
    switch (name) {
      case 'Tesla':
        return Colors.blue.shade700;
      case 'Chase':
        return Colors.green.shade700;
      case 'Wells Fargo':
        return Colors.blueGrey.shade700;
      case 'HSBC':
        return myRed;
      case 'Microsoft':
        return Colors.purple.shade700;
      default:
        return Colors.black;
    }
  }

}
