import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';

import '../model/repository/word_repository.dart';
import '../model/schema/word.dart';

class VocabViewModel with ChangeNotifier {
  final Isar isar;
  VocabViewModel(this.isar);

  List<Word> _words = [];
  bool _isLoading = true;
  int _index = 0;
  bool _showInfo = false;
  bool _isRandom = false;

  List<Word> get words => _words;
  bool get isLoading => _isLoading;
  int get index => _index;
  bool get showInfo => _showInfo;
  bool get isRandom => _isRandom;

  Future<void> fetchWords() async {
    _isLoading = true;
    notifyListeners();
    try {
      List<Word> wordList = await WordRepository(isar).fetchWordList();
      _words = wordList;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }

  void next() {
    if (_index < _words.length - 1) {
      _showInfo = false;
      _index++;
      notifyListeners();
    }
  }

  void prev() {
    if (_index > 0) {
      _showInfo = false;
      _index--;
      notifyListeners();
    }
  }

  void randomize() {
    int min = 0;
    int max = words.length - 1;
    Random random = Random();
    int randomNumber = min + random.nextInt(max - min + 1);
    _showInfo = false;
    _index = randomNumber;
    notifyListeners();
  }

  void showInformation() {
    _showInfo = !_showInfo;
    notifyListeners();
  }

  void changeRandomState(value) {
    _isRandom = value;
    notifyListeners();
  }
}
