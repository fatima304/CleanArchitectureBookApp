import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_bookly_app/core/utlis/functions/error.dart';
import 'package:clean_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_bookly_app/features/home/data/presentation/views/widgets/error_widget.dart';
import 'package:clean_bookly_app/features/home/data/presentation/views/widgets/feature_book_list_view.dart';
import 'package:clean_bookly_app/features/home/data/presentation/manager/featured_books/featured_books_cubit.dart';

class FeatureBookListViewBlocConsumer extends StatefulWidget {
  const FeatureBookListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeatureBookListViewBlocConsumer> createState() =>
      _FeatureBookListViewBlocConsumerState();
}

class _FeatureBookListViewBlocConsumerState
    extends State<FeatureBookListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(errorSnackBar(state.errorMessage));
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeatureBookListView(
            books: books,
          );
        } else if (state is FeaturedBooksFailure) {
          return WidgetError(errorMessage: state.errorMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
