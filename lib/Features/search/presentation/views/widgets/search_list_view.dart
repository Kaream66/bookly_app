import 'package:bookly_app/Features/search/presentation/manager/cubits/searc_cubit/search_result_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/search_result_list_view_item.dart';
import 'package:bookly_app/core/widgets/custom_errMessage_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultCubit, SearchResultState>(
        builder: (context, state) {
      if (state is SearchResultSuccess) {
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SearchResultListViewItem(bookModel: state.books[index]),
              );
            });
      } else if (state is SearchResultFailure) {
        return CustomErrmessageWidget(errMessage: state.errMessage);
      } else {
        return const CustomLoadingWiget();
      }
    });
  }
}
