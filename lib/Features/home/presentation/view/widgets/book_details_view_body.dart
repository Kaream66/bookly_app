import 'package:bookly_app/Features/home/presentation/view/widgets/book_details_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          CustomBokkDetailsAppBar(),
        ],
      ),
    );
  }
}

