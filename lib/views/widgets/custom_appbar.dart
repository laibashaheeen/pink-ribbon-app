import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({ super.key, required this.title });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        
        backgroundColor: AppColors.kWhite,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
                Icons.arrow_back_ios_new,
                size: 28,
                color: AppColors.kAppBarGrey,
              ),
        ),
        centerTitle: true,
        title: Text(title,
                style: AppTypography.kSemiBold18.copyWith(color: AppColors.kPrimary)
                ),
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
      );
  }
}