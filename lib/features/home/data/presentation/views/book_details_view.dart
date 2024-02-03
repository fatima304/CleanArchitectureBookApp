import 'package:clean_bookly_app/features/home/data/presentation/manager/relevence_books/relevence_books_cubit.dart';
import 'package:clean_bookly_app/features/home/data/presentation/views/widgets/book_details_body.dart';
import 'package:clean_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookEntity});
  final BookEntity bookEntity;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<RelevenceBooksCubit>(context).fetchRelevenceBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsViewBody(bookEntity: widget.bookEntity),
    );
  }
}
