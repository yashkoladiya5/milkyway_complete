import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:milkyway/auth/provider/log_in_page_controller.dart';
import 'package:milkyway/auth/provider/new_password_page_controller.dart';
import 'package:milkyway/auth/provider/sign_up_page_controller.dart';
import 'package:milkyway/bill_pay/electricity/provider/electricity_controller.dart';
import 'package:milkyway/bill_pay/gas/provider/gas_bill_screen_controller.dart';

import 'package:milkyway/cart/provider/pay_now_page_controller.dart';
import 'package:milkyway/cart/provider/payment_page_controller.dart';
import 'package:milkyway/constant/payment_constant_keys.dart';

import 'package:milkyway/home/provider/home_page_controller.dart';
import 'package:milkyway/home/provider/product_page_controller.dart';

import 'package:milkyway/home/provider/search_controller.dart';
import 'package:milkyway/profile/provider/change_password_controller.dart';
import 'package:milkyway/profile/provider/location_page_controller.dart';
import 'package:milkyway/profile/provider/profile_edit_screen_controller.dart';
import 'package:milkyway/profile/provider/profile_screen_controller.dart';
import 'package:milkyway/provider/loading_controller.dart';
import 'package:milkyway/provider/network_controller.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/splash_screen.dart';
import 'package:milkyway/wallet/provider/wallet_screen_controller.dart';
import 'package:provider/provider.dart';

import 'bill_pay/recharge/provider/recharge_list_controller.dart';
import 'bill_pay/recharge/provider/recharge_plan_controller.dart';
import 'cart/provider/home_bag_screen_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Stripe.publishableKey = publishable_key;
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LogInPageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpPageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewPasswordPageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchResultController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoadingController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PaymentPageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PayNowPageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeBagScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductPageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuantityController(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavouriteController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartItemListController(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuantityListController(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavouriteListController(),
        ),
        ChangeNotifierProvider(
          create: (context) => RelatedProductListController(),
        ),
        ChangeNotifierProvider(
          create: (context) => NetworkController(),
        ),
        ChangeNotifierProvider(
          create: (context) => RechargeListController(),
        ),
        ChangeNotifierProvider(
          create: (context) => RechargePlanController(),
        ),
        ChangeNotifierProvider(
          create: (context) => GasBillScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ElectricityController(),
        ),
        ChangeNotifierProvider(
          create: (context) => WalletScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileEditScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangePasswordController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocationPageController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "poppins"),
        home: const SplashScreen(),
      ),
    );
  }
}
