import 'package:flash_cards/data/words.dart';
import 'package:flutter/material.dart';

import 'flash_card.dart';

class FlashCardPageView extends StatefulWidget {
  @override
  _FlashCardPageViewState createState() => _FlashCardPageViewState();
}

class _FlashCardPageViewState extends State<FlashCardPageView> {
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
      appBar: AppBar(
        title: Text(
          'Single Card',
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
            itemCount: shuffledWords.length,
            itemBuilder: (context, i) {
              String key = shuffledWords[i].keys.elementAt(0);
              String value = shuffledWords[i][key];
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
