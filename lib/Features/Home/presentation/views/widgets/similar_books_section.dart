import 'package:bookly/Features/Home/presentation/views/widgets/books_list_view_in_detial_view.dart';
import 'package:bookly/core/utils/app_style.dart';
import 'package:flutter/cupertino.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: AppStyle.textStyle16,
        ),
        SizedBox(
          height: 15,
        ),
        BooksListViewInDetialView()
      ],
    );
  }
}
