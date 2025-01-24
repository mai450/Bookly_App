import 'package:bookly/Features/Home/data/models/books_model/books_model.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/books_action.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_image_item.dart';
import 'package:bookly/core/utils/app_style.dart';
import 'package:flutter/cupertino.dart';

class BooksDetialsSection extends StatelessWidget {
  const BooksDetialsSection({super.key, required this.booksModel});

  final BooksModel booksModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 105, left: 75),
          child: CustomBookImage(
            imageUrl: booksModel.volumeInfo!.imageLinks?.thumbnail ??
                'https:media.istockphoto.com/id/827247322/vector/danger-sign-vector-icon-attention-caution-illustration-business-concept-simple-flat-pictogram.jpg',
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Text(
            booksModel.volumeInfo!.title!,
            textAlign: TextAlign.center,
            style: AppStyle.textStyle30.copyWith(fontSize: 25),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Opacity(
          opacity: 0.7,
          child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(
              booksModel.volumeInfo!.authors![0],
              style: AppStyle.textStyle16.copyWith(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 38),
          child: BooksAction(
            booksModel: booksModel,
          ),
        ),
      ],
    );
  }
}
