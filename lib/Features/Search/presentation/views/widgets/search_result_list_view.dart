import 'package:bookly/Features/Home/presentation/views/widgets/best_seller_books_item.dart';
import 'package:bookly/Features/Search/presentation/manger/Search_For_Books/search_for_books_cubit.dart';
import 'package:bookly/core/widgets/custom_error_message.dart';
import 'package:bookly/core/widgets/custom_loading_indcator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchForBooksCubit, SearchForBooksState>(
      builder: (context, state) {
        if (state is SearchForBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: BestSellerBooksItem(
                  booksModel: state.books[index],
                ),
                //child: Text('data'),
              );
            },
          );
        } else if (state is SearchForBooksInitial) {
          return Center(child: Text('No search result'));
        } else if (state is SearchForBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
