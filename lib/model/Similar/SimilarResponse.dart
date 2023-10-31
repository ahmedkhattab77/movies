import '../Results.dart';

class SimilarResponse {
  SimilarResponse(
      {this.page,
      this.results,
      this.totalPages,
      this.totalResults,
      this.success,
      this.status_message,
      this.status_code});

  SimilarResponse.fromJson(dynamic json) {
    status_code = json['status_code'];
    status_message = json['status_message'];
    success = json['success'];
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  int? status_code;
  String? status_message;
  bool? success;
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  SimilarResponse copyWith({
    int? page,
    List<Results>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      SimilarResponse(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
