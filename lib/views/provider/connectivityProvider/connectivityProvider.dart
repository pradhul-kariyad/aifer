// ignore_for_file: file_names
import 'package:flutter/foundation.dart';

class ConnectivityProvider extends ChangeNotifier {
  bool _isConnected = true;

  bool get isConnected {
    return _isConnected;
  }

  set isConnected(bool value) {
    _isConnected = value;
    notifyListeners();
  }
}
