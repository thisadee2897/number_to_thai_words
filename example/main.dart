import 'package:flutter/foundation.dart';
import 'package:number_to_thai_words/number_to_thai_words.dart';

void main() {
  const double number = 123456.00;
  final String thaiWords = NumberToThaiWords.convert(number);
  if (kDebugMode) print(thaiWords); // หนึ่งแสนยี่หมื่นสามพันสี่ร้อยห้าสิบหกบาทถ้วน
}
