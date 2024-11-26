// ignore_for_file: file_names, avoid_print
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class FetchImageProvider extends ChangeNotifier {
  Future<List<dynamic>?> fetchUnsplashImages() async {
    var apiKey = "qDi5RnVgODf3Jsfhw1cJ7ignoWQhjFKni4ZlfEHjdCo";
    try {
      final response = await http.get(
        Uri.parse('https://api.unsplash.com/photos/?client_id=$apiKey'),
      );
      if (response.statusCode == 200) {
        log('body : ${response.body}');
        return json.decode(response.body);
      } else {
        print('Failed to load images');
        return null;
      }
    } catch (e) {
      print('Error fetching images: $e');
      return null;
    }
  }
}
