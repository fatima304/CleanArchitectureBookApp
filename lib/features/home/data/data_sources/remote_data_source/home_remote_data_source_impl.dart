import 'package:clean_bookly_app/core/utlis/constance.dart';
import 'package:clean_bookly_app/core/utlis/api_service.dart';
import 'package:clean_bookly_app/core/utlis/functions/save_box_data.dart';
import 'package:clean_bookly_app/core/utlis/functions/parse_api_data.dart';
import 'package:clean_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_bookly_app/features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.getMethod(
        endPoint:
            'volumes?Filtring=full&&startIndex=${pageNumber * 10}&q=harry potter and the');
    List<BookEntity> books = getBooksList(data);
    saveData(books, kFeaturesBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.getMethod(
        endPoint:
            'volumes?Filtring=full&Sorting=newest&q= coins عاطف منصور رمضان ');
    List<BookEntity> books = getBooksList(data);
    saveData(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchReleventBooks() async {
    var data = await apiService.getMethod(
        endPoint:
            'volumes?Filtring=full&Sorting=newest&q= coins عاطف منصور رمضان ');
    List<BookEntity> books = getBooksList(data);
    saveData(books, kRelevenceBox);
    return books;
  }
}
