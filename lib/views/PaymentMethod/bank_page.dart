import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/views/PaymentMethod/components/account_details.dart';
import 'package:pink_ribbon/views/widgets/custom_appbar.dart';
import 'package:pink_ribbon/views/landingpage/landing_page.dart';

class BankPage extends StatefulWidget {
  const BankPage({super.key});

  @override
  State<BankPage> createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  final String accountNumber = '0010049231990017';
  final String ibanNumber = 'PK33ABPA0010049231990017';
  XFile? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imageFile = pickedFile;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Image picked successfully!'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No image selected.'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to pick image.'),
        ),
      );
    }
  }
  
  void _submit() {
    if (_imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please upload an image before submitting.'),
        ),
      );
    } else {
      showDialog<String>(
                context: context,
                builder: (BuildContext context) => Dialog(
                  insetPadding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 30.0.h, horizontal: 60.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.h),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.kPrimary),
                          child: Icon(Icons.done,
                          color: AppColors.kWhite,
                          size: 40,),
                        ),
                        SizedBox(height: 30.h),
                        Text("Donation done successfully.",
                            style: AppTypography.kSemiBold14
                                .copyWith(color: AppColors.kBlack)),
                        SizedBox(height: 20.h),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LandingPage(),
                                ));
                          },
                          child: Text("Back to Home",
                              style: AppTypography.kLight12
                                  .copyWith(color: AppColors.kGrey)),
                        )
                      ],
                    ),
                  ),
                ),
              );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Donation"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            accountDetails(accountNumber, 'Account No.', context),
            SizedBox(
              height: 20.h,
            ),
            accountDetails(ibanNumber, 'IbanNumber No.', context),
            SizedBox(
              height: 16.h,
            ),
            // _imageFile == null
            //     ? const Text('No image selected.')
            //     : Image.file(File(_imageFile!.path)),
            SizedBox(height: 16.h),
            InkWell(
              onTap: _pickImage,
              child: Container(
                padding: EdgeInsets.all(10.h),
                decoration: BoxDecoration(
                  color: AppColors.kWhite,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.upload,
                      color: AppColors.kAppBarPink,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'Upload screenshot of transaction',
                      style: AppTypography.kLight12
                          .copyWith(color: AppColors.kAppBarPink),
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(
              height: 28.h,
            ),
            InkWell(
              onTap: _submit,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 8.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.kPrimary,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Text("Submit",
                    style: AppTypography.kSemiBold14.copyWith(
                      color: AppColors.kWhite,
                      fontSize: 22,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
