import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const  ProfileScreen({super.key});

  @override
  State< ProfileScreen> createState() => _PersonState();
}

class _PersonState extends State< ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("I am Person"),
      ),
    );
  }
}
