import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/views/Auth/Components/Authfield.dart';

import '../../../data/app_colors.dart';
import '../../Components/CommonButton.dart';
import '../../landingpage/landing_page.dart';


final _formKey = GlobalKey<FormState>();

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  void _submitform() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()),
      );
    }
  }

  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundPink2,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(29.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot \nPassword ?",
                style: AppTypography.kExtraBold24
                    .copyWith(color: AppColors.kBlack),
              ),
              SizedBox(
                height: 43.h,
              ),
              Form(
                key: _formKey,
                child: AuthField(
                  controller: _emailController,
                  hintText: 'Username or Email',
                  icon: '',
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                " We will send you a message to set or reset your new password",
                style: AppTypography.kLight12.copyWith(color: AppColors.kBlack),
              ),
              SizedBox(
                height: 33.h,
              ),
              CommomButton(
                color: AppColors.kPrimary,
                color2: AppColors.kWhite,
                border: Border.all(width: 1),
                onTap: () {
                  _submitform();
                },
                text: 'Submit',
              )
            ],
          ),
        ),
      ),
    );
  }
}
