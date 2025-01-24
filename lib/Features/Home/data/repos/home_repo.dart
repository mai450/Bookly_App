import 'package:bookly/Features/Home/data/models/books_model/books_model.dart';
import 'package:bookly/core/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BooksModel>>> fetchAllBooks();
  Future<Either<Failure, List<BooksModel>>> fetchBestSellerBooks();
  Future<Either<Failure, List<BooksModel>>> fetchSimilarBooks(
      {required String category});
}
