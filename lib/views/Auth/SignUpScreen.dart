import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/views/Auth/Components/Authfield.dart';
import 'package:pink_ribbon/views/config.dart';
import 'package:pink_ribbon/views/landingpage/landing_page.dart';

import '../../data/app_assets.dart';
import '../../data/typography.dart';
import '../Components/CommonButton.dart';
import 'LoginScreen.dart';

final _formKey = GlobalKey<FormState>();

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
  });
  @override
  State<SignUpScreen> createState() => _SignupPageState();
}

// ignore: camel_case_types
class _SignupPageState extends State<SignUpScreen> {
  // ignore: non_constant_identifier_names
  void enter_login() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()),
      );
    }
  }

  bool click = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordController1 = TextEditingController();

  bool _isNotValidate = false;
  void registerUser() async {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      var regBody = {
        "email": _emailController.text,
        "password": _passwordController.text
      };
      var response = await http.post(Uri.parse(registration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody));
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse['status']);
      if (jsonResponse['status']) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      } else {
        print("SomeThing Went Wrong");
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  var password;
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
                  "Create an \nAccount",
                  style: AppTypography.kExtraBold24
                      .copyWith(color: AppColors.kBlack),
                ),
                SizedBox(
                  height: 33.h,
                ),
                Form(
                  key: _formKey,
                  child: Column(children: [
                    AuthField(
                      controller: _emailController,
                      isPassword: false,
                      hintText: 'Username or Email',
                      icon: '',
                    ),
                    SizedBox(
                      height: 31.h,
                    ),
                    AuthField(
                      controller: _passwordController,
                      isPassword: true,
                      hintText: 'Password',
                      icon: '',
                    ),
                    SizedBox(
                      height: 31.h,
                    ),
                    AuthField(
                      controller: _passwordController1,
                      isPassword: true,
                      hintText: 'Password',
                      icon: '',
                    ),
                    SizedBox(
                      height: 19.h,
                    ),
                  ]),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'By clicking the ',
                            style: AppTypography.kExtraLight12
                                .copyWith(color: AppColors.kBlack),
                          ),
                          TextSpan(
                            text: ' Register',
                            style: AppTypography.kExtraLight12
                                .copyWith(color: AppColors.kPrimary),
                          ),
                          TextSpan(
                            text: ' button, you agree to the public offer',
                            style: AppTypography.kExtraLight12
                                .copyWith(color: AppColors.kBlack),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  height: 38.h,
                ),
                CommomButton(
                  text: "Create Account ",
                  color: AppColors.kPrimary,
                  color2: AppColors.kWhite,
                  border: Border.all(width: 1),
                  onTap: () {
                    enter_login();
                    registerUser();
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: Text(
                    "-or Continue With -",
                    style: AppTypography.kLight12
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
                      height: 56.h,
                      width: 56.w,
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
                      height: 56.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image:
                              DecorationImage(image: AssetImage(AppAssets.fb))),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      height: 56.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(AppAssets.google))),
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
                      "Already have an account",
                      style: AppTypography.kLight14
                          .copyWith(color: AppColors.kBlack),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    TextButton(
                      child: Text(
                        "Login",
                        style: AppTypography.kSemiBold14.copyWith(
                            color: AppColors.kPrimary,
                            decoration: TextDecoration.underline),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                    )
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
