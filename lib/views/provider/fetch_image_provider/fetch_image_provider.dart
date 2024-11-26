// ignore_for_file: file_names, avoid_print, unused_local_variable
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class FetchImageProvider extends ChangeNotifier {
  Future<List<dynamic>?> fetchUnsplashImages() async {
    var apiKey = "qDi5RnVgODf3Jsfhw1cJ7ignoWQhjFKni4ZlfEHjdCo";
    var id = 679982;
    try {
      final response = await http.get(
        Uri.parse('https://api.unsplash.com/photos/?client_id=$apiKey'),
        // headers: {"Authorization": "$id $apiKey"}
      );
      if (response.statusCode == 200) {
        log('body : ${response.body}');
        return json.decode(response.body);
      } else {
        log('Failed to load images');
        return null;
      }
    } catch (e) {
      log('Error: $e');
      return null;
    }
  }
}
