import 'package:flutter/material.dart';
import 'package:clean_bookly_app/core/utlis/style.dart';
import 'package:clean_bookly_app/features/home/data/presentation/views/widgets/small_book_listview.dart';

class SimiralBookSection extends StatelessWidget {
  const SimiralBookSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'You can also like',
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const SmallBookListView(),
      ],
    );
  }
}
