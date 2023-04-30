import 'package:isar/isar.dart';

import '../schema/word.dart';

class WordDatabase {
  final Isar _isar;
  WordDatabase(this._isar);

  Future<List<Word>> fetchWordList() async {
    final wordsList = await _isar.words.where().findAll();
    return wordsList;
  }

  Future<void> clearDB() async {
    await _isar.writeTxn(() async {
      await _isar.words.clear();
    });
  }

  Future<void> insertAll(List<Word> words) async {
    await _isar.writeTxn(() async {
      await _isar.words.putAll(words);
    });
  }
}
