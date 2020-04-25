import 'package:HYPER_SYNK/widgets/functional/level-1/Level1StartWidget.dart';
import 'package:random_words/random_words.dart';
//import 'level-2/Level2StartWidget.dart';

getRandomWord() {
  var wordList = generateNoun().take(numberOfWords).toList();
  return wordList;
}
