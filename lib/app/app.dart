import 'package:flutter/material.dart';
import 'package:foodi_go/utilities/app_colors.dart';

import '../ui/screens/splash_screen.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.themeColor,
            fixedSize: Size(300, 50),
            shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(8)
            )
          )
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: AppColors.themeColor,
            fontSize: 30,
            fontWeight: FontWeight.w500
          ),
          titleSmall: TextStyle(
            color: AppColors.greyColor,
            fontSize: 14
          ),
          titleMedium: TextStyle(
            color: AppColors.blackColor,
            fontSize: 20,
            fontWeight: FontWeight.w600
          )
        ),

        inputDecorationTheme: InputDecorationThemeData(
          fillColor: AppColors.whiteColor,
          hintStyle: TextStyle(
            color: AppColors.greyColor
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.greyColor
            )
          ),enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color: AppColors.greyColor
            )
        ),focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color: AppColors.greyColor
            )
        )

        )

      ),

    );
  }
}
