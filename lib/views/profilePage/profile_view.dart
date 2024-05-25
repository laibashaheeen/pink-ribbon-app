import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/views/Auth/ForgotPassword/Forgotpass.dart';
import 'package:pink_ribbon/views/profilePage/components/custom_text_field.dart';
import 'package:pink_ribbon/views/profilePage/components/custom_text_form_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
   final _heightController = TextEditingController(); // Controller for height
  final _weightController = TextEditingController(); // Controller for weight
  final _formKey = GlobalKey<FormState>();
  File? _imageFile; 
  double? _bmi; 

  Future<void> _getImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path); // Convert XFile to File
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: CircleAvatar(
              radius: 50, // adjust the size as needed
              backgroundImage: FileImage(_imageFile!),
            ),
          );
        },
      );
    } else {
      // User canceled the picker
      print('No image selected.');
    }
  }
void _calculateBMI() {
  double? heightFeet = double.tryParse(_heightController.text);
  double? weight = double.tryParse(_weightController.text);

  if (heightFeet != null && weight != null && heightFeet > 0 && weight > 0) {
    // Convert height from feet to meters
    // 1 foot = 0.3048 meters
    double heightMeters = heightFeet * 0.3048;

    // Calculate BMI using the formula
    double bmi = weight / (heightMeters * heightMeters);

    // Update the state with the calculated BMI
    setState(() {
      _bmi = bmi;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
          "Profile",
          style: AppTypography.kSemiBold18.copyWith(color: AppColors.kPrimary),
        ),
      ),
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(24.h),
        child: Container(
          padding: EdgeInsets.all(24.h),
          width: double.infinity,
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
          ),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _getImageFromGallery(context);
                      },
                      child: Container(
                        width: 96.w,
                        height: 96.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.kPrimary,
                          border: Border.all(color: AppColors.kWhite, width: 3.w),
                        ),
                        child: _imageFile != null
                            ? CircleAvatar(
                                radius: 50, // adjust the size as needed
                                backgroundImage: FileImage(_imageFile!),
                              )
                            : Icon(
                                Icons.add_photo_alternate,
                                size: 48,
                                color: AppColors.kWhite,
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.kPrimary,
                          border: Border.all(color: AppColors.kWhite, width: 3.w),
                        ),
                        child: Icon(
                          Icons.edit_outlined,
                          color: AppColors.kWhite,
                          size: 14.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Personal Details',
                  style: AppTypography.kSemiBold18.copyWith(color: AppColors.kBlack),
                ),
              ),
              SizedBox(height: 20.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    ProfileTextFormField(
                      controller: _emailController,
                      label: 'Email Address',
                    ),
                    SizedBox(height: 28.h),
                    ProfileTextFormField(
                      isPassword: true,
                      controller: _passwordController,
                      label: 'Password',
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPass(),
                            ),
                          );
                        },
                        child: Text(
                          'Change Password',
                          style: AppTypography.kLight12.copyWith(
                            color: AppColors.kPrimary,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.kPrimary
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 8.h),
                    const ProfileTextField(
                      label: 'Name',
                    ),
                    SizedBox(height: 28.h),
                    const ProfileTextField(
                      label: 'Mobile',
                    ),
                    SizedBox(height: 28.h),
                    const ProfileTextField(
                      label: 'Gender',
                    ),
                    SizedBox(height: 24.h),
          
          
             
                    const ProfileTextField(
                      label: 'Blood Group',
                    ),
                    SizedBox(height: 28.h),
                    const ProfileTextField(
                      label: 'Date of Birth',
                    ),
                    SizedBox(height: 34.h),
                    InkWell(
                      onTap: () {
                        {
                          if (_formKey.currentState!.validate()) {}
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.kPrimary,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          "Update",
                          style: AppTypography.kBold18.copyWith(
                            color: AppColors.kWhite,
                            
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                     Divider(
                      thickness: 1,
                      color: AppColors.kAppBarGrey,
                    ),
                    SizedBox(height: 24.h),
                    ProfileTextFormField(
                controller: _heightController,
                label: 'Height (ft)',
              ),
              SizedBox(height: 24.h),
          
              // Text field for weight
              ProfileTextFormField(
                controller: _weightController,
                label: 'Weight (kg)',
              ),
              SizedBox(height: 28.h),
          
              // Button to calculate BMI
              InkWell(
                onTap: () {
                  // Call function to calculate BMI
                  _calculateBMI();
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.kPrimary,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    "Calculate BMI",
                    style: AppTypography.kBold18.copyWith(
                      color: AppColors.kWhite,
                    ),
                  ),
                ),
              ),
          
              // Display calculated BMI
              if (_bmi != null)
                Text(
                  'BMI: ${_bmi?.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18),
                ),
                    SizedBox(height: 57.h),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:pink_ribbon/data/app_colors.dart';
// import 'package:pink_ribbon/data/typography.dart';
// import 'package:pink_ribbon/views/Auth/ForgotPassword/Forgotpass.dart';
// import 'package:pink_ribbon/views/profilePage/components/custom_text_field.dart';
// import 'package:pink_ribbon/views/profilePage/components/custom_text_form_field.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _heightController = TextEditingController(); // Controller for height
//   final _weightController = TextEditingController(); // Controller for weight
//   final _formKey = GlobalKey<FormState>();
//   File? _imageFile; // Change the type to File?
//   double? _bmi; // Variable to store BMI value

//   Future<void> _getImageFromGallery(BuildContext context) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = File(pickedFile.path); // Convert XFile to File
//       });

//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             content: CircleAvatar(
//               radius: 50, // adjust the size as needed
//               backgroundImage: FileImage(_imageFile!),
//             ),
//           );
//         },
//       );
//     } else {
//       // User canceled the picker
//       print('No image selected.');
//     }
//   }

//   // Function to calculate BMI
//   void _calculateBMI() {
//     double? height = double.tryParse(_heightController.text);
//     double? weight = double.tryParse(_weightController.text);

//     if (height != null && weight != null && height > 0 && weight > 0) {
//       // Convert height to meters (if not already in meters)
//       // Assuming height entered in centimeters, converting to meters
//       double heightInMeters = height / 100;

//       // Calculate BMI using the formula
//       double bmi = weight / (heightInMeters * heightInMeters);

//       // Update the state with the calculated BMI
//       setState(() {
//         _bmi = bmi;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.kWhite,
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(
//             Icons.arrow_back_ios_new,
//             size: 28,
//             color: AppColors.kAppBarGrey,
//           ),
//         ),
//         centerTitle: true,
//         title: Text(
//           "Profile",
//           style: AppTypography.kSemiBold18.copyWith(color: AppColors.kPrimary),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(24.h),
//         child: Column(
//           children: [
//             // Existing UI code

//             // Text field for height
//             ProfileTextFormField(
//               controller: _heightController,
//               label: 'Height (cm)',
//             ),
//             SizedBox(height: 24.h),

//             // Text field for weight
//             ProfileTextFormField(
//               controller: _weightController,
//               label: 'Weight (kg)',
//             ),
//             SizedBox(height: 28.h),

//             // Button to calculate BMI
//             InkWell(
//               onTap: () {
//                 // Call function to calculate BMI
//                 _calculateBMI();
//               },
//               child: Container(
//                 alignment: Alignment.center,
//                 padding: EdgeInsets.symmetric(vertical: 10.h),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: AppColors.kPrimary,
//                   borderRadius: BorderRadius.circular(10.r),
//                 ),
//                 child: Text(
//                   "Calculate BMI",
//                   style: AppTypography.kBold18.copyWith(
//                     color: AppColors.kWhite,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 28.h),

//             // Display calculated BMI
//             if (_bmi != null)
//               Text(
//                 'BMI: ${_bmi?.toStringAsFixed(2)}',
//                 style: TextStyle(fontSize: 18),
//               ),

//             // Existing UI code
//           ],
//         ),
//       ),
//     );
//   }
// }
