import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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

import '../../auth/model/location_model.dart';
import '../../profile/provider/location_page_controller.dart';
import '../../profile/widgets/custom_location_drop_down_button.dart';

class LocationPage extends StatefulWidget {
  final String? bagTotal;
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
  final _formKey = GlobalKey<FormState>();

  void editLocation(LocationModel data, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Consumer<LocationPageController>(
          builder: (context, value, child) {
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.020, vertical: height * 0.020),
              height: height * 0.630,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.backgroundColor
                      : AppColorsDark.backgroundColor)),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabelForTextField(heading: "Name"),
                    _buildTextField(controller: value.nameController),
                    _buildLabelForTextField(heading: "Address"),
                    _buildTextField(controller: value.addressController),
                    _buildLabelForTextField(heading: "Area"),
                    _buildTextField(
                        suffixIcon: CustomLocationDropDown(formKey: _formKey)),
                    _buildLabelForTextField(heading: "Pincode"),
                    _buildTextField(controller: value.pincodeController),
                    _buildEditOrAddButton(
                      text: "Edit",
                      onTap: () {
                        value.editData(index: index);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LocationPageController>(context, listen: false)
        .fetchLocationDetails();
  }

  @override
  Widget build(BuildContext context) {
    themeController = Provider.of<ThemeController>(context);

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return NetworkChecker(
      child: Scaffold(
        backgroundColor: HexColor(themeController.isLight
            ? AppColorsLight.backgroundColor
            : AppColorsDark.backgroundColor),
        body: Column(
          children: [
            _buildHeaderContainer(),
            _buildLocationContainer(),
            _buildContinueButton()
          ],
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
            const BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 5)
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
      child: Consumer<LocationPageController>(
        builder: (context, value, child) {
          if (value.userData.isEmpty) {
            return Center(
              child: CircularProgressIndicator(
                color: HexColor(AppColorsLight.orangeColor),
              ),
            );
          } else {
            return Container(
              height: value.userData.length * height * 0.250,
              // color: Colors.red,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: value.userData.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onLongPress: () {
                      value.editLocationDetailsFetch(value.userData[index]);
                      editLocation(value.userData[index], index);
                    },
                    onTap: () {
                      value.changeSelectedIndex(index: index);
                      print("Index tapped ${index}");
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          top: index != 0 ? height * 0.020 : height * 0.00),
                      padding: const EdgeInsets.all(10),
                      height: height * 0.200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: HexColor(themeController.isLight
                                  ? "405E5E5E"
                                  : AppColorsDark.backgroundColor),
                              blurRadius: 10,
                              spreadRadius: 1)
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
                                // color: Colors.grey.withOpacity(0.5),
                                child: Text(
                                  value.userData[index].name,
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
                              SizedBox(
                                  child: value.selectedIndex != index
                                      ? Image.asset(
                                          "assets/images/Home/home_light_theme/5402373_write_modify_tool_edit_pen_icon 2.png")
                                      : Icon(
                                          Icons.add_circle,
                                          color: HexColor(
                                              AppColorsLight.orangeColor),
                                        ))
                            ],
                          ),
                          SizedBox(
                            height: height * 0.060,
                            width: width * 0.700,
                            // color: Colors.grey.withOpacity(0.5),
                            child: Text(
                              value.userData[index].address +
                                  " ,\n " +
                                  value.userData[index].area +
                                  "-" +
                                  (value.userData[index].pincode.toString()),
                              style: TextStyle(
                                fontSize: 18,
                                color: HexColor(themeController.isLight
                                    ? AppColorsLight.silverColor
                                    : AppColorsDark.whiteColor),
                              ),
                            ),
                          ),
                          Container(
                            height: height * 0.030,
                            width: width * 0.70,
                            // color: Colors.grey.withOpacity(0.5),
                            child: Text(
                              value.userData[index].mobileNumber,
                              style: TextStyle(
                                fontSize: 18,
                                color: HexColor(themeController.isLight
                                    ? AppColorsLight.silverColor
                                    : AppColorsDark.whiteColor),
                              ),
                            ),
                          ),
                          Container(
                            height: height * 0.030,
                            width: width * 0.70,
                            // color: Colors.grey.withOpacity(0.5),
                            child: Text(
                              value.userData[index].email,
                              style: TextStyle(
                                  color: HexColor(themeController.isLight
                                      ? AppColorsLight.silverColor
                                      : AppColorsDark.whiteColor),
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildContinueButton() {
    return Consumer<LocationPageController>(
      builder: (context, value, child) {
        return InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            if (value.userData.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(milliseconds: 200),
                  content: Text("Wait for the address...!!")));
            } else {
              Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) {
                  return PaymentScreen(
                    dailyProductList: widget.dailyProducts,
                    bagTotal: widget.bagTotal,
                    userData: value.userData[value.selectedIndex],
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
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                );
              }),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLabelForTextField({required String heading}) {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.040, top: height * 0.010),
      child: Text(
        heading,
        style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: HexColor(themeController.isLight
                ? AppColorsLight.darkBlueColor
                : AppColorsDark.whiteColor)),
      ),
    );
  }

  Widget _buildTextField(
      {Widget? suffixIcon, TextEditingController? controller}) {
    return Padding(
      padding: EdgeInsets.only(
        top: height * 0.010,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkGreyColor
                        : AppColorsDark.whiteColor),
                    width: 2))),
      ),
    );
  }

  Widget _buildEditOrAddButton({required String text, void Function()? onTap}) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(top: height * 0.010),
          height: height * 0.050,
          width: width * 0.500,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: HexColor(AppColorsLight.orangeColor)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: HexColor(AppColorsDark.whiteColor)),
            ),
          ),
        ),
      ),
    );
  }
}
