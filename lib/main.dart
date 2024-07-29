
import 'dart:async';

import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'common/account_related.dart';
import 'common/routes.dart';







void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceService.initState();
   runApp( ProviderScope(child: MyApp()));
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.white, // Status bar color
      systemNavigationBarColor: Colors.white, // System navigation bar color
      systemNavigationBarIconBrightness: Brightness.light, // Navigation bar icons color
    ));

    return ResponsiveSizer(
      maxMobileWidth: double.infinity,
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.white),
              appBarTheme: AppBarTheme(
                  surfaceTintColor: Colors.white,
                  systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white))
          ),
          debugShowCheckedModeBanner: false,
          title: 'Bank App',
          routerConfig: routes,
        );
      },
    );
  }
}