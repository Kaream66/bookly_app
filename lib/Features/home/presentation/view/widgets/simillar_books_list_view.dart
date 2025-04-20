import 'package:bookly_app/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:bookly_app/core/widgets/custom_errMessage_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimillarBooksListView extends StatelessWidget {
  const SimillarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .17,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: CustomBookImage(
                    imageUrl:
                        'https://www.orgodigital.com/wp-content/uploads/2024/11/Flutter-jpg.jpg',
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrmessageWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingWiget();
        }
      },
    );
  }
}
