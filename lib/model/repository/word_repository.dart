import 'dart:convert';

import '../service/word_service.dart';
import '../word.dart';

class WordRepository {
  final WordService _wordService = WordService();

  Future<List<Word>> fetchWordList() async {
    dynamic response = await _wordService.getWords();
    final List<dynamic> responseData = jsonDecode(response);
    List<Word> words =
        responseData.map((postJson) => Word.fromJson(postJson)).toList();
    return words;
  }
}
