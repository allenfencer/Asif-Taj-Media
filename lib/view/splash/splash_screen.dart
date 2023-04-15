import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_media/constants/fonts.dart';
import 'package:tech_media/utils/routes/route_name.dart';

import '../../constants/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    isLogin();
    super.initState();
  }

  isLogin() {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushNamedAndRemoveUntil(
              context, RouteName.dashboardScreen, (route) => false));
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushNamedAndRemoveUntil(
              context, RouteName.loginScreen, (route) => false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 180,
            width: 180,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
                child: Text(
              'Chat App',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: AppColors.whiteColor),
            )),
          )
        ],
      )),
    );
  }
}
