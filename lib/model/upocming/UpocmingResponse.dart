import '../Results.dart';
import 'Dates.dart';

class UpcomingResponse {
  Dates? dates;
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;
  int? status_code;
  String? status_message;
  bool? success;

  UpcomingResponse({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
    this.status_code,
    this.status_message,
    this.success,
  });

  UpcomingResponse.fromJson(dynamic json) {
    status_code = json['status_code'];
    status_message = json['status_message'];
    success = json['success'];
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
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

  UpcomingResponse copyWith({
    Dates? dates,
    int? page,
    List<Results>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      UpcomingResponse(
        dates: dates ?? this.dates,
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dates != null) {
      map['dates'] = dates?.toJson();
    }
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
