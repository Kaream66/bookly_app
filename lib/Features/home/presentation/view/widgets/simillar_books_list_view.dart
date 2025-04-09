import 'package:bookly_app/Features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class SimillarBooksListView extends StatelessWidget {
  const SimillarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .17,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CustomBookImage(
              imageUrl: 'https://www.orgodigital.com/wp-content/uploads/2024/11/Flutter-jpg.jpg',
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
