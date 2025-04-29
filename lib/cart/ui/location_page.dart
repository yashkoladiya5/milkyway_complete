import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/auth/model/sign_up_model.dart';
import 'package:milkyway/cart/ui/payment_screen.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/provider/loading_controller.dart';

import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class LocationPage extends StatefulWidget {
  String? bagTotal;
  List<int> dailyProducts = [];
  LocationPage({super.key, this.bagTotal, required this.dailyProducts});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late double height;
  late double width;
  late ThemeController themeController;
  late LoadingController loadingController;
  SignUpModel? userData;
  TextEditingController locationController = TextEditingController();

  showCustomDialog(
      BuildContext context, double height, double width, String text) {
    return showDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Dialog(
            child: Container(
              height: height * 0.400,
              width: double.infinity,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.backgroundColor
                            : AppColorsDark.backgroundColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Builder(builder: (context) {
                          return Text(
                            "Edit ${(AppStrings.location).tr()}",
                            style: TextStyle(
                                color: HexColor(themeController.isLight
                                    ? AppColorsLight.darkBlueColor
                                    : AppColorsDark.whiteColor),
                                fontWeight: FontWeight.bold,
                                fontFamily: "poppins",
                                fontSize: 25),
                          );
                        }),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: locationController,
                            maxLines: 3,
                            style: TextStyle(
                              color: HexColor(themeController.isLight
                                  ? AppColorsLight.darkBlueColor
                                  : AppColorsDark.whiteColor),
                            ),
                            decoration: InputDecoration(
                                hintText: text,
                                hintStyle: TextStyle(
                                    color: HexColor(themeController.isLight
                                        ? AppColorsLight.darkBlueColor
                                        : AppColorsDark.whiteColor),
                                    fontFamily: "poppins"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: HexColor(themeController.isLight
                                            ? AppColorsLight.darkBlueColor
                                            : AppColorsDark.whiteColor),
                                        width: 3))),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await editLocation();
                            print("DONE");
                          },
                          child: Container(
                            height: height * 0.060,
                            width: width * 0.300,
                            decoration: BoxDecoration(
                              color: HexColor(AppColorsLight.orangeColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  fetchUserData() async {
    loadingController.changeLoad();
    final firestore = FirebaseFirestore.instance.collection("user");

    await firestore.get().then(
      (value) async {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        String? id =
            sharedPreferences.getString(SharedPreferenceKeys.userIdKey);

        print(id);
        for (int i = 0; i < value.docs.length; i++) {
          if (id == value.docs[i].id) {
            print(id);
            var data = value.docs[i].data();

            userData = SignUpModel.fromJson(data);

            print(data);

            print(userData);
            loadingController.changeLoad();
            // setState(() {});
            //

            break;
          }
        }
      },
    );
  }

  editLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    DocumentReference ref = FirebaseFirestore.instance
        .collection("user")
        .doc(prefs.getString(SharedPreferenceKeys.userIdKey));

    await ref.update({"address": locationController.text}).then(
      (value) async {
        print("UPATED");
        await fetchUserData();

        Navigator.of(context).pop();
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await fetchUserData();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    themeController = Provider.of<ThemeController>(context);
    loadingController = Provider.of<LoadingController>(context);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return NetworkChecker(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: HexColor(themeController.isLight
              ? AppColorsLight.backgroundColor
              : AppColorsDark.backgroundColor),
          child: Column(
            children: [
              _buildHeaderContainer(),
              loadingController.isLoading
                  ? ShimmerList()
                  : _buildLocationContainer(),
              SizedBox(
                height: height * 0.400,
              ),
              _buildContinueButton()
            ],
          ),
        ),
      ),
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
            BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 10)
          else
            BoxShadow(color: Colors.black, spreadRadius: 1, blurRadius: 10)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).maybePop();
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
            child: Center(child: Builder(builder: (context) {
              return Text(
                (AppStrings.location).tr(),
                style: TextStyle(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              );
            })),
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

  Widget _buildLocationContainer() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(10),
        height: height * 0.200,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: HexColor(themeController.isLight
                        ? AppColorsLight.greyColor
                        : AppColorsDark.backgroundColor)
                    .withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 0.2)
          ],
          borderRadius: BorderRadius.circular(10),
          color: HexColor(themeController.isLight
              ? AppColorsLight.lightGreyColor
              : AppColorsDark.darkGreyColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: height * 0.030,
                  width: width * 0.700,
                  color: userData == null
                      ? Colors.grey.withOpacity(0.5)
                      : Colors.transparent,
                  child: Text(
                    userData?.name ?? "",
                    style: TextStyle(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor),
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
                SizedBox(
                  width: width * 0.120,
                ),
                InkWell(
                  onTap: () {
                    locationController.text = userData?.address ?? "";
                    setState(() {});
                    showCustomDialog(
                        context, height, width, userData?.address ?? "");
                  },
                  child: Icon(
                    Icons.edit_note_rounded,
                    size: 30,
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor),
                  ),
                )
              ],
            ),
            Container(
              height: height * 0.060,
              width: width * 0.700,
              color: userData == null
                  ? Colors.grey.withOpacity(0.5)
                  : Colors.transparent,
              child: Text(
                "${userData?.address} , \n${userData?.area}-${userData?.pincode}" ??
                    "",
                style: TextStyle(
                  fontSize: 18,
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.darkBlueColor
                      : AppColorsDark.whiteColor),
                ),
              ),
            ),
            Container(
              height: height * 0.030,
              width: width * 0.70,
              color: userData == null
                  ? Colors.grey.withOpacity(0.5)
                  : Colors.transparent,
              child: Text(
                userData?.mobileNumber ?? "",
                style: TextStyle(
                  fontSize: 18,
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.darkBlueColor
                      : AppColorsDark.whiteColor),
                ),
              ),
            ),
            Container(
              height: height * 0.030,
              width: width * 0.70,
              color: userData == null
                  ? Colors.grey.withOpacity(0.5)
                  : Colors.transparent,
              child: Text(
                userData?.email ?? "",
                style: TextStyle(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor),
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return InkWell(
      onTap: () {
        if (userData == null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(milliseconds: 200),
              content: Text("Wait for the address...!!")));
        } else {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return PaymentScreen(
                dailyProductList: widget.dailyProducts,
                bagTotal: widget.bagTotal,
                userData: userData!,
              );
            },
          ));
        }
      },
      child: Container(
        height: height * 0.070,
        width: width * 0.320,
        decoration: BoxDecoration(
            color: HexColor(AppColorsLight.orangeColor),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Builder(builder: (context) {
            return Text(
              (AppStrings.continueText).tr(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            );
          }),
        ),
      ),
    );
  }
}

class ShimmerList extends StatelessWidget {
  late ThemeController themeController;
  late double height;
  late double width;

  ShimmerList({super.key});
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

    width = MediaQuery.of(context).size.width;
    themeController = Provider.of<ThemeController>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: height * 0.200,
        width: double.infinity,
        color: HexColor(themeController.isLight
            ? AppColorsLight.lightGreyColor
            : AppColorsDark.darkGreyColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: width * 0.200,
                height: height * 0.020,
                color: themeController.isLight
                    ? Colors.grey
                    : Colors.grey.withOpacity(0.2),
              ),
            ),
            const SizedBox(height: 16),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: height * 0.080,
                width: width * 0.800,
                decoration: BoxDecoration(
                  color: themeController.isLight
                      ? Colors.grey
                      : Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: width * 0.300,
                height: height * 0.020,
                color: themeController.isLight
                    ? Colors.grey
                    : Colors.grey.withOpacity(0.2),
              ),
            ),
            SizedBox(
              height: height * 0.010,
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: width * 0.400,
                height: height * 0.020,
                color: themeController.isLight
                    ? Colors.grey
                    : Colors.grey.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
