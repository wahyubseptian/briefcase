extension StringExtensions on String {
  /// Capitalizes the first letter of the string.
  String capitalize() {
    if (isEmpty) return "";
    return this[0].toUpperCase() + substring(1);
  }

  /// Capitalizes the first letter of each word in the string.
  String toTitleCase() {
    return split(' ').map((word) => word.capitalize()).join(' ');
  }

  /// Checks if the string contains only numeric characters.
  bool isNumeric() {
    return double.tryParse(this) != null;
  }

  /// Checks if the string is a valid email.
  bool isValidEmail() {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(this);
  }

  /// Converts snake_case or kebab-case to camelCase
  String toCamelCase() {
    final words = split(RegExp(r'[_-]'));
    return words.first + words.skip(1).map((w) => w.capitalize()).join();
  }

  /// Limits the length of the string, adding "..." if it exceeds maxLength.
  String truncate(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }

  /// Reverses the string.
  String reverse() {
    return split('').reversed.join();
  }

  /// Removes all white spaces from the string.
  String removeWhitespace() {
    return replaceAll(RegExp(r'\s+'), '');
  }

  /// Converts the string to an integer, if possible. Returns `null` if not.
  int? toIntOrNull() {
    return int.tryParse(this);
  }

  /// Converts the string to a double, if possible. Returns `null` if not.
  double? toDoubleOrNull() {
    return double.tryParse(this);
  }
}
