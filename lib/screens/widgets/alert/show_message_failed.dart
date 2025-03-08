import 'package:flutter/material.dart';

void showFailedMessage(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_rounded,
          color: Colors.white,
          size: 20, 
        ),
        const SizedBox(width: 10),
        Text(
          message,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating, 
    margin: const EdgeInsets.only(
      bottom: 40.0,
      left: 20.0,
      right: 20.0, 
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
    duration: const Duration(seconds: 3), 
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
