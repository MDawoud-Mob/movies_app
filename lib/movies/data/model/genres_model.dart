import 'package:movies_app/movies/domain/entities/genres.dart';

class GenersModel extends Genres {
  const GenersModel({required super.name, required super.id});
  factory GenersModel.fromJson(Map<String, dynamic> json) {
    return GenersModel(name: json['name'], id: json['id']);
  }
}
