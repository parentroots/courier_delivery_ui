import 'package:flutter/material.dart';
import 'package:foodi_go/ui/screens/auth_screens/reset_password_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../utilities/app_colors.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80),
              Container(
                height: 500,
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "OTP Verify",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Enter your OTP which has been sent to your phone and completely verify your account",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),

                    SizedBox(height: 35),

                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: PinCodeTextField(
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(6),
                          fieldHeight: 55,
                          fieldWidth: 55,
                          activeFillColor: Colors.white,
                          inactiveColor: Colors.red,
                          inactiveFillColor: Colors.transparent,
                          inactiveBorderWidth: 2,
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,

                        onCompleted: (v) {
                          print("Completed");
                        },

                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          return true;
                        },

                        appContext: context,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("A code has been sent to your phone number",style: Theme.of(context).textTheme.titleSmall,),
                    SizedBox(height: 10),
                    Text("Resend is 00:48",style: TextStyle(
                      color: AppColors.themeColor,
                      fontSize: 20
                    ),),
                    SizedBox(height: 30),

                    ElevatedButton(
                      onPressed: () {
                        _onTapVerifyButton();
                      },
                      child: Text(
                        "Verify",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapVerifyButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
    );
  }
}
