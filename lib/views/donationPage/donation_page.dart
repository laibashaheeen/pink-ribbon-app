import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:pink_ribbon/data/app_assets.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/views/PaymentMethod/payment_method.dart';
import 'package:pink_ribbon/views/donationPage/components/button.dart';
import 'package:pink_ribbon/views/donationPage/components/button_model.dart';
import 'package:pink_ribbon/views/landingpage/landing_page.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  final TextEditingController _textController = TextEditingController();
  String? _enteredAmount;
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(AppAssets.kDonate), context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        leading: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LandingPage(),
                ));
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 28,
            color: AppColors.kAppBarGrey,
          ),
        ),
        centerTitle: true,
        title: Text("Donation",
            style:
                AppTypography.kSemiBold18.copyWith(color: AppColors.kPrimary)),
        actions: [
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const NotificationPage(),
              //     ));
            },
            child: Icon(
              Icons.notifications_none_rounded,
              size: 28,
              color: AppColors.kAppBarGrey,
            ),
          ),
          InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(right: 16.w, left: 8.w),
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 28,
                  color: AppColors.kAppBarGrey,
                ),
              )),
        ],
      ),
      body: CachedNetworkImage(
        imageUrl:
            'https://myfinancemaster.com/wp-content/uploads/2024/01/invest-20k-5-1-930x620.jpg',
        imageBuilder: (context, imageProvider) => Container(
          padding: EdgeInsets.symmetric(
            horizontal: 22.w,
          ),
          width: double.infinity,
          height: 250.h,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: imageProvider,
          )),
        ),
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      // body: Container(
      //   padding: EdgeInsets.symmetric(
      //     horizontal: 22.w,
      //   ),
      //   width: double.infinity,
      //   height: 250.h,
      //   decoration: BoxDecoration(
      //       image: DecorationImage(
      //     fit: BoxFit.cover,
      //     image: AssetImage(
      //       AppAssets.kDonate,
      //     ),
      //   )),
      // ),

      bottomSheet: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 40.h, vertical: 30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.kBackgroundPink1.withOpacity(0.4),
                AppColors.kBackgroundPink2.withOpacity(0.5),
                AppColors.kWhite,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                spacing: 16.0.w,
                runSpacing: 16.0.h,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                children: List.generate(buttonList.length, (index) {
                  return ProcedurePrice(
                    buttonList: buttonList[index],
                  );
                }),
              ),
              SizedBox(
                height: 30.h,
              ),
              TextField(
                controller: _textController,
                onChanged: (value) {
                  setState(() {
                    _enteredAmount = value;
                  });
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 30.h),
                  filled: true,
                  fillColor: AppColors.kWhite,
                  prefixText: "Rs. ",
                  prefixStyle: AppTypography.kLight14
                      .copyWith(color: AppColors.kPrimary),
                  hintText: 'Enter Desired Amount',
                  hintStyle: AppTypography.kSemiBold14
                      .copyWith(color: AppColors.kGrey.withOpacity(0.5)),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide.none),
                  disabledBorder: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
              ),
              SizedBox(height: 30.h),
              SwipeButton(
                thumbPadding: EdgeInsets.all(4.h),
                thumb: Icon(
                  Icons.chevron_right,
                  color: AppColors.kPrimary,
                  size: 32,
                ),
                activeTrackColor: AppColors.kPrimary,
                activeThumbColor: Colors.white,
                borderRadius: BorderRadius.circular(50),
                width: 265.w,
                onSwipe: () {
                  setState(() {
                    _enteredAmount = _textController.text;
                  });
                  if (_enteredAmount != null && _enteredAmount!.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentMethods(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.kBackgroundPink2,
                        duration: const Duration(milliseconds: 800),
                        content: Text(
                          "Please enter an amount",
                          style: AppTypography.kLight12
                              .copyWith(color: AppColors.kPrimary),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  "Swipe to Donate",
                  style:
                      AppTypography.kBold14.copyWith(color: AppColors.kWhite),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 90.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
