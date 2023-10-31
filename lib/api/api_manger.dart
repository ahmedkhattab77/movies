import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/model/popualer/PopularRequest.dart';
import 'package:movies/model/top_rated/TopRateResponse.dart';
import 'package:movies/model/upocming/UpocmingResponse.dart';

class ApiManger {
  static const baseUrl = 'api.themoviedb.org';
  static const headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YzAzYjMwMTljMWU5NjBhZmJjZDhjZWY4M2U2N2VkYiIsInN1YiI6IjY1M2ZiZDUzY2M5NjgzMDBhZGU3ZWEzNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Cx9iPovWR1UwaN2Ja9sk_WfiKq9s5MqL8WgOJH6cED0',
    'accept': 'application/json'
  };

  Future<PopularResponse> getPopular() async {
    var url = Uri.https(baseUrl, '3/discover/movie', {
      'include_adult': 'false',
      'include_video': 'false',
      'language': 'en-US',
      'page': '1',
      'sort_by': 'popularity.desc'
    });
    var response = await http.get(
      url,
      headers: headers,
    );
    var json = jsonDecode(response.body);
    var popularResponse = PopularResponse.fromJson(json);
    return popularResponse;
  }

  Future<UpcomingResponse> getUpcoming() async {
    var url = Uri.https(baseUrl, '3/movie/upcoming', {
      'language': 'en-US',
      'page': '1',
    });
    var response = await http.get(
      url,
      headers: headers,
    );
    var json = jsonDecode(response.body);
    var upcomingResponse = UpcomingResponse.fromJson(json);
    return upcomingResponse;
  }

  Future<TopRateResponse> getTopRate() async {
    var url = Uri.https(baseUrl, '3/movie/top_rated', {
      'language': 'en-US',
      'page': '1',
    });
    var response = await http.get(
      url,
      headers: headers,
    );
    var json = jsonDecode(response.body);
    var topRateResponse = TopRateResponse.fromJson(json);
    return topRateResponse;
  }
}
