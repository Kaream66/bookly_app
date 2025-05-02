import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/search/data/repos/serach_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit( this.searchRepo) : super(SearchResultInitial());

   final SearchRepo searchRepo;

  Future<void> fetchSearchResult() async {
    emit(SearchResultLoading());
    var result = await searchRepo.fetchSearchResult();
    result.fold(
        (failure) => {
              emit(
                SearchResultFailure( errMessage: ''),
              ),
            },
        (books) => {
              emit(SearchResultSuccess(books: books)),
            });
  }
}
