import 'package:isar/isar.dart';
import 'package:vocab/model/api/word_api.dart';
import 'package:vocab/model/database/word_database.dart';

import '../schema/word.dart';

class WordRepository {
  final Isar _isar;
  late WordAPI _wordAPI;
  late WordDatabase _wordDatabase;

  WordRepository(this._isar) {
    _wordAPI = WordAPI();
    _wordDatabase = WordDatabase(_isar);
  }

  Future<List<Word>> fetchWordList() async {
    final wordsList = await _wordDatabase.fetchWordList();
    if (wordsList.isNotEmpty) {
      return wordsList;
    }
    dynamic words = await _wordAPI.getWords();
    await _wordDatabase.insertAll(words);
    return words;
  }

  Future<void> sync() async {
    await _wordDatabase.clearDB();
  }
}
