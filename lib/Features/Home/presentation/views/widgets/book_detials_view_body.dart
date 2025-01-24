import 'package:bookly/Features/Home/data/models/books_model/books_model.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/books_detials_section.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_app_bar_detials.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetialsViewBody extends StatelessWidget {
  const BookDetialsViewBody({super.key, required this.booksModel});
  final BooksModel booksModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, top: 20, bottom: 20),
      child: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: CustomAppBarDetials(),
              ),
              BooksDetialsSection(
                booksModel: booksModel,
              ),
              Expanded(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SimilarBooksSection(),
            ],
          ),
        ),
      ]),
    );
  }
}
