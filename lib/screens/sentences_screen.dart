import 'package:flash_cards/components/flash_card.dart';
import 'package:flutter/material.dart';

import 'package:flash_cards/data/sentences.dart';

class SentencesScreen extends StatefulWidget {
  @override
  _SentencesScreenState createState() => _SentencesScreenState();
}

class _SentencesScreenState extends State<SentencesScreen> {
  bool _spanishTop = true;
  List<Map<String, String>> shuffledSentences = sentences;

  void _flipCards() {
    setState(() {
      _spanishTop = !_spanishTop;
    });
  }

  void _shuffleCards() {
    setState(() {
      shuffledSentences = shuffledSentences.toList()..shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sentences',
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: _flipCards,
            child: _spanishTop
                ? Icon(Icons.flip_to_front)
                : Icon(Icons.flip_to_back),
          ),
          MaterialButton(
            onPressed: _shuffleCards,
            child: Icon(Icons.shuffle),
          )
        ],
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .95,
          height: MediaQuery.of(context).size.height * .35,
          child: PageView.builder(
            itemCount: shuffledSentences.length,
            itemBuilder: (context, i) {
              String key = shuffledSentences[i].keys.elementAt(0);
              String value = shuffledSentences[i][key];
              return Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 10,
                  ),
                  child: FlashCard(
                    spanishTop: _spanishTop,
                    spanishWord: key,
                    englishWord: value,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
