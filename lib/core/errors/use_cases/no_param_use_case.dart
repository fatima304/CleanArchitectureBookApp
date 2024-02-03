import 'package:dartz/dartz.dart';
import 'package:clean_bookly_app/core/errors/failure.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}
