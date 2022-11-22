import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rating_movies_usecase.dart';
import 'package:movies_app/movies/persentation/controller/bloc/movie_details_bloc.dart';
import 'package:movies_app/movies/persentation/controller/movies_bloc.dart';

GetIt sl = GetIt.instance;

class ServicesLocator {
  static void init() {
    //// Bloc
    sl.registerFactory(() => MoviesBloc(
          sl(),
          sl(),
          sl(),
        ));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));
    // UseCase
    sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatingMoviesUsacase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
    //// Reposiyory
    sl.registerLazySingleton<BaseMovisRepository>(() => MoviesRepository(sl()));

    /// DataSources
    sl.registerLazySingleton<BaseMovieRemoteDtatSource>(
        () => MovieRemoteDtatSource());
  }
}
