import 'package:number_to_thai_words/number_to_thai_words.dart';

void main() {
  final number = 123456.00;
  final thaiWords = NumberToThaiWords.convert(number);
  print('The number $number in Thai words is: $thaiWords');
}
