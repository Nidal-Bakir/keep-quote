import 'dart:ffi';

import 'package:flutter/foundation.dart';

import '../models/quote_model.dart';

class QuoteProvider extends ChangeNotifier {
  final List<Quote> _quotes = [
    Quote(
        DateTime.now().millisecondsSinceEpoch,
        ' the man is man  so that will be the sixe bro from re the maicrica yes for sho the man is man  so that will be the sixe bro from re the maicrica yes for sho the man is man  so that will be the sixe bro from re the maicrica yes for sho the man is man  so that will be the sixe bro from re the maicrica yes for sho ',
        'what ever'),
    Quote(
        DateTime.now().millisecondsSinceEpoch, 'the man is man ', 'what ever'),
    Quote(
        DateTime.now().millisecondsSinceEpoch, 'the man is man ', 'what ever'),
    Quote(
        DateTime.now().millisecondsSinceEpoch, 'the man is man ', 'what ever'),
    Quote(
        DateTime.now().millisecondsSinceEpoch, 'the man is man ', 'what ever'),
    Quote(
        DateTime.now().millisecondsSinceEpoch, 'the man is man ', 'what ever'),
    Quote(
        DateTime.now().millisecondsSinceEpoch, 'the man is man ', 'what ever'),
    Quote(
        DateTime.now().millisecondsSinceEpoch, 'the man is man ', 'what ever'),
    Quote(
        DateTime.now().millisecondsSinceEpoch, 'the man is man ', 'what ever'),
    Quote(
        DateTime.now().millisecondsSinceEpoch, 'the man is man ', 'what ever'),
    Quote(
        DateTime.now().millisecondsSinceEpoch, 'the man is man ', 'what ever'),
    Quote(
        DateTime.now().millisecondsSinceEpoch, 'the man is man ', 'what ever'),
    Quote(
        DateTime.now().millisecondsSinceEpoch, 'the man is man ', 'what ever'),
    Quote(
        DateTime.now().millisecondsSinceEpoch, 'the man is man ', 'what ever'),
    Quote(
        DateTime.now().millisecondsSinceEpoch, 'the man is man ', 'what ever'),
    Quote(
        DateTime.now().millisecondsSinceEpoch, 'the man is man ', 'what ever'),
    Quote(
        DateTime.now().millisecondsSinceEpoch, 'the man is man ', 'what ever'),
    Quote(
        DateTime.now().millisecondsSinceEpoch, 'the man is man ', 'what ever'),
    Quote(
        DateTime.now().millisecondsSinceEpoch, 'the man is man ', 'what ever'),
  ];

  void addQuote(Quote quote) {
    _quotes.add(quote);
    notifyListeners();
  }

  void deleteQuote(int id) {
    _quotes.removeAt(_quotes.firstWhere((element) => element.id == id).id);
    notifyListeners();
  }

  List<Quote> get quotes => List.unmodifiable(_quotes);
}
