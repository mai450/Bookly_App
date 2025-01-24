import 'package:bloc/bloc.dart';
import 'package:bookly/Features/Home/data/models/books_model/books_model.dart';
import 'package:bookly/Features/Search/data/repo/search_repo.dart';
import 'package:bookly/core/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'search_for_books_state.dart';

class SearchForBooksCubit extends Cubit<SearchForBooksState> {
  SearchForBooksCubit(this.searchRepo) : super(SearchForBooksInitial());
  final SearchRepo searchRepo;

  Future<void> searchForBook({required String searchText}) async {
    emit(SearchForBooksLoading());
    var result = await searchRepo.fetchSearchData(searchText: searchText);
    result.fold((Failure) {
      emit(SearchForBooksFailure(errMessage: Failure.errMessage));
    }, (books) {
      emit(SearchForBooksSuccess(books: books));
    });
  }
}
