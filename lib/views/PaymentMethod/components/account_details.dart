import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';


Widget accountDetails(String accountNumber, String title, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: AppTypography.kLight12.copyWith(color: AppColors.kGrey),
      ),
      SizedBox(height: 16.h),
      Container(
        padding: EdgeInsets.only(left: 20.w, right: 10),
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              accountNumber,
              style: AppTypography.kLight14.copyWith(color: AppColors.kBlack),
            ),
            IconButton(
              icon: Icon(
                Icons.content_copy,
                color: AppColors.kPrimary,
                size: 22,
              ),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: accountNumber));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Copied to clipboard')),
                );
              },
            ),
          ],
        ),
      ),
    ],
  );
}
