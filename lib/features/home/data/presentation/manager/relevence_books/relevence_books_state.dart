part of 'relevence_books_cubit.dart';

class RelevenceBooksState {
  const RelevenceBooksState();
}

class RelevenceBooksInitial extends RelevenceBooksState {}

class RelevenceBooksLoading extends RelevenceBooksState {}

class RelevenceBooksPaginationLoading extends RelevenceBooksState {}

class RelevenceBooksPaginationFailure extends RelevenceBooksState {
  final String errorMessage;

  RelevenceBooksPaginationFailure(this.errorMessage);
}

class RelevenceBooksSuccess extends RelevenceBooksState {
  final List<BookEntity> books;

  RelevenceBooksSuccess(this.books);
}

class RelevenceBooksFailure extends RelevenceBooksState {
  final String errorMessage;

  RelevenceBooksFailure(this.errorMessage);
}
