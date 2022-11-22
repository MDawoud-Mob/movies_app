import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMovisRepository baseMovisRepository;
  GetPopularMoviesUseCase(this.baseMovisRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovisRepository.getPopularMovies();
  }
}
