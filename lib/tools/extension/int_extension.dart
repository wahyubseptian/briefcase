extension IntExtensions on int {
  /// Converts the integer to a string with thousands separator, e.g., 1,000
  String toFormattedString() {
    return toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }

  /// Checks if the integer is even
  bool isEvenNumber() => this % 2 == 0;

  /// Checks if the integer is odd
  bool isOddNumber() => this % 2 != 0;

  /// Converts the integer to its ordinal representation (e.g., 1st, 2nd, 3rd)
  String toOrdinal() {
    if (this % 100 >= 11 && this % 100 <= 13) {
      return "${this}th";
    }
    switch (this % 10) {
      case 1:
        return "${this}st";
      case 2:
        return "${this}nd";
      case 3:
        return "${this}rd";
      default:
        return "${this}th";
    }
  }

  /// Converts the integer to its English word representation (1 to 9999)
  String toWords() {
    if (this < 0 || this > 9999) return "$this";
    final units = [
      "zero",
      "one",
      "two",
      "three",
      "four",
      "five",
      "six",
      "seven",
      "eight",
      "nine"
    ];
    final teens = [
      "",
      "eleven",
      "twelve",
      "thirteen",
      "fourteen",
      "fifteen",
      "sixteen",
      "seventeen",
      "eighteen",
      "nineteen"
    ];
    final tens = [
      "",
      "ten",
      "twenty",
      "thirty",
      "forty",
      "fifty",
      "sixty",
      "seventy",
      "eighty",
      "ninety"
    ];
    final thousands = ["", "thousand"];

    if (this == 0) return "zero";

    String words = "";
    int num = this;

    if (num >= 1000) {
      words += "${units[num ~/ 1000]} thousand ";
      num %= 1000;
    }
    if (num >= 100) {
      words += "${units[num ~/ 100]} hundred ";
      num %= 100;
    }
    if (num >= 11 && num <= 19) {
      words += teens[num - 10];
      return words.trim();
    } else if (num >= 10) {
      words += tens[num ~/ 10];
      num %= 10;
    }
    if (num > 0) {
      words += " ${units[num]}";
    }

    return words.trim();
  }

  /// Limits the integer to a given maximum and minimum range
  int clampInt(int min, int max) {
    if (this < min) return min;
    if (this > max) return max;
    return this;
  }

  /// Returns the factorial of the integer (e.g., 5.factorial() == 120)
  int factorial() {
    if (this < 0) throw ArgumentError("Negative numbers are not allowed.");
    if (this == 0 || this == 1) return 1;
    return List.generate(this, (i) => i + 1).reduce((a, b) => a * b);
  }
}
