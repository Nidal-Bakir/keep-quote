
import 'package:flutter/material.dart';

import '../models/quote_model.dart';
import '../database/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum UserTracker { onFavorite, onAll, onSettings }
enum UserTheme { dark, light }

class QuoteProvider extends ChangeNotifier {
  QuoteProvider() {
    getAllQuoteFromDB();
    getThemeDataFromPref();
  }

  void getThemeDataFromPref() async {
    var pref = await SharedPreferences.getInstance();
    var userTheme = pref.getInt('theme') ?? 0;
    changeTheme(UserTheme.values[userTheme]);
  }

  var userTheme = UserTheme.dark;
  var userTracker = UserTracker.onFavorite;
  var db = DataBase();
  final List<Quote> _quotes = [];
  final List<Quote> _favoriteQuotes = [];

  void getAllQuoteFromDB() async {
    _quotes.clear();
    _favoriteQuotes.clear();
    var allQuoteFromDB = await db.getAllQuote();
    _quotes.addAll(allQuoteFromDB.reversed);
    _favoriteQuotes.addAll(_quotes.where((element) => element.isFavorite));
  }

  void addQuote(Quote quote) {
    _quotes.insert(0, quote);
    db.addQuote(quote);
    notifyListeners();
  }

  List<Quote> get quotes => List.unmodifiable(_quotes);

  List<Quote> get favoriteQuotes => List.unmodifiable(_favoriteQuotes);

  void removeFromFavoriteList(int id) {
    int index = _favoriteQuotes.indexWhere((element) => element.id == id);
    if (index == -1) return;
    _favoriteQuotes.removeAt(index);
  }

  void deleteQuote(int id) {
    if (userTracker == UserTracker.onAll) {
      _quotes.removeAt(_quotes.indexWhere((element) => element.id == id));
      db.removeQuote(id);
    }
    removeFromFavoriteList(id);
    notifyListeners();
  }

  void addFavoriteQuote(Quote quote) {
    _favoriteQuotes.insert(0, quote);
    db.addToFavoriteList(quote);
    notifyListeners();
  }

  void removeFromFavoriteQuote(int id) {
    int index = _favoriteQuotes.indexWhere((element) => element.id == id);
    db.removeFromFavoriteList(_favoriteQuotes[index]);
    _favoriteQuotes.removeAt(index);
    notifyListeners();
  }

  bool isFavorite(Quote quote) {
    return _favoriteQuotes.contains(quote);
  }

  void upDateTracker(int index) {
    userTracker = UserTracker.values[index];
  }

  void changeTheme(UserTheme userTheme) async {
    this.userTheme = userTheme;
    notifyListeners();
    var pref = await SharedPreferences.getInstance();
    pref.setInt('theme', userTheme.index);
  }
}
