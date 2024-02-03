import 'package:hive/hive.dart';
import 'package:clean_bookly_app/core/utlis/constance.dart';
import 'package:clean_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_bookly_app/features/home/data/data_sources/local_data_source/home_local_data_source.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kFeaturesBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
   @override
  List<BookEntity> fetchRelevenceBooks() {
    var box = Hive.box<BookEntity>(kRelevenceBox);
    return box.values.toList();
  }
}
