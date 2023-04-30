import 'package:flutter/material.dart';
import '../../model/schema/word.dart';
import 'word_bottomSheet.dart';
import 'custom_card.dart';

class WordCard extends StatelessWidget {
  final Word word;
  final bool showInfo;
  final BuildContext context;

  WordCard({required this.word, required this.showInfo, required this.context});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      cardSize: MediaQuery.of(context).size.width * .85,
      child: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                word.word,
                style: const TextStyle(
                    fontSize: 26.0,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold),
              ),
              if (showInfo)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        word.persian,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Text(
                      word.description,
                      style: const TextStyle(fontSize: 14.0, height: 1.5),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Row(
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width * .425 - 22,
                            child: ElevatedButton(
                              onPressed: () {
                                showWordBottomSheet(context, word, "oxford");
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.only(
                                    left: 32, right: 32, top: 4, bottom: 4),
                              ),
                              child: const Text("Oxford"),
                            ),
                          ),
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width * .425 - 22,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: ElevatedButton(
                                onPressed: () {
                                  showWordBottomSheet(context, word, "longman");
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.only(
                                      left: 32, right: 32, top: 4, bottom: 4),
                                ),
                                child: const Text("Longman"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
