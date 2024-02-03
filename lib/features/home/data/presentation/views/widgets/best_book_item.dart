import 'package:clean_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:clean_bookly_app/core/utlis/style.dart';
import 'package:clean_bookly_app/core/utlis/constance.dart';
import 'package:clean_bookly_app/core/utlis/app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsetBookItem extends StatelessWidget {
  const NewsetBookItem({
    super.key,
    required this.bookEntity,
  });

  // final BookModel bookModel;
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                20,
              ),
              child: AspectRatio(
                aspectRatio: 2.3 / 4,
                child: CachedNetworkImage(
                  imageUrl: bookEntity.image ??
                      'https://www.neelwafurat.com/images/eg/abookstore/covers/carton/188/188651.jpg',
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.access_alarm_outlined),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookEntity.title,
                      style: Styles.textStyle20
                          .copyWith(fontFamily: kGsectraFine, fontSize: 19),
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    bookEntity.autherName ?? 'Atef Mansour',
                    style: Styles.textStyle14,
                  ),
                  const Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Free',
                          style: Styles.textStyle18,
                        ),
                        Spacer(),
                        //  RatingWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
