import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUsecase
    extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMovisRepository baseMovisRepository;
  GetNowPlayingMoviesUsecase(this.baseMovisRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovisRepository.getNowPlayingMovies();
  }
}
