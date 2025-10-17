
import 'package:flutter/material.dart';
import 'package:foodi_go/data/controller/auth_controller.dart';
import 'package:foodi_go/ui/screens/auth_screens/sign_in_screen.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Column(children: [
        CircleAvatar(child: Icon(Icons.person),)
      ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("HI ,I am Ibrahim",style: TextStyle(
              fontSize: 16
          ),),
          Row(
            children: [
              Icon(Icons.location_on),
              Text("Barguna",style: TextStyle(
                  fontSize: 12
              ),)
            ],
          )
        ],),

      actions: [
        Icon(Icons.notifications_active),
        IconButton(onPressed: (){
          AuthController.clearUserData();

          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SignInScreen()),(route)=>false);
        }, icon: Icon(Icons.logout)),
        SizedBox(width: 10,)

      ],
    );
  }
}
