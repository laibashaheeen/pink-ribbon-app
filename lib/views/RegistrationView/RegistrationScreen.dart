import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pink_ribbon/views/Auth/LoginScreen.dart';

import '../../data/app_colors.dart';
import '../../data/typography.dart';
import '../Auth/SignUpScreen.dart';
import '../Components/CommonButton.dart';


class ResgistrationView extends StatelessWidget {
  const ResgistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBackgroundPink2,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 90, bottom: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'PINKRIBBON',
                  style:
                      AppTypography.kBold16.copyWith(color: AppColors.kPrimary),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 13.h,
                ),
                Text(
                  'UNITED AGAINST BREAST CANCER',
                  style: AppTypography.kSemiBold18
                      .copyWith(color: AppColors.kPrimary),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.h,
                ),
                  Container(
                  height: 400.h,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Lottie.asset(
                    'animations/pinkribbon.json',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 33.h,
                ),
                CommomButton(
                  text: "Create Account ",
                  color: AppColors.kBackgroundPink2,
                  color2: AppColors.kWhite,
                  border: Border.all(width: 0),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                ),
                SizedBox(
                  height: 13.h,
                ),
                CommomButton(
                  text: "Login ",
                  color: AppColors.kWhite,
                  color2: AppColors.kPrimary,
                  border: Border.all(width: 1),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()));
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
