import 'package:bookly_app/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/view/widgets/book_list_view_item.dart';
import 'package:bookly_app/core/widgets/custom_errMessage_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: BookListViewItem(
                    bookModel: state.books[index],
                  ),
                );
              },
              itemCount: state.books.length,
            ),
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrmessageWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingWiget();
        }
      },
    );
  }
}
