import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';

import '../model/repository/word_repository.dart';

class HomeViewModel with ChangeNotifier {
  final Isar isar;
  HomeViewModel(this.isar);

  void syncWords() {
    WordRepository(isar).sync();
  }
}
