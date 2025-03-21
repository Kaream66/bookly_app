import 'package:bookly_app/Features/home/presentation/view/widgets/book_details_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/view/widgets/book_details_section.dart';
import 'package:bookly_app/Features/home/presentation/view/widgets/similar_book_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                CustomBokkDetailsAppBar(),
                BookDetailsSection(),
                Expanded(
                  child: SizedBox(
                    height: 40,
                  ),
                ),
                SimilarBookSection(),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
