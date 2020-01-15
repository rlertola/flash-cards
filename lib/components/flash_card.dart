import 'package:flash_cards/providers/vocab_provider.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:provider/provider.dart';

class FlashCard extends StatefulWidget {
  final String spanishWord;
  final String englishWord;
  final bool spanishTop;

  FlashCard({
    this.spanishWord,
    this.englishWord,
    this.spanishTop,
  });

  @override
  _FlashCardState createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  @override
  Widget build(BuildContext context) {
    Container spanishSide = cardSide(widget.spanishWord, Colors.black26);
    Container englishSide = cardSide(widget.englishWord, Colors.greenAccent);

    return FlipCard(
      direction: FlipDirection.VERTICAL,
      front: widget.spanishTop ? spanishSide : englishSide,
      back: !widget.spanishTop ? spanishSide : englishSide,
    );
  }
}

Container cardSide(String word, Color cardColor) {
  Color textColor;
  if (cardColor == Colors.greenAccent) {
    textColor = Colors.black87;
  } else {
    textColor = Colors.greenAccent;
  }
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
    decoration: BoxDecoration(
      color: cardColor,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    child: Text(
      word,
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    ),
  );
}
