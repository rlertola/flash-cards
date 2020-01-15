import 'dart:collection';
import 'dart:convert';

import 'package:flash_cards/components/flash_card.dart';
import 'package:flash_cards/data/words.dart';
import 'package:flash_cards/utils/api.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

const String url =
    'https://www.dictionaryapi.com/api/v3/references/spanish/json/';
const String withKey = '?key=$APIKEY';

class VocabProvider extends ChangeNotifier {
  List<FlashCard> _flashCards = [];
  String spanishWord;
  String englishWord;
  bool spanishOnTop;

  Future<void> getWords(String word) async {
    String getWordsUrl = '$url$word$withKey';
    print('called');
    http.Response response = await http.get(getWordsUrl);
    var decoded = jsonDecode(response.body);
    print(decoded);

    notifyListeners();
  }
}
