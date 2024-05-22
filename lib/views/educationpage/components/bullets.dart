import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/typography.dart';

Widget bullets(String text) {
    return Padding(
          padding:  EdgeInsets.only(top: 4.0.h,bottom: 4.h, left: 5.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                padding: EdgeInsets.only(right: 8.0.w, top: 8.h),
                child: const Icon(Icons.circle, size: 8), // Bullet point icon
              ),
              Expanded(
                child: Text(text,
                 style: AppTypography.kLight14.copyWith(height: 1.5.h)),
              ),
            ],
          ),
        );
  }
  