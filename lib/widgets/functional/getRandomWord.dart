import 'package:random_words/random_words.dart';

getRandomWord(){
var word= generateNoun().take(1).toString();
return word.toString().substring(1,word.length-1);
}