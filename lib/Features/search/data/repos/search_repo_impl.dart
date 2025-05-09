import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/search/data/repos/serach_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl( this.apiService);

  @override
 Future<Either<Failure, List<BookModel>>> fetchSearchResult() async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=computer scince&Sorting=newest',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(
            BookModel.fromJson(item),
          );
        } catch (e) {
          books.add(
            BookModel.fromJson(item),
          );
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
