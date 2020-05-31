import 'package:flutter/foundation.dart';

import '../models/quote_model.dart';

enum UserTracker { onFavorite, onAll, onSettings }

class QuoteProvider extends ChangeNotifier {
  var userTracker = UserTracker.onFavorite;
  final List<Quote> _quotes = [
    Quote(0, 'the man is man ', 'what ever'),
    Quote(1, '1the man is man ', 'what ever'),
    Quote(
        2,
        ' 2the man is man  so that will be the sixe bro from re the maicrica yes for sho the man is man  so that will be the sixe bro from re the maicrica yes for sho the man is man  so that will be the sixe bro from re the maicrica yes for sho the man is man  so that will be the sixe bro from re the maicrica yes for sho ',
        'what ever'),
    Quote(3, '3the man is man ', 'what ever'),
    Quote(4, '4the man is man ', 'what ever'),
    Quote(5, 'the man is man ', 'what ever'),
    Quote(6, 'the man is man ', 'what ever'),
    Quote(7, 'the man is man ', 'what ever'),
    Quote(8, 'the man is man ', 'what ever'),
  ];
  final List<Quote> _favoriteQuotes = [
    Quote(1, '1the man is man ', 'what ever'),
    Quote(2, '2the man is man ', 'what ever'),
    Quote(3, '3the man is man ', 'what ever'),
    Quote(4, '4the man is man ', 'what ever'),
  ];

  void addQuote(Quote quote) {
    _quotes.insert(0, quote);
    notifyListeners();
  }

  List<Quote> get quotes => List.unmodifiable(_quotes);

  List<Quote> get favoriteQuotes => List.unmodifiable(_favoriteQuotes);

  void deleteQuote(int id) {
    if (userTracker == UserTracker.onFavorite) {
      _favoriteQuotes
          .removeAt(_favoriteQuotes.indexWhere((element) => element.id == id));
    } else if (userTracker == UserTracker.onAll) {
      _quotes.removeAt(_quotes.firstWhere((element) => element.id == id).id);
    } else {
      print('the user can not do this!!');
      return;
    }
    notifyListeners();
  }

  void addFavoriteQuote(Quote quote) {
    _favoriteQuotes.insert(0, quote);

    notifyListeners();
  }
  void removeFromFavoriteQuote(int id) {
    _favoriteQuotes
        .removeAt(_favoriteQuotes.indexWhere((element) => element.id == id));
    notifyListeners();
  }
  bool isFavorite(Quote quote) {
    return _favoriteQuotes.contains(quote);
  }

  void upDateTracker(int index) {
    userTracker = UserTracker.values[index];
  }
}
