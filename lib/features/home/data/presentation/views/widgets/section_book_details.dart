import 'package:clean_bookly_app/core/utlis/constance.dart';
import 'package:clean_bookly_app/core/utlis/style.dart';
import 'package:clean_bookly_app/core/utlis/widgets/button_action.dart';
import 'package:clean_bookly_app/features/home/data/presentation/views/widgets/feature_book_item.dart';
import 'package:clean_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class DetailsBookSection extends StatelessWidget {
  const DetailsBookSection({
    super.key,
    required this.bookEntity,
  });
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.25),
          child: FeatureBookItem(
            imageUrl: bookEntity.image ?? '',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          bookEntity.title,
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(
            fontFamily: kGsectraFine,
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookEntity.autherName?? 'عاطف منصور',
            style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        // const RatingWidget(
        //   mainAxisAlignment: MainAxisAlignment.center,
        // ),
        const SizedBox(
          height: 18,
        ),
        const BookAction(),
      ],
    );
  }
}
