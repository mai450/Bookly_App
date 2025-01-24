import 'package:bookly/Features/Home/data/models/books_model/books_model.dart';
import 'package:bookly/Features/Home/data/repos/home_repo_implementation.dart';
import 'package:bookly/Features/Home/presentation/manger/Similar_Books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/views/book_detials_view.dart';
import 'package:bookly/Features/Home/presentation/views/home_view.dart';
import 'package:bookly/Features/Search/data/repo/search_repo_imple.dart';
import 'package:bookly/Features/Search/presentation/manger/Search_For_Books/search_for_books_cubit.dart';
import 'package:bookly/Features/Search/presentation/views/search_view.dart';
import 'package:bookly/Features/Splash/presentation/views/splash_view.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => HomeView(),
    ),
    GoRoute(
      path: kBookDetailsView,
      builder: (context, state) => BlocProvider(
        create: (context) =>
            SimilarBooksCubit(getIt.get<HomeRepoImplementation>()),
        child: BookDetialsView(
          booksModel: state.extra as BooksModel,
        ),
      ),
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => BlocProvider(
        create: (context) => SearchForBooksCubit(getIt.get<SearchRepoImple>()),
        child: SearchView(
            //booksModel: state.extra as BooksModel,
            ),
      ),
    ),
  ]);
}
