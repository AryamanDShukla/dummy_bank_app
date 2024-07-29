import 'dart:async';

import 'package:bank_app/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/text.dart';


class ViewStatementScreen extends StatefulWidget {
  static const String routeName = 'ViewStatementScreen';

  @override
  State<ViewStatementScreen> createState() => _ViewStatementScreenState();
}

class _ViewStatementScreenState extends State<ViewStatementScreen> {
  bool isIconVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Account Statements',
          style: MyTextStyle.largeText,
        ),
      ),
      body: Column(
        children: [
          yearContainer('2024'),
          yearContainer('2023'),
          yearContainer('2022'),
          yearContainer('2021'),
        ],
      ),
    );
  }

  Widget yearContainer(String year) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isIconVisible = true;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
        margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.7.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.edit_calendar,color: Colors.grey.shade900,),
                SizedBox(width: 2.w),
                Text(
                  year,
                  style: MyTextStyle.smallMedium.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade900,
                  ),
                ),
              ],
            ),

            AnimatedOpacity(
              opacity: isIconVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child:             isIconVisible ?
              GestureDetector(
                onTap: (){
                  _showDownloadDialog(context);
                },
                child: Container(
                  child:  Text('Download',style: MyTextStyle.smallText.copyWith(fontWeight: FontWeight.w500),),
                ),
              ) :
              SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }




  void _showDownloadDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Text('Downloading...',style: MyTextStyle.mediumText.copyWith(fontWeight: FontWeight.w500),),
          content: DownloadingTemplate(),
        );
      },
    );
  }
}

class DownloadingTemplate extends StatefulWidget {
  @override
  _DownloadingTemplateState createState() => _DownloadingTemplateState();
}

class _DownloadingTemplateState extends State<DownloadingTemplate> {
  int progress = 0;

  @override
  void initState() {
    super.initState();
    _startFakeDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Downloading: $progress%',style: MyTextStyle.smallMedium.copyWith(fontWeight: FontWeight.w500),),
        SizedBox(height: 3.h),
        LinearProgressIndicator(
          value: progress / 100,
          color: myRed,
        ),
      ],
    );
  }

  void _startFakeDownload() {
    const duration = Duration(milliseconds: 400);

    Timer.periodic(duration, (Timer timer) {
      setState(() {
        progress += 10;
        if (progress >= 100) {
          timer.cancel();
          _showDownloadCompleteDialog(context);
        }
      });
    });
  }

  void _showDownloadCompleteDialog(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pop(); // Close the download dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            title: Text('Download Complete',style: MyTextStyle.mediumLarge.copyWith(fontWeight: FontWeight.w500),),
            content: Text('Your file has been downloaded.', style: MyTextStyle.smallMedium,),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the complete dialog
                },
                child: Text('OK',style: MyTextStyle.smallMedium.copyWith(fontWeight: FontWeight.w500)),
              ),
            ],
          );
        },
      );
    });
  }
}
