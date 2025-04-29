import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/auth/provider/sign_up_page_controller.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/profile/provider/location_page_controller.dart';
import 'package:milkyway/provider/theme_controller.dart';

import 'package:provider/provider.dart';

class CustomLocationDropDown extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const CustomLocationDropDown({super.key, required this.formKey});

  @override
  State<CustomLocationDropDown> createState() => _CustomLocationDropDownState();
}

class _CustomLocationDropDownState extends State<CustomLocationDropDown> {
  List<String> states = AppLists.states;
  late double height;
  late double width;
  var themeController = ThemeController();
  String? selectedState;
  @override
  Widget build(BuildContext context) {
    themeController = Provider.of<ThemeController>(context);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Consumer<LocationPageController>(
      builder: (context, value, child) {
        return DropdownButton(
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: themeController.isLight
                ? Colors.black
                : HexColor(AppColorsDark.whiteColor),
            size: 40,
          ),
          padding: EdgeInsets.only(left: width * 0.030),
          value: value.selectedArea,
          style: TextStyle(
              fontFamily: "poppins",
              color: themeController.isLight
                  ? Colors.black
                  : HexColor(AppColorsDark.whiteColor)),
          isExpanded: true,
          underline: const SizedBox(),
          hint: Builder(builder: (context) {
            return Text(
              (AppStrings.signUpState).tr(),
              style: TextStyle(
                  fontFamily: "poppins",
                  color: themeController.isLight
                      ? Colors.black
                      : HexColor(AppColorsDark.whiteColor)),
            );
          }),
          items: states.map(
            (e) {
              return DropdownMenuItem(value: e, child: Text(e));
            },
          ).toList(),
          dropdownColor: themeController.isLight
              ? HexColor(AppColorsLight.backgroundColor)
              : Colors.black,
          onChanged: (newVal) {
            value.changeArea(newValue: newVal!);
            // signUpController.setStateTextFieldData(newVal!);
            // signUpController.setNewState(newVal);
            widget.formKey.currentState!.validate();
          },
        );
      },
    );
  }
}
