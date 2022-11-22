import 'package:movies_app/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({super.backdropPath, required super.id});
  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
        backdropPath:
            json['backdrop_path'] ?? '/ySHlkHDbXztjdjRJ0pZN7FXRnaW.jpg',
        id: json['id']);
  }
}
