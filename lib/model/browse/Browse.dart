import 'Genres.dart';

class BrowseResponse {
  List<Genres>? genres;
  int? status_code;
  String? status_message;
  bool? success;

  BrowseResponse({
    this.status_message,
    this.success,
    this.status_code,
    this.genres,
  });

  BrowseResponse.fromJson(dynamic json) {
    status_code = json['status_code'];
    status_message = json['status_message'];
    success = json['success'];
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
