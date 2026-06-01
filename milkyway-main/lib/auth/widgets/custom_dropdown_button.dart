import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/auth/provider/sign_up_page_controller.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/provider/theme_controller.dart';

import 'package:provider/provider.dart';

class CustomDropdownButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const CustomDropdownButton({super.key, required this.formKey});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  List<String> states = AppLists.states;
  late double height;
  late double width;
  var signUpController = SignUpPageController();
  var themeController = ThemeController();
  @override
  Widget build(BuildContext context) {
    signUpController = Provider.of<SignUpPageController>(context);
    themeController = Provider.of<ThemeController>(context);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return DropdownButton(
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: themeController.isLight
            ? Colors.black
            : HexColor(AppColorsDark.whiteColor),
        size: 40,
      ),
      padding: EdgeInsets.only(left: width * 0.030),
      value: signUpController.stateValue,
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
        signUpController.setStateTextFieldData(newVal!);
        signUpController.setNewState(newVal);
        widget.formKey.currentState!.validate();
      },
    );
  }
}
