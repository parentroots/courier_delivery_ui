import 'package:flutter/material.dart';
import 'package:foodi_go/utilities/app_colors.dart';

class SplashScreenWidget  extends StatelessWidget {
  const SplashScreenWidget ({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       Container(
         height: double.maxFinite,
         width: double.maxFinite,
         color: AppColors.themeColor,
       ),

        child

      ],
    );
  }
}
