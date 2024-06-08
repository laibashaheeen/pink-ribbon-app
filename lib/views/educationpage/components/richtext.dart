
            import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';

Widget customRichText(String stage, String description) {
    return RichText(
              text: TextSpan(
                style: AppTypography.kLight14.copyWith(height: 1.6.h),
                children: [
                  TextSpan(
                    text: stage,
                    style: AppTypography.kSemiBold14
                        .copyWith(color: AppColors.kAppBarPink),
                  ),
                   TextSpan(
                    text: description,
                    style: AppTypography.kLight14.copyWith(height: 1.6.h, color: AppColors.kBlack)
                  ),
                ],
              ),
            );
  }