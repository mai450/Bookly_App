import 'package:bookly/Features/Home/data/models/books_model/books_model.dart';
import 'package:bookly/Features/Home/presentation/manger/Similar_Books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_detials_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetialsView extends StatefulWidget {
  const BookDetialsView({super.key, required this.booksModel});
  final BooksModel booksModel;
  @override
  State<BookDetialsView> createState() => _BookDetialsViewState();
}

class _BookDetialsViewState extends State<BookDetialsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context).getSimilarBooks(
        category: widget.booksModel.volumeInfo!.categories![0]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BookDetialsViewBody(
          booksModel: widget.booksModel,
        ),
      ),
    );
  }
}
