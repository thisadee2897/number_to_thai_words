import 'package:flutter_test/flutter_test.dart';
import 'package:number_to_thai_words/number_to_thai_words.dart';

void main() {
  test('convert number to Thai words', () {
    expect(NumberToThaiWords.convert(123.45), 'หนึ่งร้อยยี่สิบสามบาทสี่สิบห้าสตางค์');
    expect(NumberToThaiWords.convert(1000000), 'หนึ่งล้านบาทถ้วน');
    expect(NumberToThaiWords.convert(9), 'เก้าบาทถ้วน');
  });
}
