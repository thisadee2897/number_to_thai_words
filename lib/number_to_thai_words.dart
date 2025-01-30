library number_to_thai_words;

/// This class provides the functionality to convert numbers to Thai words.
/// It includes a method to convert an integer into its Thai representation.
class NumberToThaiWords {
  static const List<String> _units = <String>['', 'หนึ่ง', 'สอง', 'สาม', 'สี่', 'ห้า', 'หก', 'เจ็ด', 'แปด', 'เก้า'];
  static const List<String> _scales = <String>['', 'สิบ', 'ร้อย', 'พัน', 'หมื่น', 'แสน', 'ล้าน'];
/// Converts an integer number into its Thai word representation.
///
/// This method is a helper function used by the `convert` method to convert
/// integer numbers into their corresponding Thai words. It handles scales like
/// 'สิบ', 'ร้อย', 'พัน', etc., and formats the number accordingly.
///
/// - Parameter number: The integer number to be converted.
/// - Returns: The Thai words representation of the number.
  static String _convertNumberToThaiWords(int number) {
    String words = '';
    int scaleIndex = 0;

    while (number > 0) {
      if (scaleIndex == 6) {
        int millionPart = number ~/ 1000000;
        words = '${_convertNumberToThaiWords(millionPart)}ล้าน$words';
        number %= 1000000;
        scaleIndex = 0;
        continue;
      }

      int digit = number % 10;
      if (digit != 0) {
        if (scaleIndex == 1) {
          if (digit == 1) {
            words = 'สิบ$words';
          } else if (digit == 2) {
            words = 'ยี่สิบ$words';
          } else {
            words = '${_units[digit]}สิบ$words';
          }
        } else if (scaleIndex == 0 && digit == 1 && number ~/ 10 != 0) {
          words = 'เอ็ด$words';
        } else {
          words = _units[digit] + _scales[scaleIndex] + words;
        }
      }

      number ~/= 10;
      scaleIndex++;
    }

    return words;
  }

  /// Converts a numeric amount (in Baht and Satang) to its Thai words representation.
  ///
  /// This method takes a double value representing an amount in Baht and Satang
  /// and converts it into Thai words. For example, the value `123.45` would be converted
  /// to "หนึ่งร้อยยี่สิบสามบาทสี่สิบห้าสตางค์".
  ///
  /// - Parameter amount: The numeric amount to be converted.
  /// - Returns: The Thai words representation of the amount.
  static String convert(double amount) {
    int baht = amount.floor();
    int satang = ((amount - baht) * 100).round();

    String bahtText = _convertNumberToThaiWords(baht);
    String satangText = _convertNumberToThaiWords(satang);

    String result = '$bahtTextบาท';
    if (satang > 0) {
      result += '$satangTextสตางค์';
    } else {
      result += 'ถ้วน';
    }

    return result;
  }
}
