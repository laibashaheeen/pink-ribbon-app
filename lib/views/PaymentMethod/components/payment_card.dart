// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pink_ribbon/model/payment_model.dart';

// class MethodContainer extends StatelessWidget {
//   final PaymentModel methodItem;
//   const MethodContainer({
//     super.key,required this.methodItem,});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // margin: EdgeInsets.symmetric( vertical: 200.h),
//       padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
//       // height: 300.h,
//       // width: double.infinity,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             methodItem.startColor.withOpacity(0.95),
//             methodItem.midColor.withOpacity(0.95),
//             methodItem.endColor.withOpacity(0.95),
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Container(

//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(methodItem.image),
//             fit: BoxFit.contain,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/model/payment_model.dart';
import 'package:pink_ribbon/views/PaymentMethod/bank_page.dart';

class PaymentCard extends StatelessWidget {
  final PaymentModel methodItem;
  const PaymentCard({super.key, required this.methodItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BankPage(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        // margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r), color: AppColors.kWhite),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              methodItem.title,
              style:
                  AppTypography.kLight14.copyWith(color: AppColors.kBlack),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(methodItem.image),
                  fit: BoxFit.contain, // Adjust the fit as per your requirement
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
