import 'package:flix_id/data/repository/movie_repository.dart';
import 'package:flix_id/domain/use_cases/get_movie_list/get_movie_list_param.dart';
import 'package:flix_id/domain/use_cases/use_case.dart';
import '../../entities/movie.dart';
import '../../entities/result.dart';

class GetMovieList implements UseCase<Result<List<Movie>>, GetMovieListParam> {
  final MovieRepository _movieRepository;

  GetMovieList({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<List<Movie>>> call(GetMovieListParam params) async {
    var movieResult = switch (params.category) {
      MovieListCategories.nowPlaying =>
        await _movieRepository.getNowPlaying(page: params.page),
      MovieListCategories.upcoming =>
        await _movieRepository.getUpcoming(page: params.page),
    };

    return switch (movieResult) {
      Success(value: final movies) => Result.success(movies),
      Failed(:final message) => Result.failed(message)
    };
  }
}
