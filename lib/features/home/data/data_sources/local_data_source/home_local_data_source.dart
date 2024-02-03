import 'package:clean_bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks();
    List<BookEntity> fetchRelevenceBooks();

}
