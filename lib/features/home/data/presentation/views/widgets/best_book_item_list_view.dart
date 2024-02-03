import 'package:clean_bookly_app/features/home/data/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:clean_bookly_app/features/home/data/presentation/views/widgets/error_widget.dart';
import 'package:flutter/material.dart';

import 'package:clean_bookly_app/features/home/data/presentation/views/widgets/best_book_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookItemListView extends StatelessWidget {
  const BookItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              // print(state.books.length);
              return Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: NewsetBookItem(bookEntity: state.books[index]),
              );
            },
          );
        } else if (state is NewestBooksFailure) {
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
