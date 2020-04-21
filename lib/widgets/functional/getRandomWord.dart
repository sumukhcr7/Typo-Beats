import 'package:random_words/random_words.dart';
import 'level-2/Level2StartWidget.dart';

getRandomWord() {
  var wordList = generateNoun().take(numberOfWords).toList();
  return wordList;
}
