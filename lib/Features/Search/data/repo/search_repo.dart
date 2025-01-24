import 'package:bookly/Features/Home/data/models/books_model/books_model.dart';
import 'package:bookly/core/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BooksModel>>> fetchSearchData(
      {required String searchText});
}
