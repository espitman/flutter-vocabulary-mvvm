import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocab/view/widgets/word_card.dart';

import '../../view_model/vocab_view_model.dart';

class VocabScreen extends StatefulWidget {
  const VocabScreen({super.key});

  @override
  _VocabScreenState createState() => _VocabScreenState();
}

class _VocabScreenState extends State<VocabScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<VocabViewModel>(context, listen: false).fetchWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocabulary'),
      ),
      body: Consumer<VocabViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  WordCard(
                      word: viewModel.words[viewModel.index],
                      showInfo: viewModel.showInfo,
                      context: context),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: viewModel.showInformation,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                        ),
                        child: Text(!viewModel.showInfo ? 'Show' : 'Hide'),
                      ),
                    ),
                  ),
                  if (!viewModel.isRandom)
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: ElevatedButton(
                                onPressed: viewModel.prev,
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.only(
                                        left: 32,
                                        right: 32,
                                        top: 16,
                                        bottom: 16),
                                    backgroundColor: viewModel.index == 0
                                        ? Colors.grey
                                        : Colors.indigo),
                                child: const Text('Prev'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: ElevatedButton(
                                onPressed: viewModel.next,
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.only(
                                        left: 32,
                                        right: 32,
                                        top: 16,
                                        bottom: 16),
                                    backgroundColor: viewModel.index ==
                                            viewModel.words.length - 1
                                        ? Colors.grey
                                        : Colors.indigo),
                                child: const Text('Next'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (viewModel.isRandom)
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .9,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          onPressed: viewModel.randomize,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.only(
                                left: 32, right: 32, top: 16, bottom: 16),
                          ),
                          child: const Text("Random"),
                        ),
                      ),
                    ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .85,
                    child: Row(
                      children: [
                        Switch(
                          value: viewModel.isRandom,
                          onChanged: viewModel.changeRandomState,
                        ),
                        const Text("random"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
