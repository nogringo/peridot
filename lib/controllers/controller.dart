import 'package:flutter/foundation.dart';

class Controller extends ChangeNotifier {
  bool _isDisposed = false;

  // Async callbacks (relay responses, delayed resets) may land after dispose.
  void update() {
    if (!_isDisposed) notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
