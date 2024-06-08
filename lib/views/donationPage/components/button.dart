import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/model/button_model.dart';

class ProcedurePrice extends StatelessWidget {
  // final String label;
  // final String price;
  final ButtonModel buttonList;

  // Constructor with required parameters
  const ProcedurePrice({
    super.key,
    required this.buttonList, // Label is required
    // required this.price, // Price is required
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
      decoration: BoxDecoration(
         color: AppColors.kLightGrey, // Change the background to white
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Soften the shadow color
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2), // Slightly lower the shadow
          ),
        ],
        
      ),
      child: Column(
        children: [
          Text(
            buttonList.label,
            style: AppTypography.kLight14.copyWith(color: AppColors.kGrey)
          ),
          // const SizedBox(height: 8),
          Text(
            buttonList.price,
            style: AppTypography.kSemiBold14.copyWith(color: AppColors.kGrey)
          ),
        ],
      ),
    );
  }
}
