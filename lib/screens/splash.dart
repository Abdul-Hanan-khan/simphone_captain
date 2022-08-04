import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sim_phone_captain/screens/walkthrough.dart';

import '../utils/navigation_controller/navigator_screen.dart';
import 'bottom_nav_screen/bottom_nav_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (GetStorage().read('token') != null) {
        Timer(const Duration(seconds: 1), () => Nav.pushAndRemoveAllRoute(context, const BottomNavScreen()));
      } else {
        Timer(const Duration(seconds: 1), () => Nav.push(context, const WalkthroughScreen()));
      }
    });

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          color: Colors.lightBlueAccent,
          child: Image.asset("assets/images/simphonelogo.png"),
        )
      ),
    );
  }
}
