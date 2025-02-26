import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  List<int> _selectedIndex = [];

  List<int> get selectedIndex => _selectedIndex;

  void addItem(int index) {
    _selectedIndex.add(index);
    notifyListeners();
  }

  void removeItem(int index) {
    _selectedIndex.remove(index);
    notifyListeners();
  }
}
