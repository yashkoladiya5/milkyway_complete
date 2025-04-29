import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:milkyway/auth/ui/log_in_page.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/home/ui/home_screen.dart';
import 'package:milkyway/home/ui/page_view.dart';
import 'package:milkyway/provider/language_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late double height;
  late double width;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(seconds: 5));

      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? isLogin = prefs.getString(SharedPreferenceKeys.userDataKey);
      print("isLogin value: $isLogin");

      if (prefs.getString(SharedPreferenceKeys.userIdKey) != null) {
        context.setLocale(Locale('gu'));
        print("HOME PAGE.....");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PageViewScreen()),
        );
      } else {
        print("LOGIN PAGE.....");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LogInPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Positioned(
              top: height * 0.00,
              child: Container(
                // margin: EdgeInsets.only(
                //     right: width * 0.210, bottom: height * 0.130),
                child: Image.asset(
                  "assets/images/Auth/Auth_light_image/img-03 4.jpg",
                  // fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
                // top: height * 0.070,
                // left: width * 0.015,
                right: width * -0.00,
                bottom: height * 0.00,
                child: Container(
                  // color: Colors.red,
                  child: Image.asset(
                    "assets/images/Auth/Auth_light_image/img-03 3.png",
                    fit: BoxFit.contain,
                  ),
                )),
            Center(
              child: Container(
                height: height * 0.400,
                width: width * 0.800,
                // color: Colors.red,
                child: Image.asset(
                  "assets/images/Auth/Auth_light_image/Milkyway Logo Png file 1.png",
                  fit: BoxFit.contain,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
