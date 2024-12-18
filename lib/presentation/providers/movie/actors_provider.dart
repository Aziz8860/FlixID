import 'package:flix_id/domain/entities/actor.dart';
import 'package:flix_id/domain/use_cases/get_actors/get_actors.dart';
import 'package:flix_id/domain/use_cases/get_actors/get_actors_param.dart';
import 'package:flix_id/presentation/providers/use_cases/get_actors_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/result.dart';

part 'actors_provider.g.dart';

@riverpod
Future<List<Actor>> actors(ActorsRef ref, {required int movieId}) async {
  GetActors getActors = ref.read(getActorsProvider);

  var actorsResult = await getActors(GetActorsParam(movieId: movieId));

  return switch (actorsResult) {
    Success(value: final actors) => actors,
    Failed(message: _) => const []
  };
}
