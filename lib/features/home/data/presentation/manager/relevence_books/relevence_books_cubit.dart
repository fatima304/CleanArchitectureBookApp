import 'package:clean_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_bookly_app/features/home/use_cases/relevence_bboks_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'relevence_books_state.dart';

class RelevenceBooksCubit extends Cubit<RelevenceBooksState> {
  RelevenceBooksCubit(this.fetchRelevenceBooksUseCase)
      : super(RelevenceBooksInitial());

  final FetchRelevenceBooksUseCase fetchRelevenceBooksUseCase;
  Future<void> fetchRelevenceBooks() async {
    emit(
      RelevenceBooksLoading(),
    );
    var result = await fetchRelevenceBooksUseCase.call();
    result.fold(
      (failure) {
        emit(
          RelevenceBooksFailure(
            failure.errorMessage,
          ),
        );
      },
      (books) {
        emit(
          RelevenceBooksSuccess(
            books,
          ),
        );
      },
    );
  }
}