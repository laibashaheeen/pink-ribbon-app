import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_assets.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/views/landingpage/landing_page.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(AppColors.defaultOverlay);
  // FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final imageList = [
      AppAssets.kLogo,
      AppAssets.kDonate,
      AppAssets.kBackground,
      AppAssets.kHospital1,
      AppAssets.kHospital2,
      AppAssets.kHospital3,
      AppAssets.kSurvivor1,
      AppAssets.kSurvivor2,
      AppAssets.kSurvivor3,
      // AppAssets.splash,
      // AppAssets.onboarding1,
      // AppAssets.onboarding2,
      // AppAssets.onboarding3,
      // AppAssets.onboarding4,
      // AppAssets.registraion,
      // AppAssets.ellipse,
      // AppAssets.google,
      // AppAssets.fb,
    ];
    for (final path in imageList) {
      precacheImage(AssetImage(path), context);
    }
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: MaterialApp(
            title: 'Stylish',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: AppColors.kPrimary,
                scaffoldBackgroundColor: AppColors.kWhite,
                appBarTheme: AppBarTheme(backgroundColor: AppColors.kWhite)),
            scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
            home: const LandingPage(),
          ),
        );
      },
    );
  }
}
