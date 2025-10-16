import 'package:flutter/material.dart';
import 'package:foodi_go/utilities/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

String selected = "User";

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Create Account",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Join us to explore top Canadian-made products, exclusive deals, and great rewards",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Select Your Role",
                  style: TextStyle(color: AppColors.greyColor, fontSize: 24),
                ),
                SizedBox(height: 20),

                buildRoleSection(),

                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: _buildUserTextField(context),
                ),

                
                Wrap(
                  children: [
                    Checkbox(
                      activeColor: AppColors.themeColor,
                      value: true,
                      onChanged: (_) {},
                    ),
                    RichText(text: TextSpan(
                        style: TextStyle(
                          color: AppColors.greyColor
                        ),
                        text: "i agree to other ",children: [
                      TextSpan(text: "Terms and condition ",style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 18
                      )),
                      TextSpan(text: "and",style: TextStyle(
                        color: AppColors.greyColor
                      )),
                      TextSpan(text: " privacy policy",style: TextStyle(
                        color: AppColors.blackColor
                      )),
                    ]),)

                  ],
                ),

                SizedBox(height: 15,),
                ElevatedButton(onPressed: (){}, child: Text("Continue",style: TextStyle(
                  color: Colors.white
                ),),
                ),
                SizedBox(height: 8,),
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
                SizedBox(height: 10,),
                RichText(text: TextSpan(
                  style: TextStyle(
                    color:AppColors.blackColor
                  ),
                    text: "Already have an account ?",children: [
                  TextSpan(text: "Sign-In",style: TextStyle(
                    color: AppColors.themeColor
                  ))
                ]),),

                SizedBox(height: 20,)
                
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildRoleSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 50,
          width: 120,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: selected == "User"
                  ? AppColors.themeColor
                  : AppColors.whiteColor,
            ),
            onPressed: () {
              setState(() {
                selected = "User";
              });
            },
            child: Text(
              "User",
              style: TextStyle(
                color: selected == "User"
                    ? AppColors.whiteColor
                    : AppColors.blackColor,
                fontSize: 24,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          width: 120,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: selected == "Rider"
                  ? AppColors.themeColor
                  : Colors.white,
            ),
            onPressed: () {
              setState(() {
                selected = "Rider";
              });
            },
            child: Text(
              "Rider",
              style: TextStyle(
                color: selected == "Rider"
                    ? AppColors.whiteColor
                    : AppColors.blackColor,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column _buildUserTextField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text("Full Name", style: Theme.of(context).textTheme.titleMedium),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: "Enter your full name"),
        ),
        SizedBox(height: 8),

        Text("Email ", style: Theme.of(context).textTheme.titleMedium),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(hintText: "Enter your email"),
        ),
        SizedBox(height: 8),

        Text("Phone", style: Theme.of(context).textTheme.titleMedium),
        TextFormField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(hintText: "Enter your mobile"),
        ),
        SizedBox(height: 8),

        Text("Password", style: Theme.of(context).textTheme.titleMedium),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: "Enter password"),
        ),
        SizedBox(height: 8),

        Text(
          "Confirm Password",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: "Re-Enter password"),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
