import 'dart:convert';
import 'package:http/http.dart' as http;

class WordService {
  Future<String> getWords() async {
    final response =
        await http.get(Uri.parse('https://english.boum.ir/words.php'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }
}
