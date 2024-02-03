import 'package:clean_bookly_app/core/utlis/app_router.dart';
import 'package:clean_bookly_app/features/home/data/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:clean_bookly_app/features/home/data/presentation/views/widgets/feature_book_item.dart';
import 'package:clean_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

class FeatureBookListView extends StatefulWidget {
  const FeatureBookListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<FeatureBookListView> createState() => _FeatureBookListViewState();
}

class _FeatureBookListViewState extends State<FeatureBookListView> {
  late final ScrollController scrollController;
  var nextPage = 1;
  var isLoading = false;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollListner);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void scrollListner() {
    var currentPosition = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;

    if (currentPosition >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        BlocProvider.of<FeaturedBooksCubit>(context).featuredBooks(
          pageNumber: nextPage++,
        );
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(
                  AppRouter.kBookDetailsView,
                );
              },
              child: FeatureBookItem(
                  imageUrl: widget.books[index].image ??
                      'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.neelwafurat.com%2Fitempage.aspx%3Fid%3Degb188651-5201685%26search%3Dbooks&psig=AOvVaw1zTHoRySp7VtNZLvtp7eZx&ust=1706781709781000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCMidsL6vh4QDFQAAAAAdAAAAABAE'),
            ),
          );
        },
      ),
    );
  }
}
