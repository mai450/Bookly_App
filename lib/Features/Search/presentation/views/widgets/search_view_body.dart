import 'package:bookly/Features/Search/presentation/manger/Search_For_Books/search_for_books_cubit.dart';
import 'package:bookly/Features/Search/presentation/views/widgets/custom_text_field.dart';
import 'package:bookly/Features/Search/presentation/views/widgets/search_result_list_view.dart';
import 'package:bookly/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onSubmitted: (value) {
              if (value.trim().isNotEmpty) {
                BlocProvider.of<SearchForBooksCubit>(context)
                    .searchForBook(searchText: value);
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Search Result',
            style: AppStyle.textStyle16,
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}
