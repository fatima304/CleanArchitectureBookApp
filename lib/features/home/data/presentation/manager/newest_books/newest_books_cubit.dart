import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_bookly_app/features/home/use_cases/fetch_newest_books_use_case.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> newestBooks() async {
    emit(
      NewestBooksLoading(),
    );
    var result = await fetchNewestBooksUseCase.call();
    result.fold(
      (failure) {
        emit(
          NewestBooksFailure(
            failure.errorMessage,
          ),
        );
      },
      (books) {
        emit(
          NewestBooksSuccess(
            books,
          ),
        );
      },
    );
  }
}
