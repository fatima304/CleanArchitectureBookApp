import 'package:flutter/material.dart';
import 'package:clean_bookly_app/core/utlis/style.dart';
import 'package:clean_bookly_app/features/home/data/presentation/views/widgets/custom_appbar.dart';
import 'package:clean_bookly_app/features/home/data/presentation/views/widgets/newest_book_bloc_builder.dart';
import 'package:clean_bookly_app/features/home/data/presentation/views/widgets/featured_books_bloc_consumer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomAppBar(),
        ),
        SliverToBoxAdapter(
          child: FeatureBookListViewBlocConsumer(),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 16, left: 10),
            child: Text(
              'Newest Seller',
              style: Styles.textStyle20,
            ),
          ),
        ),
        SliverFillRemaining(
          child: BookItemListViewBlocBuilder(),
        ),
      ],
    );
  }
}
