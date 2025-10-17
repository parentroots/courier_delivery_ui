import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodi_go/data/models/network_response.dart';
import 'package:foodi_go/data/networkcaller/network_caller.dart';
import 'package:foodi_go/ui/screens/auth_screens/forgot_password_screen.dart';
import 'package:foodi_go/ui/screens/auth_screens/sign_up_screen.dart';
import 'package:foodi_go/ui/screens/bottom_nav_screen/main_bottom_nav_screen.dart';
import 'package:foodi_go/ui/widget/snackbar.dart';
import 'package:foodi_go/utilities/app_colors.dart';

import '../../../appconstant/app_const.dart';
import '../../../data/controller/auth_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoggedInUserIsProgress = false;
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 120),
              Container(
                height: double.maxFinite,
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "WellCome Back! ",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 10),

                        Text(
                          textAlign: TextAlign.center,
                          "Log in to continue shopping and enjoy personalized offers",
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 24),
                    Text(
                      "Email or Phone Number",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    TextFormField(
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Enter your email";
                        } else if (AppConstant.emailRegExp.hasMatch(value) ==
                            false) {
                          return "enter a valid email";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailTEController,
                      decoration: InputDecoration(
                        hintText: "Enter your email address or phone",
                      ),
                    ),

                    SizedBox(height: 15),
                    Text(
                      "Password",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    TextFormField(
                      controller: _passwordTEController,
                      obscureText: isShowPassword,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isShowPassword = !isShowPassword;
                            });
                          },
                          icon: Icon(
                            isShowPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen(),
                              ),
                            );
                          },
                          child: Text(
                            textAlign: TextAlign.right,
                            "Forgot password",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.themeColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),

                    Center(
                      child: Visibility(
                        visible: isLoggedInUserIsProgress == false,
                        replacement: Center(child: CircularProgressIndicator()),
                        child: ElevatedButton(
                          onPressed: () {
                            _onTapLoginButton();
                          },
                          child: Text(
                            "Log-In",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Center(
                      child: Column(
                        children: [
                          Text("or", style: TextStyle(fontSize: 24)),
                          Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: SizedBox(
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: Image(
                                      image: NetworkImage(
                                        "https://imgs.search.brave.com/V7sgagRATLlWoAL9kKkWlvM1Lymxxb-2sk6dz3LnYrk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy9j/L2MxL0dvb2dsZV8l/MjJHJTIyX2xvZ28u/c3Zn",
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    "Continue with google",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                text: 'Create account',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = _onTapCreateAccountText,
                              ),
                            ],
                          ),
                        ),
                      ],
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

  void _onTapLoginButton() async {
    if (_formKey.currentState!.validate()) {
      if (mounted) {
        setState(() {
          isLoggedInUserIsProgress = true;
        });
      }

      String url = "https://task.teamrabbil.com/api/v1/login";

      Map<String, dynamic> loginData = {
        "email": _emailTEController.text.trim(),
        "password": _passwordTEController.text,
      };

      NetworkResponse response = await NetworkCaller.postRequest(
        url,
        loginData,
      );

      if (mounted) {
        setState(() {
          isLoggedInUserIsProgress = false;
        });
      }


      if (response.statusCode == 200) {
        String token = response.responseData['token'];

        await AuthController.saveUserAccessToken(token);

        _emailTEController.clear();
        _passwordTEController.clear();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainBottomNavScreen()),
        );
        snackBar(context, "Logged-In Successfully");
      } else {
        snackBar(context, "email/password Invalid");
      }
    }
  }

  void _onTapCreateAccountText() {
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUpScreen()),
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }
}
