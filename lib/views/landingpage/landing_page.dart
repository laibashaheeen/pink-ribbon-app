import 'package:flutter/material.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/views/donationPage/donation_page.dart';
import 'package:pink_ribbon/views/educationpage/education_page.dart';
import 'package:pink_ribbon/views/homepage/home_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  bool isSelected = false;

  List<Widget> pages = [
    const HomePage(token: null,),
    const EducationPage(),
    const DonationPage(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            isSelected = !isSelected;

            setState(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Container()));
            });
          },
          backgroundColor: AppColors.kFloatingGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          
          
          child: Icon(
            Icons.message,
            color: AppColors.kPrimary,
            size: 28,
          )
          ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.kPrimary,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: AppColors.kPrimary,
              size: 26,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: AppColors.kAppBarGrey,
              size: 26,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.menu_book_outlined,
              color: AppColors.kPrimary,
              size: 26,
            ),
            icon: Icon(
              Icons.menu_book_outlined,
              color: AppColors.kAppBarGrey,
              size: 26,
            ),
            label: 'Education',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.attach_money,
              color: AppColors.kPrimary,
              size: 26,
            ),
            icon: Icon(
              Icons.attach_money,
              color: AppColors.kAppBarGrey,
              size: 26,
            ),
            label: 'Donate',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.calendar_month,
              color: AppColors.kPrimary,
              size: 26,
            ),
            icon: Icon(
              Icons.calendar_month_outlined,
              color: AppColors.kAppBarGrey,
              size: 26,
            ),
            label: 'Calender',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.more_vert,
              color: AppColors.kPrimary,
              size: 26,
            ),
            icon: Icon(
              Icons.more_vert,
              color: AppColors.kAppBarGrey,
              size: 26,
            ),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
