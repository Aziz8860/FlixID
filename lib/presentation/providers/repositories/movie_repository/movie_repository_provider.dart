import 'package:flix_id/data/repository/movie_repository.dart';
import 'package:flix_id/data/tmdb/tmdb_movie_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_repository_provider.g.dart';

@riverpod
MovieRepository movieRepository(MovieRepositoryRef ref) =>
    TmdbMovieRepository();
