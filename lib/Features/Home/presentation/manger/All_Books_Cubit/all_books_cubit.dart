import 'package:bloc/bloc.dart';
import 'package:bookly/Features/Home/data/models/books_model/books_model.dart';
import 'package:bookly/Features/Home/data/repos/home_repo.dart';
import 'package:bookly/Features/Home/data/repos/home_repo_implementation.dart';
import 'package:bookly/core/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'all_books_state.dart';

class AllBooksCubit extends Cubit<AllBooksState> {
  AllBooksCubit(this.homeRepo) : super(AllBooksInitial());
  final HomeRepo homeRepo;
  Future<void> getAllBooks() async {
    emit(AllBooksLoading());
    var result = await homeRepo.fetchAllBooks();
    result.fold((Failure) {
      emit(AllBooksFailure(errMessage: Failure.errMessage));
    }, (books) {
      emit(AllBooksSuccess(books: books));
    });
  }
}
