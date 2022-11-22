part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState moveDetailsState;
  final String movieDetailsmessage;
  final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String recommendationmessage;
  const MovieDetailsState(
      {this.movieDetail,
      this.moveDetailsState = RequestState.loading,
      this.movieDetailsmessage = '',
      this.recommendation = const [],
      this.recommendationState = RequestState.loading,
      this.recommendationmessage = ''});
  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? moveDetailsState,
    String? movieDetailsmessage,
    List<Recommendation>? recommendation,
    RequestState? recommendationState,
    String? recommendationmessage,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      moveDetailsState: moveDetailsState ?? this.moveDetailsState,
      movieDetailsmessage: movieDetailsmessage ?? this.movieDetailsmessage,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationmessage:
          recommendationmessage ?? this.recommendationmessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetail,
        moveDetailsState,
        movieDetailsmessage,
        recommendation,
        recommendationState,
        recommendationmessage
      ];
}
