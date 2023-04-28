import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/vocabularies_view_model.dart';
import '../widgets/word_bottomSheet.dart';

class VocabulariesScreen extends StatefulWidget {
  @override
  _VocabulariesScreenState createState() => _VocabulariesScreenState();
}

class _VocabulariesScreenState extends State<VocabulariesScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<VocabulariesViewModel>(context, listen: false).fetchWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vocabularies"),
      ),
      body: Center(
        child: Consumer<VocabulariesViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: viewModel.words.length,
              itemBuilder: (context, index) {
                bool isOddRow = index % 2 == 0;
                return Container(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  color: !isOddRow
                      ? const Color.fromRGBO(0, 0, 0, 0.1)
                      : Colors.transparent,
                  child: ListTile(
                    title: Text(
                      viewModel.words[index].word,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4, bottom: 4),
                            child: Text(viewModel.words[index].persian),
                          ), // First subtitle
                          Text(
                            viewModel.words[index].description,
                            style: const TextStyle(height: 1.5),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      showWordBottomSheet(
                          context, viewModel.words[index], "oxford");
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
