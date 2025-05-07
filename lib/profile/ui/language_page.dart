import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/profile/provider/language_page_controller.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constant/app_strings.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  late double height;
  late double width;
  late ThemeController themeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LanguagePageController>(context, listen: false)
          .defaultLanguageIndex(context: context);
    });
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
        children: [
          _buildHeaderContainer(),
          Container(
            height: height * 0.300,
            width: double.infinity,
            // color: Colors.red,
            child: Consumer<LanguagePageController>(
              builder: (context, value, child) {
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: AppLists().languageOptionsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.050,
                      ),
                      child: Container(
                        height: height * 0.060,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            // color: Colors.red,
                            border: Border(
                                bottom: BorderSide(
                                    color: HexColor(themeController.isLight
                                        ? AppColorsLight.darkGreyColor
                                        : AppColorsDark.whiteColor)))),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: width * 0.040),
                              alignment: Alignment.bottomLeft,
                              height: height * 0.035,
                              width: width * 0.400,
                              // color: Colors.red,
                              child: Text(
                                AppLists().languageOptionsList[index],
                                style: TextStyle(
                                    fontSize: 17,
                                    color: HexColor(themeController.isLight
                                        ? AppColorsLight.darkBlueColor
                                        : AppColorsDark.whiteColor)),
                              ),
                            ),
                            SizedBox(width: width * 0.290),
                            CupertinoSwitch(
                              focusColor: Colors.black,
                              thumbColor: Colors.black,
                              activeTrackColor:
                                  HexColor(AppColorsLight.orangeColor),
                              value: value.languageList[index],
                              onChanged: (v) async {
                                // await context.setLocale(Locale('hi'));
                                // setState(() {}); // Trigger UI rebuild
                                value.updateLanguageIndex(
                                    index: index, context: context);
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
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
          Builder(
            builder: (context) {
              return SizedBox(
                height: height * 0.050,
                width: width * 0.700,
                child: Center(
                  child: Text(
                    (AppStrings.language)
                        .tr(), // This will auto-update on language change
                    style: TextStyle(
                      color: HexColor(themeController.isLight
                          ? AppColorsLight.darkBlueColor
                          : AppColorsDark.whiteColor),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              );
            },
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
}
