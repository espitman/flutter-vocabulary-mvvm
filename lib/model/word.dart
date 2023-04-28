class Word {
  final String word;
  final String persian;
  final String description;
  final String oxford;
  final String longman;

  Word({
    required this.word,
    required this.persian,
    required this.description,
    required this.oxford,
    required this.longman,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'],
      persian: json['persian'],
      description: json['description'],
      oxford: json['oxford'],
      longman: json['longman'],
    );
  }
}
