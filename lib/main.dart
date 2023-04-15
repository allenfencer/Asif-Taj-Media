import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tech_media/constants/color.dart';
import 'package:tech_media/constants/fonts.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/utils/routes/routes.dart';
import 'package:tech_media/view/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primaryMaterialColor,
        scaffoldBackgroundColor: AppColors.whiteColor,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          // backgroundColor: AppColors.whiteColor,
          color: AppColors.whiteColor,
          titleTextStyle: TextStyle(
              fontSize: 22,
              fontFamily: AppFonts.sfProDisplayMedium,
              color: AppColors.primaryTextTextColor),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 40,
              fontFamily: AppFonts.sfProDisplayMedium,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextTextColor),
          displayMedium: TextStyle(
              fontSize: 28,
              fontFamily: AppFonts.sfProDisplayMedium,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextTextColor),
          displaySmall: TextStyle(
              fontSize: 20,
              fontFamily: AppFonts.sfProDisplayMedium,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextTextColor),
          headlineLarge: TextStyle(
              fontSize: 32,
              fontFamily: AppFonts.sfProDisplayMedium,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextTextColor),
          headlineMedium: TextStyle(
              fontSize: 24,
              fontFamily: AppFonts.sfProDisplayMedium,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextTextColor),
          headlineSmall: TextStyle(
              fontSize: 17,
              fontFamily: AppFonts.sfProDisplayMedium,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextTextColor),
          bodySmall: TextStyle(
              fontSize: 14,
              fontFamily: AppFonts.sfProDisplayMedium,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextTextColor),
          bodyMedium: TextStyle(
              fontSize: 16,
              fontFamily: AppFonts.sfProDisplayBold,
              color: AppColors.primaryTextTextColor),
          bodyLarge: TextStyle(
              fontSize: 18,
              fontFamily: AppFonts.sfProDisplayBold,
              color: AppColors.primaryTextTextColor),
        ),
      ),
      home: const SplashScreen(),
      initialRoute: RouteName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
