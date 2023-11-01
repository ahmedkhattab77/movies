import 'Genres.dart';

class BrowseResponse {
  List<Genres>? genres;

  BrowseResponse({
    this.genres,
  });

  BrowseResponse.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
  }

  BrowseResponse copyWith({
    List<Genres>? genres,
  }) =>
      BrowseResponse(
        genres: genres ?? this.genres,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
