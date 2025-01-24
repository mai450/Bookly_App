import 'package:bookly/Features/Home/presentation/manger/All_Books_Cubit/all_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/books_list_view_item.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_image_item.dart';
import 'package:bookly/core/widgets/custom_error_message.dart';
import 'package:bookly/core/widgets/custom_loading_indcator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class BooksHorizontalListView extends StatefulWidget {
  const BooksHorizontalListView({super.key});

  @override
  State<BooksHorizontalListView> createState() =>
      _BooksHorizontalListViewState();
}

class _BooksHorizontalListViewState extends State<BooksHorizontalListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllBooksCubit, AllBooksState>(
      builder: (context, state) {
        if (state is AllBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kBookDetailsView,
                              extra: state.books[index]);
                        },
                        child: CustomBookImage(
                          imageUrl: state.books[index].volumeInfo!.imageLinks!
                                  .thumbnail ??
                              'https://media.istockphoto.com/id/827247322/vector/danger-sign-vector-icon-attention-caution-illustration-business-concept-simple-flat-pictogram.jpg',
                        )));
              },
            ),
          );
        } else if (state is AllBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
