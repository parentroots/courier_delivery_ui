import 'package:flutter/material.dart';
import 'package:foodi_go/ui/screens/auth_screens/otp_verify_screen.dart';
import 'package:foodi_go/utilities/app_colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                    "Forgot Password",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Enter the phone number associated with your account and we’ll send you OTP to reset your password",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),

                  SizedBox(height: 30,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Phone or Email",style:TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                      )),
                    ],
                  ),
                  SizedBox(height: 4,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "enter your email or phone",
                    ),
                  ),
                  SizedBox(height: 40,),
                   
                  ElevatedButton(onPressed: (){
                    _onTapConfirmButton();

                  }, child: Text("Confirm",style: TextStyle(color: AppColors.whiteColor,
                  fontSize: 24),))





                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapConfirmButton(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpVerifyScreen()));
  }

}
