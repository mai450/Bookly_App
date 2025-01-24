part of 'search_for_books_cubit.dart';

sealed class SearchForBooksState extends Equatable {
  const SearchForBooksState();

  @override
  List<Object> get props => [];
}

final class SearchForBooksInitial extends SearchForBooksState {}

final class SearchForBooksLoading extends SearchForBooksState {}

final class SearchForBooksSuccess extends SearchForBooksState {
  final List<BooksModel> books;

  const SearchForBooksSuccess({required this.books});
}

final class SearchForBooksFailure extends SearchForBooksState {
  final String errMessage;

  const SearchForBooksFailure({required this.errMessage});
}
