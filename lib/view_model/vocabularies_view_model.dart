import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../model/database/isar_service.dart';
import '../model/repository/word_repository.dart';
import '../model/word.dart';

class VocabulariesViewModel with ChangeNotifier {
  final Isar isar;
  VocabulariesViewModel(this.isar);

  List<Word> _words = [];
  bool _isLoading = true;

  List<Word> get words => _words;
  bool get isLoading => _isLoading;

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
}
