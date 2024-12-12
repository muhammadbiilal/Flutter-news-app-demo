import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:news_app_demo/models/catergory_news_model.dart';
import 'package:news_app_demo/models/news_channel_headlines_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi(
      String channelName) async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=$channelName&apiKey=a4d5cb3aa88b44a3860b1f60b417837e';

    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return NewsChannelHeadlinesModel.fromJson(body);
    }
    throw Exception('Error');
  }

  Future<CategoryNewsModel> fetchCategoriesNewsApi(String category) async {
    String url =
        'https://newsapi.org/v2/everything?q=$category&apiKey=a4d5cb3aa88b44a3860b1f60b417837e';
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return CategoryNewsModel.fromJson(body);
    }
    throw Exception('Error');
  }
}
