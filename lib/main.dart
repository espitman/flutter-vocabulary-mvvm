import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocab/view/screen/home.dart';
import 'package:vocab/view_model/vocab_view_model.dart';
import 'package:vocab/view_model/vocabularies_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<VocabulariesViewModel>(
          create: (_) => VocabulariesViewModel(),
        ),
        ChangeNotifierProvider<VocabViewModel>(
          create: (_) => VocabViewModel(),
        )
      ],
      child: const MaterialApp(
        title: 'My App',
        home: MyHomePage(title: 'Vocabulary'),
      ),
    );
  }
}
