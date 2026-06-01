import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_strings.dart' show AppStrings;
import 'package:milkyway/provider/theme_controller.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:milkyway/medicine/ui/medicine_add_page.dart';
import 'package:provider/provider.dart';

class MedicinePage extends StatefulWidget {
  const MedicinePage({super.key});

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  late double height;
  late double width;
  late ThemeController themeController;

  File? selectedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> getImage() async {
    var status = await Permission.camera.request();

    if (status.isGranted) {
      try {
        final XFile? photo = await _picker.pickImage(
          source: ImageSource.camera,
        );
        if (photo != null) {
          setState(() {
            selectedImage = File(photo.path);
          });

          print("Image Path: ${photo.path}");

          Navigator.push(context, CupertinoPageRoute(
            builder: (context) {
              return MedicineAddPage(imagePath: selectedImage!.path);
            },
          ));
        }
      } catch (e) {
        print("Error capturing image: $e");
      }
    } else if (status.isDenied) {
      print("Camera permission denied");
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    themeController = Provider.of<ThemeController>(context);
    return Scaffold(
      backgroundColor: HexColor(themeController.isLight
          ? AppColorsLight.backgroundColor
          : AppColorsDark.backgroundColor),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: width * 0.050, top: height * 0.080),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context, "MedicineScreen");
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.darkBlueColor
                      : AppColorsDark.whiteColor),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.250,
            ),
            _buildDescriptionContainer(),
            SizedBox(
              height: height * 0.20,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () async {
                  await getImage();
                },
                child: Container(
                  height: height * 0.080,
                  width: width * 0.180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: HexColor(themeController.isLight
                              ? AppColorsLight.greyColor
                              : "#00000080"),
                          blurRadius: 8,
                          spreadRadius: 0.01,
                          offset: Offset(2, 3))
                    ],
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.lightGreyColor
                        : AppColorsDark.darkGreyColor),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.camera_alt,
                      color: HexColor(AppColorsLight.orangeColor),
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.010),
                child: Builder(builder: (context) {
                  return Text(
                    (AppStrings.medicine).tr(),
                    style: TextStyle(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor),
                        fontSize: 12),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionContainer() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: width * 0.070),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.035, vertical: height * 0.030),
      height: height * 0.180,
      width: width * 0.85,
      decoration: BoxDecoration(
          color: HexColor(themeController.isLight
              ? AppColorsLight.lightGreyColor
              : AppColorsDark.darkGreyColor),
          boxShadow: [
            BoxShadow(
                color: HexColor(themeController.isLight
                    ? AppColorsLight.greyColor
                    : "#00000080"),
                blurRadius: 8,
                offset: Offset(2, 3),
                spreadRadius: 0.5)
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Builder(builder: (context) {
        return Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                    text: (AppStrings.dearCustomer).tr(),
                    style: TextStyle(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor),
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
                TextSpan(
                    text: (AppStrings.medicinePageDescription).tr(),
                    style: TextStyle(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor),
                        fontSize: 15)),
              ],
            ));
      }),
    );
  }
}
