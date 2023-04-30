import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:vocab/model/database/isar_service.dart';
import 'package:vocab/view/screen/home.dart';
import 'package:vocab/view_model/vocab_view_model.dart';
import 'package:vocab/view_model/vocabularies_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await IsarService.get();
  runApp(MyApp(isar: isar));
}

class MyApp extends StatelessWidget {
  final Isar isar;

  const MyApp({Key? key, required this.isar}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<VocabulariesViewModel>(
          create: (_) => VocabulariesViewModel(isar),
        ),
        ChangeNotifierProvider<VocabViewModel>(
          create: (_) => VocabViewModel(isar),
        )
      ],
      child: MaterialApp(
        title: 'My App',
        home: MyHomePage(
          title: 'Vocabulary',
          isar: isar,
        ),
      ),
    );
  }
}
