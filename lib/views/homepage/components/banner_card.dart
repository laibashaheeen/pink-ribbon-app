import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerCard extends StatelessWidget {
  
   final String imagePath;

   const BannerCard({Key? key, required this.imagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                image: DecorationImage(
                    image: AssetImage(
                      imagePath),
                    fit: BoxFit.fill),
              ),
              
            );
  }
}