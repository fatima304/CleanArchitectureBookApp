import 'package:clean_bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
  Future<Either<Failure, List<BookEntity>>> fetchRelevenceBooks();
}
