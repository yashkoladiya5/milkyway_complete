import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/home/provider/search_controller.dart';
import 'package:milkyway/home/ui/home_category_screen.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late double height;
  late double width;
  List<String> tags = [];
  TextEditingController searchController = TextEditingController();
  late SearchResultController searchResultController;
  late ThemeController themeController;

  sendDataToFirebase() async {
    final firestore = FirebaseFirestore.instance.collection("product");

    for (int i = 0; i < AppLists().dairyProductList.length; i++) {
      await firestore.add(AppLists().dairyProductList[i].toJson());
    }

    print("LIST LENGTH === ${AppLists().dairyProductList.length}");
    await firestore.get().then(
      (value) {
        print(value.docs.map(
          (e) => e.data(),
        ));
      },
    );
    print("Data Added to firebase");
  }

  @override
  void initState() {
    super.initState();
    reduceListItems();
  }

  reduceListItems() async {
    for (int i = 0; i < 9; i++) {
      tags.add(AppLists().groceries[i]);
    }

    // await sendDataToFirebase();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    searchResultController = Provider.of<SearchResultController>(context);
    themeController = Provider.of<ThemeController>(context);
    print("Search screen widget build....");
    return NetworkChecker(
      child: Scaffold(
        body: Container(
          color: HexColor(themeController.isLight
              ? AppColorsLight.backgroundColor
              : AppColorsLight.darkBlueColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderContainer(),
              if (searchController.text.isEmpty) _buildPopularSearchHeading(),
              if (searchController.text.isEmpty)
                _buildDefaultView()
              else
                _buildLSearchListView()
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
            BoxShadow(color: Colors.black, spreadRadius: 1, blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).maybePop("searchScreen");
            },
            icon: Icon(
              Icons.arrow_back,
              color: HexColor(themeController.isLight
                  ? AppColorsLight.darkBlueColor
                  : AppColorsDark.whiteColor),
              size: 30,
            ),
          ),
          Expanded(
            child: Container(
              height: height * 0.060,
              decoration: BoxDecoration(
                color: HexColor(themeController.isLight
                    ? AppColorsLight.lightGreyColor
                    : AppColorsDark.darkGreyColor),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Builder(builder: (context) {
                        return TextField(
                          controller: searchController,
                          onChanged: (text) {
                            // Update search results in the controller
                            searchResultController.updateSearchResults(text);
                          },
                          style: TextStyle(
                              fontFamily: "poppins",
                              fontSize: 18,
                              color: themeController.isLight
                                  ? HexColor(AppColorsLight.darkBlueColor)
                                  : HexColor(AppColorsDark.whiteColor)),
                          decoration: InputDecoration(
                            hintText: (AppStrings.search).tr(),
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: HexColor(themeController.isLight
                                  ? AppColorsLight.darkBlueColor
                                  : AppColorsDark.whiteColor),
                            ),
                            border: InputBorder.none,
                          ),
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      Icons.search,
                      size: 30,
                      color: themeController.isLight
                          ? Colors.black
                          : HexColor(AppColorsDark.whiteColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: width * 0.050),
        ],
      ),
    );
  }

  Widget _buildPopularSearchHeading() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: Builder(builder: (context) {
        return Text(
          (AppStrings.popularSearch).tr(),
          style: TextStyle(
            fontSize: 17,
            color: HexColor(themeController.isLight
                ? AppColorsLight.darkBlueColor
                : AppColorsDark.whiteColor),
            fontWeight: FontWeight.bold,
          ),
        );
      }),
    );
  }

  Widget _buildHighlightedText(String text, String query) {
    final textLower = text.toLowerCase();
    final queryLower = query.toLowerCase();
    final startIndex = textLower.indexOf(queryLower);
    if (startIndex == -1) {
      return Text(
        text,
        style: TextStyle(
          color: HexColor(themeController.isLight
              ? AppColorsLight.darkBlueColor
              : AppColorsDark.whiteColor),
          fontSize: 16,
        ),
      );
    }
    final endIndex = startIndex + query.length;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: height * 0.030,
        width: double.infinity,
        child: RichText(
          text: TextSpan(
            text: text.substring(0, startIndex),
            style: TextStyle(
              fontFamily: "poppins",
              color: HexColor(AppColorsLight.greyColor),
              fontSize: 16,
            ),
            children: [
              TextSpan(
                text: text.substring(startIndex, endIndex),
                style: TextStyle(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.greyColor),
                    fontSize: 16,
                    fontWeight: themeController.isLight
                        ? FontWeight.normal
                        : FontWeight.bold),
              ),
              TextSpan(
                text: text.substring(endIndex),
                style: TextStyle(
                  color: HexColor(AppColorsLight.greyColor),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDefaultView() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: tags.map((tag) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return HomeCategoryScreen(
                    pageTitle: tag,
                  );
                },
              ));
              print("$tag Clicked...");
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: HexColor(AppColorsLight.orangeColor),
                ),
              ),
              child: Text(
                tag,
                style: TextStyle(
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.darkBlueColor
                      : AppColorsDark.whiteColor),
                  fontSize: 16,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildLSearchListView() {
    return Consumer<SearchResultController>(
      builder: (context, controller, child) {
        return Expanded(
          child: ListView.builder(
            itemCount: controller.searchResultList.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.backgroundColor
                        : AppColorsLight.darkBlueColor),
                    border: Border.all(
                        width: 0.5, color: HexColor(AppColorsLight.greyColor))),
                child: ListTile(
                  title: _buildHighlightedText(
                    controller.searchResultList[index],
                    searchController.text,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.north_west,
                      size: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return HomeCategoryScreen(
                            pageTitle: controller.searchResultList[index]);
                      },
                    ));
                    print("Selected: ${controller.searchResultList[index]}");
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
