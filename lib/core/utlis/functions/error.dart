import 'package:flutter/material.dart';

 errorSnackBar(String error) {
  SnackBar(
    backgroundColor: Colors.red,
    content: Text(
      error,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 3),
  );
}
