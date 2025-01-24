import 'package:bookly/Features/Home/data/repos/home_repo_implementation.dart';
import 'package:bookly/Features/Search/data/repo/search_repo_imple.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<HomeRepoImplementation>(
      HomeRepoImplementation(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<SearchRepoImple>(
      SearchRepoImple(apiService: getIt.get<ApiService>()));
}
