import 'dart:convert'; // Required for jsonDecode
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:translator/translator.dart';

import '../constant/app_strings.dart'; // Replace with actual Google Translate package

class LanguageProvider extends ChangeNotifier {
  final GoogleTranslator _translator = GoogleTranslator();
  String _selectedLanguage = 'en'; // Default language is English
  String get selectedLanguage => _selectedLanguage;

  Map<String, String> _translatedStrings = {};
  Map<String, String> get translatedStrings => _translatedStrings;

  // Initialize language translations from cache or translate and cache
  Future<void> initializeTranslations() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedTranslations = prefs.getString('$_selectedLanguage');

    if (cachedTranslations != null) {
      // Load cached translations for the selected language
      _translatedStrings =
          Map<String, String>.from(jsonDecode(cachedTranslations));
    } else {
      // Translate and cache for the selected language
      await _translateAndCacheAllStrings();
    }
    notifyListeners();
  }

  // Translate all strings and cache them
  Future<void> _translateAndCacheAllStrings() async {
    Map<String, dynamic> stringsToTranslate = {
      AppStrings.language: "Language",
      AppStrings.logIn: 'L O G I N',
      AppStrings.contactNo: 'Contact No.',
      AppStrings.password: 'Password',
      AppStrings.rememberMe: 'Remember me',
      AppStrings.forgotPassword: 'Forgot Password?',
      AppStrings.logInButton: 'LOG IN',
      AppStrings.createNewAccount: 'Create New Account ?',
      AppStrings.clickHere: 'Click Here',
      AppStrings.signUpHeading: 'S I G N  U P',
      AppStrings.signUpName: 'Name*',
      AppStrings.signUpState: 'Select Area*',
      AppStrings.signUpAddress: 'Address*',
      AppStrings.signUpPincode: 'Pincode*',
      AppStrings.signUpCurrentLocation: 'Current location',
      AppStrings.signUpMobileNo: 'Mobile Number*',
      AppStrings.signUpEmail: 'E-mail ID*',
      AppStrings.signUpPassword: 'Password',
      AppStrings.signUpConfirmPassword: 'Confirm Password',
      AppStrings.signUpTermsAndConditions: 'Terms & Conditions',
      AppStrings.signUpButton: 'SIGN UP',
      AppStrings.forgotPasswordHeading: "Forgot Password",
      AppStrings.forgotPasswordDescription:
          "Enter Your Register Email id or Mobile number\nwe will send you an OTP .",
      AppStrings.forgotPasswordTextFieldHintText: "E-mail Id or Mobile number",
      AppStrings.sendButton: "SEND",
      AppStrings.enterOTP: "Enter OTP",
      AppStrings.otpDescription:
          "We have sent you access code via\nSMS or Email id for verification. ",
      AppStrings.verifyButton: "VERIFY",
      AppStrings.doNotGetCode: "Don't Get Code?",
      AppStrings.resendButton: "Resend",
      AppStrings.oopsMessage: "Oops!!",
      AppStrings.otpDialogErrorContent:
          "Maximum try for OTP has reached , please try again\n24 Hours also check email for OTP too.",
      AppStrings.createNewPasswordHeading: "Create New Password",
      AppStrings.createNewPasswordTextField: "New Password",
      AppStrings.createConfirmNewPasswordTextField: "Confirm Password",
      AppStrings.updateButton: "UPDATE",
      AppStrings.logInNumberExistSnackBarContent:
          "Please Enter Valid Number Or Password",
      AppStrings.balanceHomePage: "Balance",
      AppStrings.serialNo: "Sr no.",
      AppStrings.productName: "Product Name",
      AppStrings.liter: "Liter",
      AppStrings.kg: "kg",
      AppStrings.gm: "gm",
      AppStrings.categories: "Categories",
      AppStrings.favouriteProducts: "Favourite Products",
      AppStrings.search: "Search",
      AppStrings.popularSearch: "Popular Search",
      AppStrings.rating: "Rating",
      AppStrings.productYouMightLike: "Product You Might Like",
      AppStrings.addToCart: "Add To Cart",
      AppStrings.paymentDetails: "Payment Details",
      AppStrings.bagTotal: "Bag Total",
      AppStrings.discount: "Discount",
      AppStrings.totalAmount: "Total Amount",
      AppStrings.placeOrder: "Place Order",
      AppStrings.location: "Location",
      AppStrings.fullName: "Full Name",
      AppStrings.cardNumber: "Card Number",
      AppStrings.validUntil: "Valid Until",
      AppStrings.cvv: "CVV",
      AppStrings.saveCardData: "Save card data for future payment",
      AppStrings.milkywayWebsite: "www.milkyway.com",
      AppStrings.offers: "Offers",
      AppStrings.uploadBalanceWithUPIId: "Upload Balance With UPI Id",
      AppStrings.setAutoPayment: "Set Auto Payment",
      AppStrings.payNow: "Pay Now",
      AppStrings.autoPayment: "Auto Payment",
      AppStrings.comingSoon: "Coming Soon",
      AppStrings.balanceUnder: "Balance Under",
      AppStrings.payment: "Payment",
      AppStrings.selectModeForPayment: "Select Mode For Payment",
      AppStrings.deliveryAddress: "Delivery Address",
      AppStrings.processToBuy: "Process To Buy",
      AppStrings.dearCustomer: "Dear Customer,",
      AppStrings.medicinePageDescription:
          " Please click image of your Allopathy / Ayurvedic prescription photo and we will send you medicines next day with discount!!",
      AppStrings.medicine: "Medicine",
      AppStrings.upload: "Upload",
      AppStrings.medicineAddPageDescription:
          "Your prescription sent successfully",
      AppStrings.billPay: "Bill Pay",
      AppStrings.rechargeAndBill: "Recharge & Bill",
      AppStrings.mobileRecharge: "Mobile Recharge",
      AppStrings.enterMobileNumber: "Enter Mobile Number",
      AppStrings.operator: "Operator",
      AppStrings.state: "State",
      AppStrings.enterPlanAmount: "Enter Plan Amount",
      AppStrings.continueText: "Continue",
      AppStrings.gasBill: "Gas Bill",
      AppStrings.payGasBill: "Pay Gas Bill",
      AppStrings.bookAGasCylinder: "Book a Gas Cylinder",
      AppStrings.selectGasProvider: "Select Gas Provider",
      AppStrings.enterCustomerMobile: "Enter Customer Mobile No",
      AppStrings.customerName: "Customer Name : ",
      AppStrings.dealerName: "Dealer Name : ",
      AppStrings.billAmount: "Bill Amount : ",
      AppStrings.continueToPay: "Continue to Pay ",
      AppStrings.enterCustomerID: "Enter Customer Id",
      AppStrings.electricityBill: "Electricity Bill",
      AppStrings.dueDate: "Due Date",
      AppStrings.selectElectricityBoardToProceed:
          "Select Electricity Board to Processed",
      AppStrings.consumerNumber: "Consumer Number",
      AppStrings.wallet: "wallet",
      AppStrings.add: "Add",
      AppStrings.income: "Income",
      AppStrings.expense: "Expense",
      AppStrings.transactionDetail: "Transaction Detail",
      AppStrings.invoice: "Invoice",
      AppStrings.profile: "Profile",
      AppStrings.editProfile: "Edit Profile",
      AppStrings.save: "Save",
      AppStrings.changePassword: "Change Password",
      AppStrings.change: "Change",
      AppStrings.order: "Order",
      AppStrings.favourite: "Favourite",
      AppStrings.ourRecommendation: "Our Recommendations",
    };

    Map<String, String> translatedStrings = {};
    for (String key in stringsToTranslate.keys) {
      var translation = await _translator.translate(stringsToTranslate[key]!,
          to: _selectedLanguage);
      translatedStrings[key] = translation.text;
    }

    _translatedStrings = translatedStrings;

    // Cache the translations
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_selectedLanguage, jsonEncode(translatedStrings));

    notifyListeners();
  }

  // Set the selected language and update translations
  set selectedLanguage(String language) {
    _selectedLanguage = language;
    _translateAndCacheAllStrings(); // Translate and cache for the new language
    notifyListeners();
  }

  // Get the translated string for a given key
  String getTranslatedString(String key) {
    return _translatedStrings[key] ??
        key; // Return the key itself if translation is not found
  }
}
