import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/untils/enums.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';

import 'package:movies_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rating_movies_usecase.dart';
import 'package:movies_app/movies/persentation/controller/movies_event.dart';
import 'package:movies_app/movies/persentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatingMoviesUsacase getTopRatingMoviesUsacase;
  MoviesBloc(this.getNowPlayingMoviesUsecase, this.getPopularMoviesUseCase,
      this.getTopRatingMoviesUsacase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result =
          await getNowPlayingMoviesUsecase.call(const NoParameters());

      result.fold(
          (l) => emit(state.copyWith(
                nowPlayingState: RequestState.error,
                nowPlayingMessage: l.message,
              )),
          (r) => emit(state.copyWith(
                nowPlaingMovies: r,
                nowPlayingState: RequestState.loaded,
              )));
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase.call(const NoParameters());

      result.fold(
          (l) => emit(state.copyWith(
                popularState: RequestState.error,
                popularMessage: l.message,
              )),
          (r) => emit(state.copyWith(
                popularMovies: r,
                popularState: RequestState.loaded,
              )));
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatingMoviesUsacase.call(const NoParameters());

      result.fold(
          (l) => emit(state.copyWith(
                topRatedState: RequestState.error,
                topRatedMessage: l.message,
              )),
          (r) => emit(state.copyWith(
                topRatedMovies: r,
                topRatedState: RequestState.loaded,
              )));
    });
  }
}
