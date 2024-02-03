import 'package:clean_bookly_app/core/utlis/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start, 
  });
  // final int count;
  // final int rating;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            FontAwesomeIcons.solidStar,
            color: Color(0xffffdd4f),
            size: 15,
          ),
          const SizedBox(
            width: 6.3,
          ),
          Text(
            '4.8',
            style: Styles.textStyle18.copyWith(fontSize: 18),
          ),
          const SizedBox(
            width: 5,
          ),
          const Opacity(
            opacity: 0.5,
            child: Text(
              '(2390)',
              style: Styles.textStyle16,
            ),
          ),
        ],
      ),
    );
  }
}
