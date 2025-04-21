import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/auth/provider/log_in_page_controller.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_strings.dart';

class BottomSheetLogInPage {
  customBottomSheet(
      String number,
      String password,
      BuildContext context,
      TextEditingController _contactController,
      TextEditingController _passwordController,
      LogInPageController logInPageController,
      double height,
      double width) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return InkWell(
          onTap: () {
            _contactController.text = number;
            _passwordController.text = password;
            logInPageController.setPasswordIcon();
            Navigator.pop(context);
          },
          child: Container(
            height: height * 0.250,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.010,
                ),
                Container(
                  height: height * 0.01,
                  width: width * 0.250,
                  decoration: BoxDecoration(
                      color: HexColor(AppColorsLight.orangeColor),
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  height: height * 0.050,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: height * 0.120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: HexColor(AppColorsLight.orangeColor),
                            width: 0.5),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width * 0.020,
                        ),
                        Container(
                          height: height * 0.080,
                          width: width * 0.160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: HexColor("#D3D3D3")),
                          child: Center(
                            child: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 35,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.050,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  AppStrings.contactNo,
                                  style: TextStyle(
                                    color:
                                        HexColor(AppColorsLight.darkBlueColor),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.020,
                                ),
                                Text(
                                  number,
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  AppStrings.password,
                                  style: TextStyle(
                                    color:
                                        HexColor(AppColorsLight.darkBlueColor),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.070,
                                ),
                                Text(
                                  "******",
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
