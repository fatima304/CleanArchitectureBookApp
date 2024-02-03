import 'package:clean_bookly_app/core/utlis/style.dart';
import 'package:flutter/material.dart';

class WidgetError extends StatelessWidget {
  const WidgetError({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: Styles.textStyle18,
      ),
    );
  }
}
