import 'package:flutter/material.dart';
import 'package:flutter_faq/flutter_faq.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/model/faq_model.dart';

class CustomFaq extends StatefulWidget {
  final FAQModel faqItem;
  // final bool isSelected;
  const CustomFaq({super.key, required this.faqItem, 
  // this.isSelected = false
  });

  @override
  State<CustomFaq> createState() => _CustomFaqState();
}

class _CustomFaqState extends State<CustomFaq> {
  @override
  Widget build(BuildContext context) {
    return FAQ(
      question: widget.faqItem.question,
      answer: widget.faqItem.answer,
      expandedIcon: const Icon(
        Icons.minimize,
        size: 20,
      ),
      collapsedIcon: const Icon(
        Icons.add,
        size: 20,
      ),
      
      ansStyle: AppTypography.kLight14.copyWith(height: 1.6),
      queStyle: AppTypography.kSemiBold16.copyWith(color: AppColors.kPrimary),
      ansDecoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r))),
      queDecoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: 
          // widget.isSelected
          //     ? BorderRadius.only(
          //         topLeft: Radius.circular(20.r),
          //         topRight: Radius.circular(20.r))
          //     : 
              BorderRadius.all(Radius.circular(20.r)),
              border: Border.all(color: AppColors.kBackgroundPink2, width: 1.w)
              ),
              
      ansPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
      showDivider: false,
    );
  }
}
