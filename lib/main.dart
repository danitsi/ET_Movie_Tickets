import 'dart:async';
import 'package:et_movie_tickets/mvc/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'util/helpers/connectivity.dart';

  void main() async {
   try {
     WidgetsFlutterBinding.ensureInitialized();
     await initApp();
     SystemChrome.setPreferredOrientations([
       DeviceOrientation.portraitUp,
       DeviceOrientation.portraitDown,
     ]);
     runApp(
          GetMaterialApp(
           home: HomeScreenPage(1),
           debugShowCheckedModeBanner: false,
           theme: ThemeData(
             backgroundColor: Colors.black,
           ),
            builder:  EasyLoading.init(),
            routes: const {

            },
         ));
     //Internet.getInstance().initialize();
     /* SystemChannels.lifecycle.setMessageHandler((msg) async {
       if (msg == AppLifecycleState.resumed.toString()) {
         await Internet.getInstance().initialize();
       }

       return null;
     });
     */

   }
   catch(ex)
   {

   }
  }
Future initApp() async {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..maskType = EasyLoadingMaskType.custom
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 60.0
    ..indicatorWidget = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white38,
      ),
      height: 100,
      width: 100,
      child: Lottie.asset(
        'assets/animations/loading.json',
      ),
    )
    ..radius = 100.0
    ..progressColor = Colors.orange
    ..backgroundColor = Colors.transparent
    ..indicatorColor = Colors.green
    ..textColor = Colors.white
    ..maskColor = Colors.black45
    ..userInteractions = false
    ..dismissOnTap = false
    ..boxShadow = <BoxShadow>[];
    //..customAnimation = CustomAnimation();
}
