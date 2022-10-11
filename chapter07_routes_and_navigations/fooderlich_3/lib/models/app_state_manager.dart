import 'dart:async';
import 'package:flutter/material.dart';

class FooderlichTab {
  static const int explore = 0;
  static const int recipe = 1;
  static const int toBuy = 2;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  bool _onboardingComplete = false;
  int _selectedTab = FooderlichTab.explore;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onboardingComplete;
  int get getSelectedTab => _selectedTab;

  void initializeApp() {
    Timer(const Duration(), () {
      _initialized = true;
      notifyListeners();
    });
  }

  void login(String username, String password) {
    _loggedIn = true;
    notifyListeners();
  }

  void completeOnBoarding() {
    _onboardingComplete = true;
    notifyListeners();
  }

  void gotoTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  void gotoRecipe() {
    _selectedTab = FooderlichTab.recipe;
    notifyListeners();
  }

  void logOut() {
    _initialized = false;
    _loggedIn = false;
    _onboardingComplete = false;
    _selectedTab = 0;
    initializeApp();
    notifyListeners();
  }
}
