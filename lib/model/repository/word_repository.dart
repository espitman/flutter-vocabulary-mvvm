import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:vocab/model/database/word_database.dart';

import '../service/word_service.dart';
import '../word.dart';

class WordRepository {
  final Isar _isar;
  late WordService _wordService;
  late WordDatabase _wordDatabase;

  WordRepository(this._isar) {
    _wordService = WordService();
    _wordDatabase = WordDatabase(_isar);
  }

  Future<List<Word>> fetchWordList() async {
    final wordsList = await _wordDatabase.fetchWordList();
    if (wordsList.isNotEmpty) {
      return wordsList;
    }
    //=================================================
    dynamic response = await _wordService.getWords();
    final List<dynamic> responseData = jsonDecode(response);
    List<Word> words =
        responseData.map((postJson) => Word.fromJson(postJson)).toList();

    await _isar.writeTxn(() async {
      await _isar.words.putAll(words);
    });

    return words;
  }

  Future<void> sync() async {
    await _wordDatabase.clearDB();
  }
}
