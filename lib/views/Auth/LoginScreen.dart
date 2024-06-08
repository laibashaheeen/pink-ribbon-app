import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:pink_ribbon/views/Auth/Components/Authfield.dart';
import 'package:pink_ribbon/views/Auth/ForgotPassword/Forgotpass.dart';
import 'package:pink_ribbon/views/Auth/SignUpScreen.dart';
import 'package:pink_ribbon/views/Components/CommonButton.dart';
import 'package:pink_ribbon/views/homepage/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/app_assets.dart';
import '../../data/app_colors.dart';
import '../../data/typography.dart';
import '../config.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final bool _isNotValidate = false;

  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void enter_login() {
    if (_formKey.currentState!.validate()) {
      (context) => const ForgotPass();
    }
  }

  void loginUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var reqBody = {
        "email": emailController.text,
        "password": passwordController.text
      };
      var response = await http.post(Uri.parse(login),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status']) {
        var myToken = jsonResponse['token'];
        prefs.setString('token', myToken);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(token: myToken)));
      } else {
        print('Something went wrong');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundPink2,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(29.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome\nBack!",
                  style: AppTypography.kExtraBold24
                      .copyWith(color: AppColors.kBlack),
                ),
                SizedBox(
                  height: 57.h,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AuthField(
                        controller: emailController,
                        hintText: 'Username or Email',
                        icon: '',
                      ),
                      SizedBox(height: 31.h),
                      AuthField(
                        controller: passwordController,
                        isPassword: true,
                        hintText: 'Password',
                        icon: '',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                      child: Text("Forget Password?",
                          style: AppTypography.kExtraLight12
                              .copyWith(color: Colors.red)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ForgotPass()));
                      }),
                ),
                SizedBox(
                  height: 52.h,
                ),
                CommomButton(
                  text: "Login ",
                  color: AppColors.kPrimary,
                  color2: AppColors.kWhite,
                  border: Border.all(width: 1),
                  onTap: () {
                    //    enter_login();
                    const LoginScreen();
                  },
                ),
                SizedBox(
                  height: 75.h,
                ),
                Center(
                  child: Text(
                    "-or Continue With-",
                    style: AppTypography.kExtraLight12
                        .copyWith(color: AppColors.kBlack),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 54,
                      width: 54,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppAssets.google)),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      height: 54,
                      width: 54,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image:
                              DecorationImage(image: AssetImage(AppAssets.fb))),
                    )
                  ],
                ),
                SizedBox(
                  height: 28.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create and Account",
                      style: AppTypography.kLight14
                          .copyWith(color: AppColors.kBlack),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    InkWell(
                      child: Text(
                        "Sign Up",
                        style: AppTypography.kSemiBold14.copyWith(
                            color: AppColors.kPrimary,
                            decoration: TextDecoration.underline),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const SignUpScreen()));
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
