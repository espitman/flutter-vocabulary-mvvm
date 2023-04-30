import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../model/repository/word_repository.dart';
import '../model/word.dart';

class HomeViewModel with ChangeNotifier {
  final Isar isar;
  HomeViewModel(this.isar);

  void syncWords() {
    WordRepository(isar).sync();
  }
}
