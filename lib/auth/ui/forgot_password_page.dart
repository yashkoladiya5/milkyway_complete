import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/auth/model/sign_up_model.dart';
import 'package:milkyway/auth/ui/otp_page.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/provider/loading_controller.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';
import 'package:provider/provider.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late double height;
  late double width;
  final _formKey = GlobalKey<FormState>();
  final textFieldController = TextEditingController();
  late ThemeController themeController;
  late LoadingController loadingController;
  final auth = FirebaseAuth.instance;
  String? emailOTP;
  final TwilioFlutter twilioFlutter = TwilioFlutter(
      accountSid: 'AC9d722174f6bb5cb1365b1614c1d2091b',
      authToken: '1950530ec72f0f0cc679745e513ba878',
      twilioNumber: '+17753699713');
  List<SignUpModel> usersList = [];
  int flag = 0;

  mobileOrEmailExistCheck(String value) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("user");
    loadingController.changeLoad();
    await collectionReference.get().then(
      (value) {
        var data = value.docs;

        for (int i = 0; i < data.length; i++) {
          var user = data[i].data();
          usersList.add(SignUpModel.fromJson(user as Map<String, dynamic>));
        }
      },
    );

    for (int i = 0; i < usersList.length; i++) {
      if (usersList[i].mobileNumber == "+91$value" ||
          usersList[i].email == value) {
        if (isValidEmail(value)) {
          await sendOTPToEmail();

          flag = 1;
          break;
        } else if (isValidMobile(value)) {
          sendOTPToMobile(textFieldController.text);
          flag = 1;
          break;
        }
      }
    }

    if (flag == 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 200),
          content: Text(
              "Please enter Email or Mobile Number that you have use at Sign Up Or LogIn")));
    }
  }

  bool isValidEmail(String value) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }

  bool isValidMobile(String value) {
    final RegExp mobileRegex = RegExp(r'^[0-9]{10}$');
    return mobileRegex.hasMatch(value);
  }

  sendOTPToEmail() async {
    if (await EmailOTP.sendOTP(email: textFieldController.text)) {
      print("OTP SEND SUCCESSFULLY");
      emailOTP = EmailOTP.getOTP();
      loadingController.changeLoad();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text("OTP Sent Successfully to ${textFieldController.text}")));
      String refresh;
      refresh = await Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return OtpPage(
            email: textFieldController.text,
            otp: emailOTP.toString(),
            isEmailOrMobile: "Email",
          );
        },
      ));

      if (refresh == "refresh") {
        textFieldController.clear();
        print("Refreshed");
      }
    } else {
      print("OTP FAILED");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 200), content: Text("Try Again")));
    }
  }

  sendOTPToMobile(String number) async {
    String otp = _generateOtp();

    String message = 'This is your verification code for Milkyway: $otp';

    TwilioResponse response = await twilioFlutter.sendSMS(
        toNumber: '+91$number', messageBody: message);

    print(response.responseCode);
    loadingController.changeLoad();
    if (response.responseCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Code sent successFully to +91$number")));
      String refresh;
      refresh = await Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return OtpPage(
            mobileNumber: "+91$number",
            otp: otp,
            isEmailOrMobile: "Mobile",
          );
        },
      ));

      if (refresh == "refresh") {
        textFieldController.clear();
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something went wrong...!!")));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    EmailOTP.config(
        appEmail: "yash.aviratinfo@gmail.com",
        appName: "milkyway",
        otpLength: 4,
        otpType: OTPType.numeric,
        emailTheme: EmailTheme.v1);
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    themeController = Provider.of<ThemeController>(context);
    loadingController = Provider.of<LoadingController>(context);
    return NetworkChecker(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: HexColor(themeController.isLight
              ? AppColorsLight.backgroundColor
              : AppColorsDark.backgroundColor),
          image: DecorationImage(
              image: AssetImage(themeController.isLight
                  ? "assets/images/Auth/Auth_light_image/img-03 3.png"
                  : "assets/images/Auth/Auth_dark_image/img-03 2.png"),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SizedBox(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.100,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor),
                        size: 30,
                      )),
                  SizedBox(
                    height: height * 0.100,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Builder(builder: (context) {
                          return Text(
                            (AppStrings.forgotPasswordHeading).tr(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: HexColor(themeController.isLight
                                    ? AppColorsLight.darkBlueColor
                                    : AppColorsDark.whiteColor)),
                          );
                        }),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Builder(builder: (context) {
                          return Text(
                            (AppStrings.forgotPasswordDescription).tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: HexColor(themeController.isLight
                                  ? AppColorsLight.silverColor
                                  : AppColorsDark.greyColor),
                            ),
                          );
                        }),
                        SizedBox(
                          height: height * 0.07,
                        ),
                        _buildForm()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSendButton() {
    return InkWell(
      onTap: () async {
        if (isValidEmail(textFieldController.text)) {
          await mobileOrEmailExistCheck(textFieldController.text);
        } else if (isValidMobile(textFieldController.text)) {
          await mobileOrEmailExistCheck(textFieldController.text);
        }

        if (_formKey.currentState!.validate()) {
          print("Success");
        } else {
          print("fail");
        }
      },
      child: Container(
        height: height * 0.05,
        width: width * 0.280,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: HexColor(AppColorsLight.orangeColor),
                  spreadRadius: 1,
                  offset: const Offset(0, 0),
                  blurRadius: 2)
            ],
            color: HexColor(AppColorsLight.orangeColor),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: loadingController.isLoading == false
              ? Builder(builder: (context) {
                  return Text(
                    (AppStrings.sendButton).tr(),
                    style: TextStyle(
                        color: HexColor(AppColorsLight.backgroundColor),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  );
                })
              : CircularProgressIndicator(
                  color: Colors.white,
                ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.120),
            child: Builder(builder: (context) {
              return TextFormField(
                controller: textFieldController,
                onChanged: (value) {
                  if (_formKey.currentState != null) {
                    _formKey.currentState!.validate();
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This Field is Required";
                  } else if (!isValidEmail(value) && !isValidMobile(value)) {
                    return 'Please enter valid email or mobile No.';
                  }
                  return null;
                },
                style: TextStyle(
                    color: themeController.isLight
                        ? Colors.black
                        : HexColor(AppColorsDark.whiteColor)),
                decoration: InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: HexColor(AppColorsLight.silverColor))),
                    hintText: (AppStrings.forgotPasswordTextFieldHintText).tr(),
                    hintStyle: TextStyle(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.silverColor
                            : AppColorsDark.greyColor),
                        fontSize: 14),
                    contentPadding: EdgeInsets.only(left: width * 0.035)),
              );
            }),
          ),
          SizedBox(
            height: height * 0.1,
          ),
          _buildSendButton()
        ],
      ),
    );
  }

  String _generateOtp() {
    Random random = Random();
    int otp = random.nextInt(9000) + 1000;
    return otp.toString();
  }
}
