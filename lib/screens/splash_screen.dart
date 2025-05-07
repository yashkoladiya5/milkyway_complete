import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:milkyway/auth/ui/log_in_page.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/home/ui/page_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

      String? isAlreadyLoggedIn =
          prefs.getString(SharedPreferenceKeys.lastLogInUserId);

      if (isAlreadyLoggedIn != null) {
        print("HOME PAGE.....");
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => PageViewScreen()),
        );
      } else {
        print("LOGIN PAGE.....");
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => LogInPage()),
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
