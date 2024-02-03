import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'book_entity.g.dart';
@HiveType(typeId:0)

class BookEntity {
  @HiveField(0)
  final String? image;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String bookId;
  @HiveField(3)
  final String? autherName;

  BookEntity({
    required this.image,
    required this.title,
    required this.bookId,
    required this.autherName,
  });
}
