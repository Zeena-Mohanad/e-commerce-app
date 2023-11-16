import 'package:flutter/material.dart';

class NavigationBarProvider extends ChangeNotifier{
  int _currentTab = 0;
  List<Widget> screens = [];

  set currentTab(int tab){
    _currentTab = tab;
    notifyListeners();
  }

  int get currentTab => _currentTab;
  get currentScreen => screens[_currentTab];
  
}