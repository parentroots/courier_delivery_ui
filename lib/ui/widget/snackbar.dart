
import 'package:flutter/material.dart';

void snackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating,

      backgroundColor: Colors.black.withOpacity(0.4), // transparent feel
      margin: const EdgeInsets.only(
        top: 20,
        left: 16,
        right: 16,
      ),
      elevation: 0,
      duration: const Duration(seconds: 2),
    ),
  );
}
