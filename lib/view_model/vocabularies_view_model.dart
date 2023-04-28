import 'package:flutter/cupertino.dart';

import '../model/repository/word_repository.dart';
import '../model/word.dart';

class VocabulariesViewModel with ChangeNotifier {
  List<Word> _words = [];
  bool _isLoading = true;

  List<Word> get words => _words;
  bool get isLoading => _isLoading;

  Future<void> fetchWords() async {
    _isLoading = true;
    notifyListeners();
    try {
      List<Word> wordList = await WordRepository().fetchWordList();
      _words = wordList;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }
}
