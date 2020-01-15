import 'package:flash_cards/data/words.dart';
import 'package:flutter/material.dart';

import 'flash_card.dart';

class FlashCardListView extends StatefulWidget {
  @override
  _FlashCardListViewState createState() => _FlashCardListViewState();
}

class _FlashCardListViewState extends State<FlashCardListView> {
  bool _spanishTop = true;
  List<Map<String, String>> shuffledWords = words;

  void _flipCards() {
    setState(() {
      _spanishTop = !_spanishTop;
    });
  }

  void _shuffleCards() {
    setState(() {
      shuffledWords = shuffledWords.toList()..shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          'List',
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
          // width: MediaQuery.of(context).size.width * .95,
          child: ListView.builder(
            itemCount: shuffledWords.length,
            itemBuilder: (context, i) {
              String key = shuffledWords[i].keys.elementAt(0);
              String value = shuffledWords[i][key];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                child: FlashCard(
                  spanishTop: _spanishTop,
                  spanishWord: key,
                  englishWord: value,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
