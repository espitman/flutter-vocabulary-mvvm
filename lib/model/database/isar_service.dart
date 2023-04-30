import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../word.dart';

class IsarService {
  static Future<Isar> get() async {
    final dir = await getApplicationDocumentsDirectory();
    Isar isar = await Isar.open(
      [WordSchema],
      directory: dir.path,
    );
    return isar;
  }
}
