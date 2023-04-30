import 'dart:convert';
import 'package:http/http.dart' as http;

import '../schema/word.dart';

class WordAPI {
  Future<List<Word>> getWords() async {
    final response =
        await http.get(Uri.parse('https://english.boum.ir/words.php'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      List<Word> words =
          responseData.map((postJson) => Word.fromJson(postJson)).toList();
      return words;
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }
}
