import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit(this.homeRepo) : super(SearchResultInitial());

   final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(SearchResultLoading());
    var result = await homeRepo.fetchNewestBooks();
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
