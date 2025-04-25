import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/auth/widgets/custom_dropdown_button.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/profile/provider/location_page_controller.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:provider/provider.dart';

import '../../auth/model/location_model.dart';
import '../../constant/app_strings.dart';
import '../widgets/custom_location_drop_down_button.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late double height;
  late double width;
  late ThemeController themeController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LocationPageController>(context, listen: false)
        .fetchLocationDetails();
  }

  void editLocation(LocationModel data, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Consumer<LocationPageController>(
          builder: (context, value, child) {
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.020, vertical: height * 0.020),
              height: height * 0.550,
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

  void addLocation() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Consumer<LocationPageController>(
          builder: (context, value, child) {
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.020, vertical: height * 0.020),
              height: height * 0.550,
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
                      text: "Add",
                      onTap: () {
                        value.addLocation();
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

  void showLocationOptionBottomSheet(
      {required LocationPageController value, required int locationIndex}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          alignment: Alignment.center,
          height: height * 0.150,
          width: double.infinity,
          color: HexColor(themeController.isLight
              ? AppColorsLight.backgroundColor
              : AppColorsDark.backgroundColor),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 2,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (index == 0) {
                    value.editLocationDetailsFetch(
                        value.userData[locationIndex]);
                    editLocation(value.userData[locationIndex], locationIndex);
                  } else {
                    addLocation();
                  }
                },
                child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * 0.050, vertical: height * 0.010),
                    height: height * 0.050,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.backgroundColor
                            : AppColorsDark.backgroundColor),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 10,
                              color: HexColor(themeController.isLight
                                  ? AppColorsLight.greyColor
                                  : AppColorsDark.darkGreyColor))
                        ]),
                    child: Center(
                        child: Text(
                            index == 0 ? "Edit Location" : "Add New Location",
                            style: TextStyle(
                                color: HexColor(themeController.isLight
                                    ? AppColorsLight.darkBlueColor
                                    : AppColorsDark.whiteColor),
                                fontSize: 17,
                                fontWeight: FontWeight.bold)))),
              );
            },
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
      body: Column(
        children: [_buildHeaderContainer(), _buildLocationContainer()],
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
            const BoxShadow(
                offset: Offset(0, 10),
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
              AppStrings.location,
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

  Widget _buildLocationContainer() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Consumer<LocationPageController>(
        builder: (context, value, child) {
          if (value.userData.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
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
                    onLongPress: () {
                      showLocationOptionBottomSheet(
                          value: value, locationIndex: index);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: height * 0.020),
                      padding: const EdgeInsets.all(10),
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
                                // color: Colors.grey.withOpacity(0.5),
                                child: Text(
                                  value.userData[index].name ?? "",
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
                                  // locationController.text = userData?.address ?? "";
                                  // setState(() {});
                                  // showCustomDialog(
                                  //     context, height, width, userData?.address ?? "");
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
                                    ? AppColorsLight.darkBlueColor
                                    : AppColorsDark.whiteColor),
                              ),
                            ),
                          ),
                          Container(
                            height: height * 0.030,
                            width: width * 0.70,
                            // color: Colors.grey.withOpacity(0.5),
                            child: Text(
                              value.userData[index].mobileNumber ?? "",
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
                            // color: Colors.grey.withOpacity(0.5),
                            child: Text(
                              value.userData[index].email ?? "",
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
                },
              ),
            );
          }
        },
      ),
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
          margin: EdgeInsets.only(top: height * 0.020),
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
