import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/cart/ui/home_bag_page.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/home/ui/home_screen.dart';
import 'package:milkyway/medicine/ui/medicine_page.dart';
import 'package:milkyway/profile/ui/profile_screen.dart';

import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';
import 'package:provider/provider.dart';

import '../../wallet/ui/wallet_page.dart';

class PageViewScreen extends StatefulWidget {
  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  late ThemeController themeController;
  final ValueNotifier<bool> refreshNotifier = ValueNotifier<bool>(false);

  Future<void> _onItemTapped(int index) async {
    if (index == 1) {
      // Push to HomeBagPage and wait
      final refresh = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeBagPage()),
      );

      // Wait for one frame before updating UI
      if (refresh == "HomeScreen") {
        Future.delayed(Duration.zero, () {
          setState(() {
            _selectedIndex = 0;
          });
          _pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
      }
    } else {
      setState(() {
        _selectedIndex = 0;
      });
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    if (index == 2) {
      String refresh;
      refresh = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MedicinePage()),
      );

      if (refresh == "MedicineScreen") {
        refreshNotifier.value = true;
      }
    } else {
      setState(() {
        _selectedIndex = index;
      });
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    // if (index == 3) {
    //   final refresh = await Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const WalletPage()),
    //   );
    // }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    themeController = Provider.of<ThemeController>(context);
    return NetworkChecker(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: [
            HomeScreen(
              refreshNotifier: refreshNotifier,
            ),
            const HomeBagPage(),
            MedicinePage(),
            WalletPage(
              isBottomBar: true,
            ),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(
          selectedIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;
  late ThemeController themeController;
  CustomNavigationBar({required this.selectedIndex, required this.onTap});

  final List<IconData> _icons = [
    Icons.home,
    Icons.shopping_cart_outlined,
    Icons.add,
    Icons.account_balance_wallet_outlined,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    themeController = Provider.of<ThemeController>(context);
    return Container(
      color: themeController.isLight
          ? Colors.white
          : HexColor(AppColorsDark.darkGreyColor),
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_icons.length, (index) {
          final bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Special floating-style design for the center icon
                if (index == 2)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: HexColor(AppColorsLight.orangeColor),
                            blurRadius: 5,
                            spreadRadius: 0.5)
                      ],
                      color: HexColor(AppColorsLight.orangeColor),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _icons[index],
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                else
                  Icon(
                    _icons[index],
                    color: isSelected ? Colors.orange : Colors.grey,
                    size: 24,
                  ),
                const SizedBox(height: 4),
                // Dot indicator for selected icons
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.orange : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
