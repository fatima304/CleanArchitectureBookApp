import 'package:clean_bookly_app/core/utlis/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.color,
      required this.radius,
      required this.textcolor,
      this.onPressed});

  final String text;
  final Color color;
  final Color textcolor;
  final BorderRadius radius;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Styles.textStyle18.copyWith(
          color: textcolor,
        ),
      ),
    );
  }
}
