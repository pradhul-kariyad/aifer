// ignore_for_file: file_names
import 'package:flutter/material.dart';

class PhotoProvider with ChangeNotifier {
  String? _thumbUrl;
  String? _fullUrl;
  String? _description;

  String? get thumbUrl {
    return _thumbUrl;
  }

  String? get fullUrl {
    return _fullUrl;
  }

  String? get description {
    return _description;
  }

  void loadPhoto(Map<String, dynamic> json) {
    _thumbUrl = json['urls']?['thumb'];
    _fullUrl = json['urls']?['full'];
    _description = json['description'];
    notifyListeners();
  }
}
