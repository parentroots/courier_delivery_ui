import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodi_go/ui/screens/auth_screens/sign_in_screen.dart';
import 'package:foodi_go/ui/screens/auth_screens/sign_up_screen.dart';
import 'package:foodi_go/utilities/app_colors.dart';
import 'package:foodi_go/utilities/assets_path.dart';

class WellComeScreen extends StatefulWidget {
  const WellComeScreen({super.key});

  @override
  State<WellComeScreen> createState() => _WellComeScreenState();
}

class _WellComeScreenState extends State<WellComeScreen> {
  int _current = 0;
  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> imageSliders = [
      {
        "image": AssetsPath.ridingSvg,
        "title": "Well Come to FoodiGo",
        "subtitle":
            "Your go-to solution for fast, reliable parcel delivery. Whether you're sending or receiving, we make it easy and quick",
      },
      {
        "image": AssetsPath.locationRider,
        "title": "Fast Deliveries, Anytime",
        "subtitle":
            "Need a quick delivery? Simply book a ride, and we’ll take care of the rest. Trust us to get your parcels to their destination, safely and on time.",
      },
      {
        "image": AssetsPath.deliveredRider,
        "title": "Ready to Deliver?",
        "subtitle":
            "Let’s get your parcels moving! With just a few taps, your package is on its way. Speedy, secure, and hassle-free deliveries—every time.",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: CarouselSlider.builder(
                itemCount: imageSliders.length,
                itemBuilder: (context, index, realIdx) {
                  final data = imageSliders[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Image.asset(
                              data["image"]!,
                              height: 180,
                              width: 180,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              data["title"]!,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              data["subtitle"]!,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                options: CarouselOptions(
                  height: 600,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageSliders.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 4,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == entry.key
                          ? AppColors.themeColor
                          : Colors.grey.shade400,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {_onTapSignUpButton();},
              child: Text(
                "Sign Up",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _onTapSignInButton,
              child: Text(
                "Sign In",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  void _onTapSignInButton(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
  }
  void _onTapSignUpButton(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
  }


}
