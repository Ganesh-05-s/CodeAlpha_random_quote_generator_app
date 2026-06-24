import 'dart:math';
import 'package:flutter/material.dart';
import '../models/quote_model.dart';
import '../data/quotes_data.dart';

class QuoteProvider extends ChangeNotifier {
  Quote? _currentQuote;
  late Quote _dailyQuote;
  final Random _random = Random();
  final Set<String> _favoriteQuoteIds = {};
  
  String? _selectedCategory;

  QuoteProvider() {
    _initDailyQuote();
  }

  void _initDailyQuote() {
    if (quotesData.isNotEmpty) {
      _dailyQuote = quotesData[_random.nextInt(quotesData.length)];
    } else {
      _dailyQuote = const Quote(id: '0', quote: 'No quotes available.', author: 'System', category: 'None');
    }
  }

  Quote get dailyQuote => _dailyQuote;

  String? get selectedCategory => _selectedCategory;

  void setCategory(String category) {
    _selectedCategory = category;
    _generateRandomQuote();
    notifyListeners();
  }

  List<Quote> get filteredQuotes {
    if (_selectedCategory == null) {
      return quotesData;
    }
    return quotesData.where((q) => q.category == _selectedCategory).toList();
  }

  Quote get currentQuote {
    if (_currentQuote == null) {
      _generateRandomQuote();
    }
    return _currentQuote ?? quotesData.first;
  }

  bool get isFavorite {
    if (_currentQuote == null) return false;
    return _favoriteQuoteIds.contains(_currentQuote!.id);
  }

  List<Quote> get favoriteQuotes {
    return quotesData.where((q) => _favoriteQuoteIds.contains(q.id)).toList();
  }

  void generateNewQuote() {
    _generateRandomQuote();
    notifyListeners();
  }

  void toggleFavorite([Quote? quote]) {
    final targetQuote = quote ?? _currentQuote;
    if (targetQuote == null) return;
    
    if (_favoriteQuoteIds.contains(targetQuote.id)) {
      _favoriteQuoteIds.remove(targetQuote.id);
    } else {
      _favoriteQuoteIds.add(targetQuote.id);
    }
    notifyListeners();
  }

  void _generateRandomQuote() {
    final availableQuotes = filteredQuotes;
    if (availableQuotes.isEmpty) return;
    
    if (availableQuotes.length == 1) {
      _currentQuote = availableQuotes.first;
      return;
    }

    Quote newQuote;
    do {
      int randomIndex = _random.nextInt(availableQuotes.length);
      newQuote = availableQuotes[randomIndex];
    } while (_currentQuote != null && _currentQuote!.id == newQuote.id);
    
    _currentQuote = newQuote;
  }
}
