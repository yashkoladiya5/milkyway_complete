import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant/app_strings.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  late double height;
  late double width;
  late ThemeController themeController;
  TextEditingController dummyController = TextEditingController();
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
          final directory = await getTemporaryDirectory();

          setState(() {
            selectedImage = File(photo.path);
          });

          print("Image Path: ${photo.path}");
          Future.microtask(() {
            Navigator.pop(context); // pop once
          });

          // Navigator.push(context, MaterialPageRoute(
          //   builder: (context) {
          //     return MedicineAddPage(imagePath: selectedImage!.path);
          //   },
          // ));
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

  void showImageSelectBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: height * 0.250,
          width: double.infinity,
          color: HexColor(themeController.isLight
              ? AppColorsLight.backgroundColor
              : AppColorsDark.backgroundColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () async {
                  await getImage();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.050),
                  alignment: Alignment.center,
                  height: height * 0.070,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1, blurRadius: 10, color: Colors.grey)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.lightGreyColor
                        : AppColorsDark.greyColor),
                  ),
                  child: Text(
                    "Select From Camera",
                    style: TextStyle(
                        fontSize: 18,
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.020),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.050),
                  alignment: Alignment.center,
                  height: height * 0.070,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1, blurRadius: 10, color: Colors.grey)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.lightGreyColor
                        : AppColorsDark.greyColor),
                  ),
                  child: Text(
                    "Select From Gallery",
                    style: TextStyle(
                        fontSize: 18,
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
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
      body: Column(children: widgetList()),
    );
  }

  Widget _buildHeaderContainer() {
    return Container(
      padding: EdgeInsets.only(top: height * 0.050),
      height: height * 0.150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: HexColor(themeController.isLight
            ? AppColorsLight.backgroundColor
            : AppColorsLight.darkBlueColor),
        boxShadow: [
          if (themeController.isLight)
            const BoxShadow(
                offset: Offset(0, 5),
                color: Color.fromRGBO(128, 128, 128, 0.25),
                spreadRadius: 0.5,
                blurRadius: 10)
          else
            const BoxShadow(
                color: Colors.black, spreadRadius: 1, blurRadius: 10)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Navigator.maybePop(context, "walletPage");
              },
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: HexColor(themeController.isLight
                    ? AppColorsLight.darkBlueColor
                    : AppColorsDark.whiteColor),
              )),
          SizedBox(
            height: height * 0.050,
            width: width * 0.700,
            // color: Colors.red,
            child: Center(
                child: Text(
              AppStrings.editProfile,
              style: TextStyle(
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.darkBlueColor
                      : AppColorsDark.whiteColor),
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            )),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30,
                color: HexColor(themeController.isLight
                    ? AppColorsLight.darkBlueColor
                    : AppColorsDark.whiteColor),
              ))
        ],
      ),
    );
  }

  Widget _buildProfileContainerView() {
    return Stack(
      children: [
        InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            showImageSelectBottomSheet();
          },
          child: Container(
            margin: EdgeInsets.only(top: height * 0.050),
            height: height * 0.110,
            width: width * 0.240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.file(File(selectedImage!.path))),
          ),
        ),
        Positioned(
          top: height * 0.120,
          left: width * 0.165,
          child: Container(
            height: height * 0.035,
            width: width * 0.075,
            decoration: BoxDecoration(
                color: HexColor(AppColorsLight.orangeColor),
                borderRadius: BorderRadius.circular(40)),
            child: Icon(
              Icons.edit,
              size: 17,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTextField(
      {required String hintText, required TextEditingController controller}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.10, vertical: height * 0.008),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: width * 0.030, top: height * 0.010),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 13)),
        style: TextStyle(
            color: HexColor(themeController.isLight
                ? AppColorsLight.darkBlueColor
                : AppColorsDark.whiteColor)),
      ),
    );
  }

  Widget _buildSaveButton() {
    return Container(
      height: height * 0.055,
      width: width * 0.320,
      decoration: BoxDecoration(
          color: HexColor(AppColorsLight.orangeColor),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Text(
          AppStrings.save,
          style: TextStyle(
              fontSize: 18,
              color: HexColor(AppColorsDark.whiteColor),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  List<Widget> widgetList() {
    return [
      _buildHeaderContainer(),
      _buildProfileContainerView(),
      SizedBox(
        height: height * 0.020,
      ),
      _buildTextField(hintText: "Name", controller: dummyController),
      _buildTextField(hintText: "Last Name", controller: dummyController),
      _buildTextField(hintText: "E-mail ID", controller: dummyController),
      _buildTextField(hintText: "Mobile Number", controller: dummyController),
      SizedBox(
        height: height * 0.220,
      ),
      _buildSaveButton()
    ];
  }
}
