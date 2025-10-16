import 'package:flutter/material.dart';
import 'package:foodi_go/ui/screens/auth_screens/sign_in_screen.dart';

import '../../../utilities/app_colors.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

bool isShowPassword = false;
bool isShowConfirmPassword = false;

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
                      "Re-set Password",
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

                    SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "New Password",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    TextFormField(
                      obscureText: isShowPassword,
                      decoration: InputDecoration(
                        hintText: "Enter New Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            isShowPassword = !isShowPassword;
                            setState(() {});
                          },
                          icon: Icon(
                            isShowPassword
                                ? Icons.visibility_off
                                : Icons.remove_red_eye,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Confirm New Password",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),

                    TextFormField(
                      obscureText: isShowConfirmPassword,
                      decoration: InputDecoration(
                        hintText: "R-Enter New Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            isShowConfirmPassword = !isShowConfirmPassword;
                            setState(() {});
                          },
                          icon: Icon(
                            isShowConfirmPassword
                                ? Icons.visibility_off
                                : Icons.remove_red_eye,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),

                    ElevatedButton(
                      onPressed: () {
                        _showConfirmButton();
                      },
                      child: Text(
                        "Confirm",
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

  void _showConfirmButton() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: 250,
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.themeColor, width: 5),
                  ),
                  child: Icon(
                    size: 60,
                    Icons.check,
                    color: AppColors.themeColor,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Change Password",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  "our can now use your new password to login to your account.",
                  style: Theme.of(context).textTheme.titleSmall,
                ),

                SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    _goToLoginButton();
                  },
                  child: Text(
                    "Go To LogIn",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _goToLoginButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }
}
