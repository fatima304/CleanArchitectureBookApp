import 'package:dartz/dartz.dart';
import 'package:clean_bookly_app/core/errors/failure.dart';
import 'package:clean_bookly_app/core/errors/use_cases/use_case.dart';
import 'package:clean_bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:clean_bookly_app/features/home/domain/entities/book_entity.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) async {
    return await homeRepo.fetchFeaturedBooks(pageNumber: param);
  }
}
