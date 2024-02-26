import 'package:flix_id/domain/use_cases/get_actors/get_actors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/movie_repository/movie_repository_provider.dart';

part 'get_actors_provider.g.dart';

@riverpod
GetActors getActors(GetActorsRef ref) =>
    GetActors(movieRepository: ref.watch(movieRepositoryProvider));
