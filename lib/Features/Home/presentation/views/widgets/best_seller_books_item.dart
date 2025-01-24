import 'package:bookly/Features/Home/data/models/books_model/books_model.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_image_item.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerBooksItem extends StatelessWidget {
  const BestSellerBooksItem({super.key, required this.booksModel});

  final BooksModel booksModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kBookDetailsView, extra: booksModel);
      },
      child: SizedBox(
        height: 120,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              CustomBookImage(
                imageUrl: booksModel.volumeInfo!.imageLinks?.thumbnail ??
                    'https:media.istockphoto.com/id/827247322/vector/danger-sign-vector-icon-attention-caution-illustration-business-concept-simple-flat-pictogram.jpg',
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          booksModel.volumeInfo!.title!,
                          style: AppStyle.textStyle16
                              .copyWith(fontWeight: FontWeight.w600),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Opacity(
                          opacity: 0.7,
                          child: Text(
                            booksModel.volumeInfo!.authors?[0] ?? '',
                            style: AppStyle.textStyle14.copyWith(),
                            maxLines: 1,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Free',
                        style: AppStyle.textStyle16,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
