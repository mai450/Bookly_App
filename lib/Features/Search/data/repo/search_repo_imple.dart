import 'package:bookly/Features/Home/data/models/books_model/books_model.dart';
import 'package:bookly/Features/Search/data/repo/search_repo.dart';
import 'package:bookly/core/errors/errors.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImple implements SearchRepo {
  final ApiService apiService;

  SearchRepoImple({required this.apiService});
  @override
  Future<Either<Failure, List<BooksModel>>> fetchSearchData(
      {required String searchText}) async {
    try {
      var data = await apiService.getAllBooks(
          endPoint: 'volumes?q=subject:$searchText');

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
