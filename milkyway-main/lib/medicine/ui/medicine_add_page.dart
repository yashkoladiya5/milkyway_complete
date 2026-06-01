import 'dart:io' show File;
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:provider/provider.dart';

class MedicineAddPage extends StatefulWidget {
  String imagePath;
  MedicineAddPage({super.key, required this.imagePath});

  @override
  State<MedicineAddPage> createState() => _MedicineAddPageState();
}

class _MedicineAddPageState extends State<MedicineAddPage> {
  late double height;
  late double width;
  late ThemeController themeController;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    themeController = Provider.of<ThemeController>(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                height: height,
                width: width,
                child: Image.file(
                  File(widget.imagePath),
                  fit: BoxFit.cover,
                )),
            Positioned(
              top: height * 0.050,
              left: width * 0.050,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: HexColor(AppColorsDark.whiteColor),
                  size: 30,
                ),
              ),
            ),
            Positioned(
              top: height * 0.800,
              left: width * 0.300,
              child: InkWell(
                onTap: () {
                  openDialog();
                },
                child: Container(
                  height: height * 0.070,
                  width: width * 0.400,
                  decoration: BoxDecoration(
                      color: HexColor(AppColorsLight.orangeColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Builder(builder: (context) {
                      return Text(
                        (AppStrings.upload).tr(),
                        style: TextStyle(
                            color: HexColor(AppColorsDark.whiteColor),
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      );
                    }),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  openDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            backgroundColor: HexColor(themeController.isLight
                ? AppColorsDark.whiteColor
                : AppColorsDark.backgroundColor),
            content: Container(
                alignment: Alignment.center,
                height: height * 0.140,
                width: width * 0.500,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.020,
                    ),
                    Builder(builder: (context) {
                      return Text(
                        textAlign: TextAlign.center,
                        (AppStrings.medicineAddPageDescription).tr(),
                        style: TextStyle(
                            color: HexColor(themeController.isLight
                                ? AppColorsLight.darkBlueColor
                                : AppColorsDark.whiteColor),
                            fontSize: 18),
                      );
                    }),
                    SizedBox(
                      height: height * 0.010,
                    ),
                    Text(
                      "👍",
                      style: TextStyle(fontSize: 25),
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
}
