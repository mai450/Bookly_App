import 'package:bookly/Features/Home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/books_horizontal_list_view.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_app_bar_home.dart';
import 'package:bookly/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, bottom: 20, top: 30),
      child: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBarHome(),
              SizedBox(
                height: 20,
              ),
              BooksHorizontalListView(),
              SizedBox(
                height: 40,
              ),
              Text(
                'Newest Books',
                style: AppStyle.textStyle18,
              ),
            ],
          ),
        ),
        BestSellerListView(),
      ]),
    );
  }
}
