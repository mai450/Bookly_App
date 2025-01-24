import 'package:bookly/Features/Home/data/models/books_model/books_model.dart';
import 'package:bookly/Features/Home/data/repos/home_repo.dart';
import 'package:bookly/core/errors/errors.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation({required this.apiService});

  @override
  Future<Either<Failure, List<BooksModel>>> fetchAllBooks() async {
    try {
      var data = await apiService.getAllBooks(
          endPoint: 'volumes?Filtering=free-ebooks&q=computer science');
      List<BooksModel> books = [];
      for (var book in data['items']) {
        books.add(BooksModel.fromJson(book));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerError.fromDioException(e),
        );
      }
      return left(
        ServerError(
          errMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BooksModel>>> fetchBestSellerBooks() async {
    try {
      var data = await ApiService(dio: Dio()).getAllBooks(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=algorithm');
      List<BooksModel> books = [];
      for (var book in data['items']) {
        books.add(BooksModel.fromJson(book));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerError.fromDioException(e),
        );
      }
      return left(
        ServerError(
          errMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BooksModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await ApiService(dio: Dio()).getAllBooks(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming');
      List<BooksModel> books = [];
      for (var book in data['items']) {
        books.add(BooksModel.fromJson(book));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerError.fromDioException(e),
        );
      }
      return left(
        ServerError(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
