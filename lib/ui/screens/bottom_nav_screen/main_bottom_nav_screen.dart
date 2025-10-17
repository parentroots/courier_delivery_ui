import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:foodi_go/ui/screens/bottom_nav_screen/analysis_screen.dart';
import 'package:foodi_go/ui/screens/bottom_nav_screen/home_screen.dart';
import 'package:foodi_go/ui/screens/bottom_nav_screen/profile_screen.dart';
import 'package:foodi_go/utilities/app_colors.dart';

import '../../widget/profile_app_bar.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: ProfileAppBar()
      ),


      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          if (mounted) {
            setState(() => _currentPage = index);
          }
        },
        children: [
          HomeScreen(),
          AnalysisScreen(),
          AnalysisScreen(),
          ProfileScreen()],
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: AppColors.themeColor,
            backgroundColorOpacity:1,
            activeIconColor: AppColors.whiteColor,
            activeTitleColor: AppColors.whiteColor
          ),
          BottomBarItem(
            icon: Icon(Icons.analytics),
            title: Text('Analytics'),
              activeColor: AppColors.themeColor,
              backgroundColorOpacity:1,
              activeIconColor: AppColors.whiteColor,
              activeTitleColor: AppColors.whiteColor
          ),
          BottomBarItem(
            icon: Icon(Icons.analytics_outlined),
            title: Text('Analysis'),
              activeColor: AppColors.themeColor,
              backgroundColorOpacity:1,
              activeIconColor: AppColors.whiteColor,
              activeTitleColor: AppColors.whiteColor
          ),
          BottomBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
              activeColor: AppColors.themeColor,
              backgroundColorOpacity:1,
              activeIconColor: AppColors.whiteColor,
              activeTitleColor: AppColors.whiteColor,

          ),
        ],
      ),
    );
  }
}
