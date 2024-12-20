import 'package:flutter/material.dart';

class PhotoProvider with ChangeNotifier {
  List<dynamic> _images = [];

  List<dynamic> get images {
    return _images;
  }

  void loadPhotos(List<dynamic> photos) {
    _images = photos;
    notifyListeners();
  }
}
