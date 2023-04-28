import 'package:flutter/material.dart';
import 'package:vocab/view/screen/vocab.dart';
import 'package:vocab/view/screen/vocabularies.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VocabulariesScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(
                        left: 32, right: 32, top: 16, bottom: 16),
                  ),
                  child: const Text('Vocabularies List'),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VocabScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(
                        left: 32, right: 32, top: 16, bottom: 16),
                  ),
                  child: const Text('Vocabulary'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
