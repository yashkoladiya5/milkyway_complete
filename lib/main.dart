import 'package:easy_localization/easy_localization.dart';
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
import 'package:milkyway/profile/provider/faq_page_controller.dart';
import 'package:milkyway/profile/provider/favourite_page_controller.dart';
import 'package:milkyway/profile/provider/language_page_controller.dart';
import 'package:milkyway/profile/provider/location_page_controller.dart';
import 'package:milkyway/profile/provider/order_history_page_controller.dart';
import 'package:milkyway/profile/provider/profile_edit_screen_controller.dart';
import 'package:milkyway/profile/provider/profile_screen_controller.dart';
import 'package:milkyway/provider/language_controller.dart';
import 'package:milkyway/provider/loading_controller.dart';
import 'package:milkyway/provider/network_controller.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/splash_screen.dart';
import 'package:milkyway/wallet/provider/wallet_screen_controller.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'bill_pay/recharge/provider/recharge_list_controller.dart';
import 'bill_pay/recharge/provider/recharge_plan_controller.dart';
import 'cart/provider/home_bag_screen_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Stripe.publishableKey = publishable_key;
  await Stripe.instance.applySettings();

  await Supabase.initialize(
    url: 'https://ozwbziudevgrgqcbmbbq.supabase.co', // Your Supabase URL
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im96d2J6aXVkZXZncmdxY2JtYmJxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU1NTcyMjksImV4cCI6MjA2MTEzMzIyOX0.DiJJrYAeHljAotcIgUCBWdtLsHaebWhdUjKJfDpvFo0', // Your Supabase Anon Key
  );

  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en'), // English
        Locale('hi'), // Hindi
        Locale('gu'), // Gujarati
        Locale('mr'), // Marathi
      ],
      path: 'assets/lang',
      fallbackLocale: const Locale('gu'),
      child: const MyApp(),
    ),
  );
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
        ),
        ChangeNotifierProvider(
          create: (context) => OrderHistoryPageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DailyProductListController(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavouritePageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LanguagePageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FaqPageController(),
        )
      ],
      child: MaterialApp(
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "poppins"),
        home: const SplashScreen(),
      ),
    );
  }
}
