import 'package:flutter/material.dart';

class OnBoardNotifier extends ChangeNotifier {
  bool _isLastPage = false;
  int _isFirstPage = 0;

  bool get isLastPage => _isLastPage;
  int get isFirstPage => _isFirstPage;

  set isLastPage(bool lastpage) {
    _isLastPage = lastpage;
    notifyListeners();
  }

  set isFirstPage(int firstpage) {
    _isFirstPage = firstpage;
    notifyListeners();
  }
}
