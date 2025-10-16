import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodi_go/ui/screens/well_come_screen.dart';
import 'package:foodi_go/ui/widget/splash_screen_widget.dart';
import 'package:foodi_go/utilities/app_colors.dart';
import 'package:foodi_go/utilities/assets_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gotToNextScreen();
  }
  
  Future<void>gotToNextScreen()async{
    await Future.delayed(Duration(seconds: 2));
    if(mounted){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WellComeScreen()));
    }
  }
  
  @override
  Widget build(BuildContext context) {

    return SplashScreenWidget(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: SvgPicture.asset(AssetsPath.logoSvg),

              )
            ],


              ),
        ),
    );
  }
}
